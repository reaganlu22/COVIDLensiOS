
//
//  Created by Seth Goodwin on 10/5/20.
//
import SwiftUI


import CoreLocation
import Foundation

class UserData {
    static let ID = "USER_ID"
    static let EMAIL = "EMAIL"
    static let PASSWORD = "PASSWORD"
    static let LOGGED_IN = "LOGGED_IN"
    static let NO_USER = "NO_USER"
    private let SUBMISSION_CATCHER_URL = "http://http://192.168.10.105/PersonGraphServerSide/controllers/SubmissionCatcher.php"
    private var active: Bool!
    static let NO_RESPONSE = "NONE"
    private var dataResponse: [String: Any]!
    private var test: String = ""
    private let submissionSemaphore = DispatchSemaphore(value: 0)
    
  
    /**
        This function creates a new user
        - Returns: true is returned if creation was successful otherwise false
     */
    func createUser(newUser: (email: String, password: String, name: String, day: String, month: String, year: String)) -> Bool {
        if UserDefaults.standard.bool(forKey: UserConnect.LOGGED_IN) == false {
            var uuid = createUUID()
            self.user = Person(id: uuid)
            //REMEMBER TO VALIDATE DOB BEFORE STORING
            print("email ",isValidEmail(newUser.email)," pass ", isValidPassword(newUser.password))
            if isValidEmail(newUser.email), isValidPassword(newUser.password) {
                // attempt multiple times in case UUID already existed for another user
                var attempt = 5
                repeat {
                    var parameters = [String: Any]()
                    parameters["requestType"] = "addNewUser"
                    parameters["activeStatus"] = true
                    parameters["lat"] = user?.getCurrentLocation().coordinate.latitude
                    parameters["lon"] = user?.getCurrentLocation().coordinate.longitude
                    let jsonData = try! JSONSerialization.data(withJSONObject: Graph().toDictionary())
                    let graphJson = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
                    
                    parameters["personalGraph"] = graphJson
                    parameters["email"] = newUser.email
                    parameters["pwd"] = newUser.password
                    parameters["uuid"] = uuid
                    parameters["name"] = newUser.name
                    parameters["dobDay"] = newUser.day
                    parameters["dobMonth"] = newUser.month
                    parameters["dobYear"] = newUser.year
                    parameters["username"] = (newUser.name.prefix(4) + "_" + randomString(length: 4)).lowercased()
                    postData(parameters: parameters, postUrl: SUBMISSION_CATCHER_URL)

                    // waiting for response from server
                    submissionSemaphore.wait()

                    if dataResponse!["status"] as? String == "SUCCESS" && dataResponse!["response"] as? String == "SUCCESS"{
                        // if user creation was succesful
                        print("Success! New User id is: " + uuid)
                        self.user = Person(id: uuid)
                        UserDefaults.standard.set(newUser.email, forKey: UserConnect.EMAIL)
                        UserDefaults.standard.set(newUser.password, forKey: UserConnect.PASSWORD)
                        UserDefaults.standard.set(true, forKey: UserConnect.LOGGED_IN)
                        UserDefaults.standard.set(uuid, forKey: UserConnect.ID)

                        return true
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
        This function is used load the data that represents an existing user
        - Returns:true is returned if user was successfully loaded otherwise false
     */
    func DataRequest(email: String? = nil, password: String? = nil) -> Bool {
                
        var data = [String: Any]()
        // if already logged in
        if UserDefaults.standard.bool(forKey: UserConnect.LOGGED_IN) && email == nil && password == nil{
            // load data and set this person
            let uid = UserDefaults.standard.string(forKey: UserConnect.ID)
            user = Person(id: uid!)
            data["requestType"] = "getUserData"
            data["uuid"] = uid
            postData(parameters: data, postUrl: SUBMISSION_CATCHER_URL)
            // waiting for response from server
            submissionSemaphore.wait()
        } else if email != nil, password != nil {
            // attempt to log in then load data and set this person
            data["requestType"] = "getUserData"
            data["email"] = email
            data["pwd"] = password
            postData(parameters: data, postUrl: SUBMISSION_CATCHER_URL)
            // waiting for response from server
            submissionSemaphore.wait()
        }
        if dataResponse != nil, dataResponse!["status"] as? String == "SUCCESS" {
            
            //fix this and user correct keys...
            if(((dataResponse!["request"]! as? [Any])!).isEmpty == false){
            let id = (((dataResponse!["request"]! as? [Any])!)[0]  as! [String:Any])["uuid"]
            let graphData = ( (((dataResponse!["request"]! as? [Any])!)[0]  as! [String:Any])["personalGraph"] as! String)
            //next create method to convert graph data into graph object
            UserDefaults.standard.set(id, forKey: UserConnect.ID)
            UserDefaults.standard.set(email, forKey: UserConnect.EMAIL)
            UserDefaults.standard.set(password, forKey: UserConnect.PASSWORD)
            UserDefaults.standard.set(true, forKey: UserConnect.LOGGED_IN)

            self.user = Person(id: id as! String)
            let graphObj = dictionaryToGraph(graphDictionary: (convertToDictionary(text: graphData)!)["Graph"] as! [String:Any], list: [:] )
            self.user?.setPersonalGraph(G: graphObj)
            return true
            }
        }
        return false
    }

   
    /**
        This function saves the app users graph data
        - Returns: true if save was successful, false if not
     */
    func save(activeStatus: Bool = true) -> Bool {
        if UserDefaults.standard.bool(forKey: UserConnect.LOGGED_IN) && user != nil && user?.getPersonalGraph() != nil {
            var data = [String: Any]()
            data["uuid"] = UserDefaults.standard.string(forKey: UserConnect.ID)
            data["requestType"] = "saveUserData"
            let jsonData = try! JSONSerialization.data(withJSONObject: user?.getPersonalGraph().toDictionary() ?? [])
            let graphJson = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
            data["personalGraph"] = graphJson
            if activeStatus{
            data["lat"] = user?.getCurrentLocation().coordinate.latitude
            data["lon"] = user?.getCurrentLocation().coordinate.longitude
            data["activeStatus"] = "true"
            }else{
                data["lat"] = UserConnect.NO_RESPONSE
                data["lon"] = UserConnect.NO_RESPONSE
                data["activeStatus"] = "false"
            }
            
            postData(parameters: data, postUrl: SUBMISSION_CATCHER_URL)
                submissionSemaphore.wait()
            if dataResponse != nil, dataResponse!["status"] as? String == "SUCCESS" {

                return true
            }
        }
        return false
    }


    /**
        This function logs a user out of the app
        - Returns: true if logout is successful; false if not.
     */
    func SignOut()->Bool {
        // FIX SERVER SIDE SO THAT ACTIVE STATUS CHANGES FROM 1 TO 0
        if save(activeStatus: false) {
            UserDefaults.standard.set(false, forKey: UserConnect.LOGGED_IN)
            return true
        }
        return false
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
            if postUrl == self.SUBMISSION_CATCHER_URL {
                self.submissionSemaphore.signal()
            }
        }

        task.resume()
    }
    
    
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

