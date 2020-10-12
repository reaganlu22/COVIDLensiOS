//
//  test.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/5/20.
//
import SwiftUI

class UserData{
    //private let SUBMISSION_CATCHER_URL : String
    private var dataResponse: [String: Any]!
    //private let submissionSemaphore = DispatchSemaphore(value: 0) 
    private var userData: User
    //private var response: [String: Any]
    //private var CONNECTION_URL: String
    
    init(userData: User) {
        self.userData = userData
    }
    
    func printName() {
        print("name")
    }
    
    func createUser(userID: String, email: String? = nil, password: String? = nil) {
        print(userID)
    }
}
