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
    //@StateObject var user: User?
    @State var userData: UserData?
    
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
        InputWithIcon(placeholder: viewModel.name, value: $viewModel.nameText, icon: viewModel.nameIcon)
    }
    
    var emailField: some View {
        // email field
        InputWithIcon(placeholder: viewModel.email, value: $viewModel.emailText, icon: viewModel.emailIcon)
    }
    
    var passwordField: some View {
        // password field
        InputWithIcon(placeholder: viewModel.password, value: $viewModel.passwordText, icon: viewModel.passwordIcon)
    }
    
    var rePasswordField: some View {
        // re-enter password field
        InputWithIcon(placeholder: viewModel.rePassword, value: $viewModel.checkPasswordText, icon: viewModel.passwordIcon)
    }
    
    var signUpButton: some View {
        HStack {
            PrimaryButton(label: viewModel.buttonText) {
                if (viewModel.verifyFields()) {
                    // create user account
                    // database post user info
                    viewModel.tappedSignupButton()
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    viewModel.showingAlert.toggle()
                }
            }
            .alert(isPresented: $viewModel.showingAlert) {
                Alert(title: Text("Invalid field(s)"),
                      message: Text("Please make sure no fields are empty and passwords are matching"),
                      dismissButton: .default(Text("Close")))
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
            .background(Color.white.ignoresSafeArea(.all, edges: .all)).onTapGesture {
                self.hideKeyboard()
            }
        }
    }
}
