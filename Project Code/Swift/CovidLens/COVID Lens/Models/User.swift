//
//  User.swift
//  COVID Lens
//

// user struct
struct User {
    private var name: String = ""
    private var email: String = ""
    //private var password: String
    private var googleID: String = ""
    private var profilePic: String = ""
    
    // initializer
    init(name: String, email: String, password: String, googleID: String, profilePic: String) {
        self.name = name
        self.email = email
        //self.password = password
        self.googleID = googleID
        self.profilePic = profilePic
       }
    
    // update the user's name
    mutating func updateName(name: String) {
        self.name = name
    }
    
    // get user's name
    func getName() -> String {
        return name
    }
}

