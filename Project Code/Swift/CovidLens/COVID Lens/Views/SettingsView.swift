//
//  SettingsView.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/9/20.
//

import SwiftUI
import GoogleSignIn

struct SettingsView: View {
    @EnvironmentObject var authVM: AuthVM
    @StateObject private var viewModel = SettingsVM()
    
    struct SettingsButton: View {
        var iconName: String
        var text: String
        var action: () -> Void
        
        var body: some View {
            Button(action: {
                    self.action()}) {
                HStack {
                    Image(systemName: iconName)
                        .imageScale(.large)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                    Text(text)
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                }.padding(5)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        // profile picture
                        Image("profile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150, alignment: .center)
                            .clipShape(Circle())
                            .padding()
                        // user's name
                        Text("Fistname Lastname")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black.opacity(0.8))
                            .padding(.bottom, 4)
                        // user's email
                        Text("student@uncg.edu")
                            .font(.system(size: 18.0))
                            .fontWeight(.medium)
                            .foregroundColor(Color.black.opacity(0.5))
                    }.padding(.bottom, 50)
                    .padding(.top)
                    
                    VStack(alignment: .leading) {
                        Divider()
                        // account preferences button
                        SettingsButton(iconName: "person.crop.square.fill", text: "Account Preferences") {
                            // account preferences view
                        }
                        Divider()
                        // view report status button
                        SettingsButton(iconName: "doc.text.below.ecg.fill", text: "View Report Status") {
                            // display report status view
                        }
                        Divider()
                        // sign out button
                        SettingsButton(iconName: "square.and.arrow.up.fill", text: "Sign Out") {
                            // handle log out authorization here
                            authVM.logOut()
                            GIDSignIn.sharedInstance()?.signOut()
                        }
                        Divider()
                    }
                }
                .padding(.vertical, -8)
                Divider()
            }.background(Color.white.ignoresSafeArea(.all, edges: .all))
            .navigationBarTitle("Settings", displayMode: .inline)
        }
    }
}

