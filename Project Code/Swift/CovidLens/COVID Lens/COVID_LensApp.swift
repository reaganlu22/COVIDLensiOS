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

@main
struct COVID_LensApp: App {
    
    @StateObject var authVM = AuthVM()
    
    //@EnvironmentObject var userStore: UserStore
    
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
    // API key for Google
    var API_KEY = "AIzaSyBaBhLg6ULvTIXOsXZ7sU9GBQ1flu7H9O0"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // NavigationBar customization
        UINavigationBar.appearance().barTintColor = UIColor(Color(red: 0/255, green: 193/255, blue: 203/255))
        
        // TabBar color customization
        UITabBar.appearance().barTintColor = UIColor(Color(red: 240/255, green: 240/255, blue: 240/255))
        
        
//        // initialize Firebase
//        FirebaseApp.configure()
//
//        // initialize GoogleSignIn
//        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
//        GIDSignIn.sharedInstance().delegate = self
        
        // initialize Google sign-in
        GIDSignIn.sharedInstance().clientID = "179846355573-6ikclf9armsnfd1eajs50t7hnqnv39r6.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        
        // if user already sign in, restore sign-in state.
        // if user closes app, keep them signed in
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
        // API keys for GoogleMaps
        GMSServices.provideAPIKey(API_KEY)
        GMSPlacesClient.provideAPIKey(API_KEY)
        
        return true
    }
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    // called after user has interacted with Google Authentication page
    // retrieves user info from Google
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        
        
        //        let credentials = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)
        //
        //        // sign into Firebase
        //        Auth.auth().signIn(with: credentials) { (result, err) in
        //            if err != nil {
        //                print((err?.localizedDescription)!)
        //                return
        //            }
        //            self.email = (result?.user.email)!
        //            // display email to view
        //            print((result?.user.email)!)
        //        }
        //        print(error?.localizedDescription ?? "")
        
        
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
        
        let user1: GoogleUser = GoogleUser(name: fullName, email: email, googleID: idToken, profilePicURL: googleProfilePicURL)
        
        user1.getInfo()

        //print("Google User ID: \(userId)")
        //print("Google ID Token: \(idToken)")
        //print("Google User Full Name: \(fullName)")
        //print("Google User Email: \(email)")
        //print("Google Profile Avatar URL: \(googleProfilePicURL)")

        
        // conntect to database
        // send user info to database
        // instantiate User Struct
    }
    
    // perform actions on User signing out of application
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        //GIDSignIn.sharedInstance()?.signOut()
        
        print("\(String(describing: user.profile.givenName)) has signed out")
    }
    
}
