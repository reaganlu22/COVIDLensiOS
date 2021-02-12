
//
//  Created by Seth Goodwin on 10/5/20.
//
import SwiftUI


import CoreLocation
import Foundation
import SwiftKeychainWrapper
import CommonCrypto
class UserData {
    static let USER_ID = "USER_ID"
    static let PASSWORD = "PASSWORD"
    static let SIGNED_IN = "SIGNED_IN"
    static let GOOGLE_ID = "GOOGLE_ID"
    static let USER_EMAIL = "EMAIL"
    static let NO_USER = "NO_USER"
    static let USER_STORE = "USER_STORE"
    private let REQUEST_CATCHER_URL = "https://www.covidlensapp.com/request-catcher"
    private let USER_CREATION = "USER_CREATION"
    private let USER_SIGN_IN = "USER_SIGN_IN"
    private let USER_SIGN_OUT = "USER_SIGN_OUT"
    private let USER_DATA_REQUEST = "USER_DATA_REQUEST"
    private let USER_SAVE = "USER_SAVE"
    private var dataResponse: [String: Any]!
    private let submissionSemaphore = DispatchSemaphore(value: 0)

    /**
     This function creates a new user
     - Returns: true is returned if creation was successful otherwise false
     */
    func createUser(newUser: User) -> Bool {
        UserDefaults.standard.setValue(false, forKey: UserData.SIGNED_IN)
        if UserDefaults.standard.bool(forKey: UserData.SIGNED_IN) == false {
            var uuid = createUUID()
            if isValidEmail(newUser.getEmail()) && isValidPassword(newUser.getPassword()) {
                // attempt multiple times in case ID already existed for another user
                var attempt = 5
                repeat {
                    var parameters = [String: Any]()
                    let userID = uuid
                    var userWithID = newUser
                    //giving a new user an id
                    userWithID.setBasicID(basicID: userID)
                    parameters["request"] = USER_CREATION
                    do {
                        parameters["userData"] = String(data: try JSONEncoder().encode(userWithID), encoding: .utf8)
                        //parameters["userData"] = "some data"
                    } catch {
                        // probably should handle this better...
                        parameters["userData"] = ""
                    }
                    parameters["userEmail"] = userWithID.getEmail()
                    // if user has a google id
                    if userWithID.getGoogleID() != "" {
                        parameters["userPassword"] = userWithID.getGoogleID()
                    }else{
                        //user does not have a google id
                        parameters["userPassword"] = userWithID.getPassword()
                    }
                    parameters["userPassword"] = userWithID.getPassword()
                    parameters["userID"] = userID
                    parameters["googleID"] = userWithID.getGoogleID()
                    parameters["signedIn"] = true
                    postData(parameters: parameters, postUrl: REQUEST_CATCHER_URL)

                    // waiting for response from server
                    submissionSemaphore.wait()
                    if dataResponse != nil && dataResponse!["status"] as? String == "SUCCESS" {
                        // user is now logged in
                        UserDefaults.standard.setValue(userWithID.getLoggedIn(), forKey: UserData.SIGNED_IN)                        //storing data securely using keychain
                        return storeCredentials(user: userWithID)
                    } else {
                        uuid = createUUID()
                        attempt -= attempt
                    }
                } while attempt > 0
            }
        }
        return false
    }

    /**
     This function loads an existing user or signs them in if they were logged out
     - Returns: true is returned if load/signin was successful
     */
    func loadUser(user: User) -> Bool {
        var parameters = [String: Any]()
        parameters["request"] = USER_SIGN_IN
        do {
            parameters["userData"] = String(data: try JSONEncoder().encode(user), encoding: .utf8)
        } catch  {
            // probably should handle this better...
            parameters["userData"] = ""
        }
        parameters["signedIn"] = user.getLoggedIn() //false
        // not signed in
        if UserDefaults.standard.bool(forKey: UserData.SIGNED_IN) == false {
            parameters["email"] = user.getEmail()
            parameters["password"] = user.getPassword()
            parameters["userID"] = user.getBasicId()
            parameters["googleID"] = user.getGoogleID()
            
            // check if user credentials found in database
            postData(parameters: parameters, postUrl: REQUEST_CATCHER_URL)

            // waiting for response from server
            submissionSemaphore.wait()

            if dataResponse != nil && dataResponse!["status"] as? String == "SUCCESS" {
                //store credentials
                let str = (dataResponse["data"] as! String).base64Decoded
                let data = Data(str!.utf8)

                do {
                    // make sure this JSON is in the format we expect
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        dataResponse["data"] = json
                        return storeCredentials(user: user)
                    }
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
            }
        }else{
            // retrieve credentials from keychain
            let credentials = retreiveCredentials()
            parameters["email"] = credentials[UserData.USER_EMAIL]
            parameters["password"] = credentials[UserData.PASSWORD]
            parameters["userID"] = credentials[UserData.USER_ID]
            parameters["googleID"] = credentials[UserData.GOOGLE_ID]
            postData(parameters: parameters, postUrl: REQUEST_CATCHER_URL)
            // waiting for response from server
            submissionSemaphore.wait()
            if dataResponse!["status"] as? String == "SUCCESS"{
                // signed in
                UserDefaults.standard.setValue(user.getLoggedIn(), forKey: UserData.SIGNED_IN)
                return true
            }
        }
        return false
    }
    
    /**
        This function stores the users credentials securely using keychain
     - Returns true if successfully stored
     */
    func storeCredentials(user: User) ->Bool {
        //storing data securely using keychain
        let emailSaved: Bool = KeychainWrapper.standard.set(user.getEmail(), forKey: UserData.USER_EMAIL)
        let passwordSaved: Bool = KeychainWrapper.standard.set(user.getPassword(), forKey: UserData.PASSWORD)
        let userIDSaved: Bool = KeychainWrapper.standard.set(user.getBasicId(), forKey: UserData.USER_ID)
        if user.getGoogleID() != "" {
            let googleUser = KeychainWrapper.standard.set(user.getGoogleID(), forKey: UserData.GOOGLE_ID)
            return emailSaved && passwordSaved && userIDSaved && googleUser
        }
        return emailSaved && passwordSaved && userIDSaved
        
    }
    
    func retreiveCredentials() -> [String:Any] {
        if UserDefaults.standard.bool(forKey: UserData.SIGNED_IN){
            return [UserData.USER_EMAIL: KeychainWrapper.standard.string(forKey: UserData.USER_EMAIL) ?? "",UserData.PASSWORD: KeychainWrapper.standard.string(forKey: UserData.PASSWORD) ?? "",
                    UserData.USER_ID: KeychainWrapper.standard.string(forKey: UserData.USER_ID) ?? "",
                    UserData.GOOGLE_ID: KeychainWrapper.standard.string(forKey: UserData.GOOGLE_ID) ?? ""]
        }
        return [:]
    }
    
    func removeCredentials() -> Bool {
        return KeychainWrapper.standard.removeAllKeys()
    }
    
    func save(user: User) -> Bool{
        if UserDefaults.standard.bool(forKey: UserData.SIGNED_IN){
            var parameters = [String: Any]()
            parameters["request"] = USER_SAVE
            do {
                parameters["userData"] = String(data: try JSONEncoder().encode(user), encoding: .utf8)
            } catch  {
                // probably should handle this better...
                parameters["userData"] = ""
            }
            parameters["email"] = user.getEmail()
            parameters["password"] = user.getPassword()
            parameters["userID"] = user.getBasicId()
            parameters["googleID"] = user.getGoogleID()
            parameters["signedIn"] = user.getLoggedIn()
            if user.getLoggedIn() == false {
                parameters["request"] = USER_SIGN_OUT
            }
            postData(parameters: parameters, postUrl: REQUEST_CATCHER_URL)
            // waiting for response from server
            submissionSemaphore.wait()

            if dataResponse != nil, dataResponse!["status"] as? String == "SUCCESS" {
            
                // simple storage of user in defaults after removing sensitive data
                /*
                var simpleUser = user
                simpleUser.setBasicID(basicID: "")
                simpleUser.setPassword(password: "")
                simpleUser.setEmail(email: "")
                simpleUser.setGoogleID(googleID: "")
                simpleUser.setReport(report: Report(age: 0, phoneNumber: "NA", residenceHall: "NA", affiliation: "NA", locationID: "NA", reportStatus: "NA", reportInfo: "NA", situationDescription: "NA", confirmerID: "NA", submitterID:"NA", reportID: "NA"))
                //storing json user
                var userJson = ""
                do {
                    userJson = String(data: try JSONEncoder().encode(simpleUser), encoding: .utf8) ?? ""
                } catch  {
                }
                UserDefaults.standard.setValue(userJson, forKey: UserData.USER_STORE)
                 */
                // store credentials just in case they have been updated
                return storeCredentials(user: user)
            }
        }
        return false
    }

    func logout(user: User) -> Bool{
        var loggedOutUser =  user
        loggedOutUser.setLoggedIn(status: true)
        let response = save(user: loggedOutUser)
        // if save was successful, user will be logged out
        if response{
            UserDefaults.standard.setValue(loggedOutUser.getLoggedIn(), forKey: UserData.SIGNED_IN)
        }
        return response && removeCredentials()
    }

    /**
     This function is used for updating the apps data
     - Returns:true if update was successful and false if not
     */
    func DataRequest(user: User?) -> Bool {

        var parameters = [String: Any]()
        // if already logged in
        if UserDefaults.standard.bool(forKey: UserData.SIGNED_IN){
            // retrieve credentials from keychain
            let credentials = retreiveCredentials()
            parameters["email"] = credentials[UserData.USER_EMAIL]
            parameters["password"] = credentials[UserData.PASSWORD]
            parameters["userID"] = credentials[UserData.USER_ID]
            parameters["googleID"] = credentials[UserData.GOOGLE_ID]
            postData(parameters: parameters, postUrl: REQUEST_CATCHER_URL)
            submissionSemaphore.wait()
        } else {
            print("in else")
            parameters["request"] = USER_DATA_REQUEST
            do {
                parameters["userData"] = String(data: try JSONEncoder().encode(user), encoding: .utf8)
            } catch  {
                // probably should handle this better...
                parameters["userData"] = ""
            }
            print("setting post values")
            parameters["email"] = user?.getEmail()
            parameters["password"] = user?.getPassword()
            parameters["userID"] = user?.getBasicId()
            parameters["googleID"] = user?.getGoogleID()
            parameters["signedIn"] = user?.getLoggedIn()
            postData(parameters: parameters, postUrl: REQUEST_CATCHER_URL)
            // waiting for response from server
            submissionSemaphore.wait()
        }
        //dataResponse = ["status": "SUCCESS", "data": ""]
        if dataResponse != nil && dataResponse!["status"] as? String == "SUCCESS" {
            // do something
            print("success")
            return true

        }
        return false
    }

    /**
        This function returns the data received from the most recent request
        - Returns: [String:Any]
     */
    func getResponse() -> [String:Any]{
        var dict: [String:Any] = [:]
        if self.dataResponse != nil{
            dump(dataResponse)
            for (key, value) in self.dataResponse{
                dict[key] = value is NSNull ? "": value
            }
        } else {
            print("data is nil")
        }
        return dict
    }
    
    func decodeUser(jsonUserData: String) -> User {
        let jsonDecoder = JSONDecoder()
        var user:User
        do{
             user = try jsonDecoder.decode(User.self, from: Data(jsonUserData.utf8))
        } catch{
            user = User()
        }
        return user
    }
    
 

    /**
     This function creates a unique identifier for the app user
     */
    private func createUUID() -> String {
        return NSUUID().uuidString
    }

    /**
     This function checks a string to see if it is a valid email address
     - Returns: true if valid, false if invalid
     */
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    /**
     This function checks a string to see if it is a valid password
     - Returns: true if valid, false if invlid
     */
    private func isValidPassword(_ testStr: String?) -> Bool {
        guard testStr != nil else { return false }

        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 8 characters total
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with: testStr)
    }

    /**
     This function sends data to the  server
     */
    private func postData(parameters: [String: Any], postUrl: String) {
        let url = URL(string: postUrl)!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        request.httpBody = parameters.percentEncoded()

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  error == nil else { // check for fundamental networking error
                print("error", error ?? "Unknown error")
                return
            }

            guard (200 ... 299) ~= response.statusCode else { // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }
            print(String(data: data, encoding: .utf8)!)
            self.dataResponse = self.convertToDictionary(text: String(data: data, encoding: .utf8)!)

            // using semaphores to signal other processes to let them execute after data transfers
            if postUrl == self.REQUEST_CATCHER_URL {
                self.submissionSemaphore.signal()
            }
        }
        task.resume()
    }
    //
    //
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }




    /**
     This function converts a json string to a dictionary
     */
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }


}


extension Dictionary {
    func percentEncoded() -> Data? {
        return map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}

public extension String {
    var base64Decoded: String? {
        guard let decodedData = Data(base64Encoded: self) else { return nil }
        return String(data: decodedData, encoding: .utf8)
    }
}
