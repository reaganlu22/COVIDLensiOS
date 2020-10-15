//
//  COVID_LensApp.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/4/20.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import GoogleSignIn
import GoogleMaps
import GooglePlaces
import Combine

@available(iOS 14.0, *)

@main
struct COVID_LensApp: App {
    
    @StateObject var authVM = AuthVM()
    
    // attach App Delegate to SwiftUI
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            if (authVM.isLoggedIn) {
                TabContainterView()
                    .environmentObject(authVM)
            } else {
                LoginView(info: self.appDelegate)
                    .environmentObject(authVM)
            }
        }
    }
    
}

class AppDelegate: NSObject, UIApplicationDelegate, GIDSignInDelegate, ObservableObject{
    
    var window: UIWindow?
    
    // APIKEY and clientID (Seth)
    var apiKey = "AIzaSyBaBhLg6ULvTIXOsXZ7sU9GBQ1flu7H9O0"
    var clientID = "179846355573-6ikclf9armsnfd1eajs50t7hnqnv39r6.apps.googleusercontent.com"
    
    // [START didfinishlaunching]
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // NavigationBar customization
        UINavigationBar.appearance().barTintColor = UIColor(Color(red: 0/255, green: 193/255, blue: 203/255))
        
        // TabBar color customization
        UITabBar.appearance().barTintColor = UIColor(Color(red: 240/255, green: 240/255, blue: 240/255))
        
        // Initialize sign-in
        GIDSignIn.sharedInstance().clientID = clientID
        GIDSignIn.sharedInstance().delegate = self
        
        // if user closes app, keep them signed in
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
        // api keys for Google services
        GMSServices.provideAPIKey(apiKey)
        GMSPlacesClient.provideAPIKey(apiKey)
        
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
        if let error = error {
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
        }
        
        // get user info from Google
        guard let user = user else {
            print("Uh oh. The user cancelled the Google login.")
            return
        }
        // Perform any operations on signed in user here.
        let userId = user.userID ?? ""                  // For client-side use only!
        let idToken = user.authentication.idToken ?? "" // Safe to send to the server
        let fullName = user.profile.name ?? ""
        //let firstName = user.profile.givenName ?? ""
        //let lastName = user.profile.familyName ?? ""
        let email = user.profile.email ?? ""
        let googleProfilePicURL = user.profile.imageURL(withDimension: 150)?.absoluteString ?? ""
        
        print(email)
        
        // [START_EXCLUDE]
        NotificationCenter.default.post(
            name: Notification.Name(rawValue: "ToggleAuthUINotification"),
            object: nil,
            userInfo: ["statusText": "Signed in user:\n\(fullName)"])
        // [END_EXCLUDE]
    }
    // [END signin_handler]
    
    // [START disconnect_handler]
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // [START_EXCLUDE]
        NotificationCenter.default.post(
            name: Notification.Name(rawValue: "ToggleAuthUINotification"),
            object: nil,
            userInfo: ["statusText": "User has disconnected."])
        // [END_EXCLUDE]
    }
    // [END disconnect_handler]
    
    // conntect to database
    //send user info to database
    // instantiate User Struct
}

