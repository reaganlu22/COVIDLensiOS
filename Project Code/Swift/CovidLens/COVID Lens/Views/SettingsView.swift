//
//  SettingsView.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/9/20.
//
import UserNotifications
import SwiftUI
import GoogleSignIn

@available(iOS 14.0, *)
struct SettingsView: View {
    @EnvironmentObject private var userLoginState: AuthVM
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
                            .data(url: URL(string: viewModel.picURL)!)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150, alignment: .center)
                            .clipShape(Circle())
                            .padding()
                        // user's name
                        Text(viewModel.firstname + " " + viewModel.lastName)
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black.opacity(0.8))
                            .padding(.bottom, 4)
                        // user's email
                        Text(viewModel.email)
                            .font(.system(size: 18.0))
                            .fontWeight(.medium)
                            .foregroundColor(Color.black.opacity(0.5))
                    }.padding(.bottom, 50)
                    .padding(.top)
                    
                    VStack(alignment: .leading) {
                        Divider()
                        // account preferences button
                        SettingsButton(iconName: "person.crop.square.fill", text: "Allow Noftifications") {
                            
                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                
                                if success {
                                    print("All set!")
                                } else if let error = error {
                                    print(error.localizedDescription)
                                }
                            }
                            
                            let content = UNMutableNotificationContent()
                            content.title = "Self Report Progress!"
                            content.subtitle = "Your submittion is accepted!"
                            content.sound = UNNotificationSound.default
                            
                            // show this notification five seconds from now
                            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                            
                            // choose a random identifier
                            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                            
                            // add our notification request
                            UNUserNotificationCenter.current().add(request)
                            
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

extension Image {
    func data(url:URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}
