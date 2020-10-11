//
//  AuthVM.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/8/20.
//

import Foundation

class AuthVM: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    func login() {
        isLoggedIn.toggle()
    }
    
    func logOut() {
        isLoggedIn.toggle()
    }
}
