//
//  SignupVM.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/9/20.
//

import Foundation

final class SignupVM: ObservableObject {
    var nameInput: String = ""
    var emailInput: String = ""
    var passwordInput: String = ""
    var rePasswordInput: String = ""
    
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
}
