//
//  LoginView.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/8/20.
//

//
//  LoginView.swift
//  COVID Lens
//

import SwiftUI
import GoogleSignIn

struct LoginView : View {
    @ObservedObject var info: AppDelegate
    @StateObject private var viewModel = LoginVM()
    
    @EnvironmentObject var authVM: AuthVM
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var displaySignupView: Bool = false
    
    var title: some View {
        VStack(spacing: 15) {
            // logo
            Image(viewModel.logo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            // title
            Text(viewModel.title)
                .fontWeight(.bold)
                .font(.system(size: 50.0))
                .foregroundColor(Color.black)
        }
    }
    
    var credentialsFeild: some View {
        VStack(spacing: 15) {
            Text(viewModel.signInText)
                .font(.system(size: 18.0))
                .foregroundColor(Color.black.opacity(0.65))
                .padding(.bottom, 3)
            // email field
            InputWithIcon(placeholder: viewModel.email, value: $email, icon: viewModel.emailIcon)
            // password field
            InputWithIcon(placeholder: viewModel.password, value: $password, icon: viewModel.passwordIcon, secure: true)
        }
    }
    
    // sign in button
    var signInButton: some View {
        PrimaryButton(label: viewModel.signInButtonText) {
            // action goes here
            authVM.login()
        }
        
    }
    
    // Google sign in button
    var googleSignInButton: some View {
        PrimaryButton(label: viewModel.googleButtonText, icon: viewModel.googleButtonIcon) {
            // Google signin
            GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
            GIDSignIn.sharedInstance()?.signIn()
        }
    }
    
    // sign up button
    var signUpButton: some View {
        HStack {
            Text(viewModel.noAccountText)
                .foregroundColor(Color.black.opacity(0.7))
            Button(action: {
                self.displaySignupView.toggle()
            }) {
                Text(viewModel.signUpButtonText)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
            }.sheet(isPresented: self.$displaySignupView) {
                SignupView()
            }
        }
    }
    
    var body: some View {
        GeometryReader { G in
            VStack {
                Spacer()
                    .frame(height: G.size.height * 0.1)
                title
                Spacer()
                credentialsFeild
                    .padding(.bottom)
                signInButton
                    .padding(.bottom, 4)
                googleSignInButton
                Spacer()
                signUpButton
                    .offset(y: -20)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white.ignoresSafeArea(.all, edges: .all))
        }
        
        //        VStack {
        //            VStack(spacing: 15) {
        //                // logo
        //                Image(viewModel.logo)
        //                    .resizable()
        //                    .aspectRatio(contentMode: .fit)
        //                    .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        //
        //                // title
        //                Text(viewModel.title)
        //                    .fontWeight(.bold)
        //                    .font(.system(size: 50.0))
        //                    .foregroundColor(Color.black)
        //            }.padding(.bottom, 35)
        //            .padding(.top, 50)
        //
        //            VStack(spacing: 15) {
        //                Text("Please sign in to continue")
        //                    .font(.system(size: 18.0))
        //                    .foregroundColor(Color.black.opacity(0.65))
        //                    .padding(.bottom, 3)
        //                // email field
        //                InputWithIcon(placeholder: "Email", value: $email, icon: "envelope")
        //                // password field
        //                InputWithIcon(placeholder: "Password", value: $password, icon: "lock", secure: true)
        //
        //                VStack(spacing: 15) {
        //                    // login button
        //                    HStack {
        //                        PrimaryButton(label: "Sign in") {
        //                            // action goes here
        //                            authVM.login()
        //                            print("login button clicked")
        //                        }
        //                    }
        //                    // sign in with Google button
        //                    HStack {
        //                        PrimaryButton(label: "Sign in with Google", icon: "google") {
        //                            // Google signin
        //                            GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
        //                            GIDSignIn.sharedInstance()?.signIn()
        //                        }
        //                    }
        //                }
        //            }
        //            Spacer()
        //            // sign up button
        //            HStack {
        //                Text("Don't have an account? ")
        //                    .foregroundColor(Color.black.opacity(0.7))
        //                Button(action: {
        //                    self.displaySignupView.toggle()
        //                }) {
        //                    Text("Sign up")
        //                        .fontWeight(.heavy)
        //                        .foregroundColor(Color.black)
        //                }.sheet(isPresented: self.$displaySignupView) {
        //                    //.fullScreenCover(isPresented: $displaySignupView) {
        //                    SignupView()
        //                }
        //            }.offset(y: -20)
        //
        //        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        //        .background(Color.white.ignoresSafeArea(.all, edges: .all))
    }
}
