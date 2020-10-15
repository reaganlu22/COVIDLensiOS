//
//  UserStore.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/14/20.
//

import Foundation

import Combine

class UserStore: ObservableObject {
    @Published var currentUserInfo: GoogleUser?
    @Published var isLoggedIn: Bool = false
}
