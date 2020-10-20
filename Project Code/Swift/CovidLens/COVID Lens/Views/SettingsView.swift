//
//  SettingsView.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/9/20.
//

import SwiftUI
import GoogleSignIn

@available(iOS 14.0, *)
struct SettingsView: View {
    @EnvironmentObject private var userLoginState: AuthVM
    @StateObject private var viewModel = SettingsVM()
    @State var dark = false
    
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
                        Text("Firstname Lastname")
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
                        //dark light mode for a setting
        
                        // account preferences button
                        SettingsButton(iconName: "person.crop.square.fill",
                                       text: "Account Preferences"){
                                        
                                       }
                       
                        Divider()
                        // view report status button
                        SettingsButton(iconName: "doc.text.below.ecg.fill", text: "View Self-Report Status") {
                            viewModel.showReportStatusAlert = true
                        }.alert(isPresented: $viewModel.showReportStatusAlert) {
                            Alert(
                                title: Text(viewModel.reportStatus),
                                dismissButton: .default(Text("Close"))
                            )
                        }
                        Divider()
                        // sign out button
                        SettingsButton(iconName: "square.and.arrow.up.fill", text: "Sign Out") {
                            // handle log out authorization here
                            viewModel.showSignoutAlert = true
                            GIDSignIn.sharedInstance()?.signOut()
                        }.alert(isPresented: $viewModel.showSignoutAlert) {
                            Alert(
                                title: Text("Are you sure you want to Sign Out?"),
                                primaryButton: .default(Text("No")),
                                secondaryButton: .destructive(Text("Yes"), action: userLoginState.logOut)
                            )
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


