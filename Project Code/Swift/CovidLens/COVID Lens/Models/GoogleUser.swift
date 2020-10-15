//
//  GoogleUser.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/14/20.
//

// user struct
struct GoogleUser {
    private var name: String = ""
    private var email: String = ""
    private var googleID: String = ""
    private var profilePicURL: String = ""
    
    // initializer
    init(name: String, email: String, googleID: String, profilePicURL: String) {
        self.name = name
        self.email = email
        self.googleID = googleID
        self.profilePicURL = profilePicURL
       }
    
    func getInfo() {
        print(self.name)
        print(self.email)
        print(self.googleID)
        print(self.profilePicURL)
    }
    
    func getEmail() -> String {
        return self.email
    }
}
