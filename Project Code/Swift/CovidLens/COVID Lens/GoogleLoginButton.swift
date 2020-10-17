//
//  GoogleLoginButton.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/6/20.
//

import SwiftUI
import GoogleSignIn

struct GoogleLoginButton: View {
    
    @ObservedObject var info: AppDelegate
    var body: some View {
        VStack {
            HStack(spacing: 10){
                
                // Google login
                
                Button(action: {
                    GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
                    GIDSignIn.sharedInstance()?.signIn()
                }) {
                    
                    HStack {
                        Image("google")
                            .resizable()
                            .frame(width: 40, height: 40)
                        Text("Sign with Google")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black.opacity(0.7))
                            .frame(width: UIScreen.main.bounds.width - 225)
                    }
                }
                // button style
                .border(Color.black.opacity(0.4))
            }
        }
    }
}
