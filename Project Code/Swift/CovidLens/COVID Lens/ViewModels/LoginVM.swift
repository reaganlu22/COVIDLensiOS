//
//  LoginVM.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/9/20.
//

import GoogleSignIn

final class LoginVM: ObservableObject {
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    @Published var displaySignupView: Bool = false
    
    let logo = "logo"
    let title = "COVID Lens"
    let signInText = "Please sign in to continue"
    let email = "Email"
    let emailIcon = "envelope"
    let password = "Password"
    let passwordIcon = "lock"
    let signInButtonText = "Sign in"
    let googleButtonText = "Sign in with Google"
    let googleButtonIcon = "google"
    let noAccountText = "Don't have an account? "
    let signUpButtonText = "Sign up"
}

