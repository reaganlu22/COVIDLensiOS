//
//  SignupVM.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/9/20.
//

import SwiftUI

final class SignupVM: ObservableObject {
    
    @Published var nameText: String = ""
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    @Published var checkPasswordText: String = ""
    @Published var showingAlert: Bool = false
    @Published var validFields: Bool = false
    
    let logo = "logo"
    let title = "Create an Account"
    let signUpText = "Please enter the required info to create your account"
    let name = "Name"
    let nameIcon = "person"
    let email = "Email"
    let emailIcon = "envelope"
    let password = "Password"
    let passwordIcon = "lock"
    let rePassword = "Re-enter password"
    let buttonText = "Sign up"
    
    func checkPasswords() -> Bool {
        return self.passwordText == self.checkPasswordText
    }
    func verifyFields() -> Bool {
        return (self.nameText != "") && (self.emailText != "") && (self.passwordText == self.checkPasswordText)
        // && self.emailText not in database
    }
    
    func tappedSignupButton() {
        // if user email not in database AND password and checkPassword are the same
        // sign up user, send info to database
        print(self.nameText)
        print(self.emailText)
        print(self.passwordText)
        print(self.checkPasswordText)
    }
}
