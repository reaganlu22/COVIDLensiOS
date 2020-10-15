//
//  SignupView.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/8/20.
//

import SwiftUI

struct SignupView: View {
    
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    @StateObject private var viewModel = SignupVM()
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var checkPassword: String = ""
    
    var title: some View {
        VStack(spacing: 15) {
            // logo
            Image(viewModel.logo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, height: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            // title
            Text(viewModel.title)
                .fontWeight(.bold)
                .font(.system(size: 36.0))
                .foregroundColor(Color.black)
                .padding(.bottom)
            
                // instructional text
                Text(viewModel.signUpText)
                    .font(.system(size: 18.0))
                    .foregroundColor(Color.black.opacity(0.65))
                    .padding(.bottom, 2)
                    .padding(.horizontal, 50)
                    .multilineTextAlignment(.center)
        }
    }
    
    var nameField: some View {
        // name field
        InputWithIcon(placeholder: viewModel.name, value: $name, icon: viewModel.nameIcon)
    }
    
    var emailField: some View {
        // email field
        InputWithIcon(placeholder: viewModel.email, value: $email, icon: viewModel.emailIcon)
    }
    
    var passwordField: some View {
        // password field
        InputWithIcon(placeholder: viewModel.password, value: $password, icon: viewModel.passwordIcon)
    }
    
    var rePasswordField: some View {
        // re-enter password field
        InputWithIcon(placeholder: viewModel.rePassword, value: $checkPassword, icon: viewModel.passwordIcon)
    }
    
    var signUpFields: some View {
        VStack(spacing: 15) {
            VStack(alignment: .leading) {
                // instructional text
                Text(viewModel.signUpText)
                    .font(.system(size: 18.0))
                    .foregroundColor(Color.black.opacity(0.65))
                    .padding(.bottom, 3)
                    .padding(.horizontal)
            }
                //.multilineTextAlignment(.center)
            // name field
            InputWithIcon(placeholder: viewModel.name, value: $name, icon: viewModel.nameIcon)
            // email field
            InputWithIcon(placeholder: viewModel.email, value: $email, icon: viewModel.emailIcon)
            // password field
            InputWithIcon(placeholder: viewModel.password, value: $password, icon: viewModel.passwordIcon)
            // re-enter password field
            InputWithIcon(placeholder: viewModel.rePassword, value: $checkPassword, icon: viewModel.passwordIcon)
        }
    }
    
    var signUpButton: some View {
        HStack {
            PrimaryButton(label: viewModel.buttonText) {
                // action goes here
                // send info to databse
                print(self.name)
                print(self.email)
                print(self.password)
                print(self.checkPassword)
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    
    var body: some View {
        
        GeometryReader { G in
            ScrollView{
                VStack {
                    Spacer()
                        .frame(height: G.size.height * 0.05)
                    title
                        .padding(.bottom)
                    //signUpFields
                    nameField
                        .padding(.bottom, 5)
                    emailField
                        .padding(.bottom, 5)
                    passwordField
                        .padding(.bottom, 5)
                    rePasswordField
                        .padding(.bottom, 15)
                    signUpButton
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white.ignoresSafeArea(.all, edges: .all))
        }
    }
}
