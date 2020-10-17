
//
//  Created by Seth Goodwin on 10/5/20.
//
import SwiftUI


import CoreLocation
import Foundation

class UserData {
    static let ID_TOKEN = "USER_ID"
    static let PASSWORD = "PASSWORD"
    static let SIGNED_IN = "SIGNED_IN"
    static let SIGNED_OUT = "SIGNED_OUT"
    static let EMAIL = "EMAIL"
    static let NO_USER = "NO_USER"
    private let REQUEST_CATCHER_URL = "https://www.covidlensapp.com/request-catcher"
    private var dataResponse: [String: Any]!
    private let submissionSemaphore = DispatchSemaphore(value: 0)
    
    
    /**
     This function creates a new user
     - Returns: true is returned if creation was successful otherwise false
     */
    func createUser(newUser: User) -> Bool {
        if UserDefaults.standard.bool(forKey: UserData.SIGNED_IN) == false {
            var uuid = createUUID()
            if isValidEmail(newUser.getEmail()), isValidPassword(newUser.getPassword()) {
                // attempt multiple times in case ID already existed for another user
                var attempt = 5
                repeat {
                    var parameters = [String: Any]()
                    
                    parameters["request"] = "USER_CREATION"
                    parameters["additionalData"] = ""
                    parameters["email"] = newUser.getEmail()
                    parameters["password"] = newUser.getPassword()
                    parameters["userID"] = createUUID()
                    parameters["active"] = true
                    postData(parameters: parameters, postUrl: REQUEST_CATCHER_URL)
                    
                    // waiting for response from server
                    submissionSemaphore.wait()
                    
                    if dataResponse!["status"] as? String == "SUCCESS"{
                        // if user creation was succesful
                        // teporararalily storing in defaualts for testing... should use keychain in production
                        UserDefaults.standard.set(newUser.getEmail(), forKey: UserData.EMAIL)
                        UserDefaults.standard.set(newUser.getPassword(), forKey: UserData.PASSWORD)
                        UserDefaults.standard.set(true, forKey: UserData.SIGNED_IN)
                        UserDefaults.standard.set(uuid, forKey: UserData.ID_TOKEN)
                        
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
     This function loads an existing user or signs them in if they were logged out
     - Returns: true is returned if load/signin was successful
     */
    func loadUser(user: User) -> Bool {
        if UserDefaults.standard.bool(forKey: UserData.SIGNED_IN) == true {
            var parameters = [String: Any]()
            parameters["request"] = "USER_SIGN_IN"
            parameters["additionalData"] = ""
            parameters["email"] = user.getEmail()
            parameters["password"] = user.getPassword()
            parameters["userID"] = user.getBasicId()
            postData(parameters: parameters, postUrl: REQUEST_CATCHER_URL)
            
            // waiting for response from server
            submissionSemaphore.wait()
            
            if dataResponse!["status"] as? String == "SUCCESS"{
              //store data response and use it to update app
                return true
            }
        }else {
            var parameters = [String: Any]()
            parameters["request"] = "USER_SIGN_IN"
            parameters["additionalData"] = ""
            parameters["email"] = user.getEmail()
            parameters["password"] = user.getPassword()
            parameters["userID"] = user.getGoogleID()
            postData(parameters: parameters, postUrl: REQUEST_CATCHER_URL)
            
            // waiting for response from server
            submissionSemaphore.wait()
            
            if dataResponse!["status"] as? String == "SUCCESS"{
             // store data response and use it to update app
                return true
            }
            
        }
        return false
    }
    
    func save() -> Bool{
        
        return false
    }
    
    func logout() -> Bool{
      return false
    }
    
    /**
     This function is used for updated the apps data
     - Returns:true if update was successful and false if not
     */
    func DataRequest(user: User) -> Bool {
        
        var parameters = [String: Any]()
        // if already logged in
        if UserDefaults.standard.bool(forKey: UserData.SIGNED_IN){
            // load data and set this person
            let uid = UserDefaults.standard.string(forKey: UserData.ID_TOKEN)
            parameters["request"] = "USER_DATA_REQUEST"
            parameters["userID"] = uid
            postData(parameters: parameters, postUrl: REQUEST_CATCHER_URL)
            // waiting for response from server
            submissionSemaphore.wait()
        } else {
            // attempt to log in then load data and set this person
            parameters["request"] = "USER_DATA_REQUEST"
            parameters["userID"] = user.getGoogleID()
            parameters["additionalData"] = ""
            postData(parameters: parameters, postUrl: REQUEST_CATCHER_URL)
            // waiting for response from server
            submissionSemaphore.wait()
        }
        if dataResponse != nil, dataResponse!["status"] as? String == "SUCCESS" {
            // do something
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
        for (key, value) in self.dataResponse{
            dict[key] = value is NSNull ? "": value
        }
        return dict
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

