//
//  COVID_LensApp.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/4/20.
//

import SwiftUI

import GoogleSignIn
import GoogleMaps
import GooglePlaces

@available(iOS 14.0, *)
@main
struct COVID_LensApp: App {
    @StateObject var userLoginState = AuthVM()
    
    // attach App Delegate to SwiftUI
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            if (userLoginState.isLoggedIn) {
                TabContainterView()
                    .environmentObject(userLoginState)
            } else {
                LoginView(info: self.appDelegate)
                    .environmentObject(userLoginState)
            }
        }
    }
    
}

class AppDelegate: NSObject, UIApplicationDelegate, GIDSignInDelegate, ObservableObject{
    
    var window: UIWindow?
    
    @Published var userId:String?
    @Published var idToken:String?
    @Published var fullName:String?
    @Published var email:String?
    @Published var googleProfilePicURL:String?
    @Published var signedIn: Bool?
    
    @State var testUser = User()
    @State var userData = UserData()
    
    var apiKey = "" // your api key here
    // [START didfinishlaunching]
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // NavigationBar customization
        UINavigationBar.appearance().barTintColor = UIColor(Color(red: 0/255, green: 193/255, blue: 203/255))
        
        // TabBar color customization
        UITabBar.appearance().barTintColor = UIColor(Color(red: 240/255, green: 240/255, blue: 240/255))
       
         GIDSignIn.sharedInstance().clientID = "" // your google client id here
        
        GMSServices.provideAPIKey(apiKey)
        GMSPlacesClient.provideAPIKey(apiKey)
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
        return true
    }
    // [END didfinishlaunching]
    
    // [START openurl]
    func application(_ application: UIApplication,
                     open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    // [END openurl]
    
    // [START openurl_new]
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    // [END openurl_new]
    
    // [START signin_handler]
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error { // unsuccessful user sign in
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            // [START_EXCLUDE silent]
            NotificationCenter.default.post(
                name: Notification.Name(rawValue: "ToggleAuthUINotification"), object: nil, userInfo: nil)
            // [END_EXCLUDE]
            return
        } else { // successful user sign in
            
            // get user information from google
            self.userId = user.userID ?? ""                  // For client-side use only!
            self.idToken = user.authentication.idToken ?? "" // Safe to send to the server
            self.fullName = user.profile.name ?? ""
            self.email = user.profile.email ?? ""
            self.googleProfilePicURL = user.profile.imageURL(withDimension: 150)?.absoluteString ?? ""
            
            // database post request?
            
            testUser = User(name: self.fullName ?? "", email: self.email ?? "", googleID: self.idToken ?? "", profilePic: self.googleProfilePicURL ?? "", basicID: self.userId ?? "")
            
            UserDefaults.standard.setValue(true, forKey: "loggedIn")
            
            // [START_EXCLUDE]
            NotificationCenter.default.post(
                name: Notification.Name(rawValue: "ToggleAuthUINotification"),
                object: nil,
                userInfo: ["statusText": "Signed in user:\n\(fullName!)"])
            // [END_EXCLUDE]
        }
    }
    // [END signin_handler]
    
    // [START disconnect_handler]
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        GIDSignIn.sharedInstance()?.signOut()
        // [START_EXCLUDE]
        NotificationCenter.default.post(
            name: Notification.Name(rawValue: "ToggleAuthUINotification"),
            object: nil,
            userInfo: ["statusText": "User has disconnected."])
        // [END_EXCLUDE]
    }
    // [END disconnect_handler]
}
