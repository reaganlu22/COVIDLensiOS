//
//  SettingsVM.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/9/20.
//

import SwiftUI
import GoogleSignIn

final class SettingsVM: ObservableObject {
    @Published var picURL: String = GIDSignIn.sharedInstance().currentUser.profile.imageURL(withDimension: 150)!.absoluteString
    @Published var firstname: String = GIDSignIn.sharedInstance().currentUser.profile.givenName
    @Published var lastName: String = GIDSignIn.sharedInstance().currentUser.profile.familyName
    @Published var email: String = GIDSignIn.sharedInstance().currentUser.profile.email
    
    @Published var showSignoutAlert: Bool = false
    @Published var showReportStatusAlert: Bool = false
    var reportStatus = "Pending Verification"
}
