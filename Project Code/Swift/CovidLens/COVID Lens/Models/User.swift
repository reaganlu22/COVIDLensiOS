//
//  User.swift
//  COVID Lens
//

import SwiftUI

// user struct
struct User {
    private var id: String = ""
    private var name: String = ""
    private var email: String = ""
    
    // initializer
    init(name: String, email: String) {
        self.id = UUID().uuidString
        self.name = name
        self.email = email
       }
    
    // get user's id
    func getID() -> String {
        return id
    }
    
    // get user's name
    func getName() -> String {
        return name
    }
    
    // get user's email
    func getEmail() -> String {
        return email
    }
    
    func getInfo() {
        print(self.id)
        print(self.name)
        print(self.email)
    }
}

