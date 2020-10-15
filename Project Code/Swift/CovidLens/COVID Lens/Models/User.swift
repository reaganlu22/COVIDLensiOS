//
//  User.swift
//  COVID Lens
//

// user struct
struct User: Codable {
    private var name: String = ""
    private var email: String = ""
    private var password: String
    private var googleID: String = ""
    private var basicID: String = ""
    private var profilePic: String = ""
    
    // initializer
    init(name: String, email: String, password: String = "", googleID: String, profilePic: String, basicID: String) {
        self.name = name
        self.email = email
        self.password = password
        self.googleID = googleID
        self.profilePic = profilePic
        self.basicID = basicID
       }
    
    // update the user's name
    mutating func updateName(name: String) {
        self.name = name
    }
    
    // get user's name
    func getName() -> String {
        return name
    }
    
    // get user's password
    func getPassword() -> String{
        return password
    }
    
    // get user's email
    func getEmail() -> String{
        return email
    }
    
    //get a users's token id
    func getGoogleID() -> String{
        return googleID
    }
    
    //get user's prfile pic url
    func gertProfilePic() -> String {
        return profilePic
    }
    
    //get id of non google user
    func getBasicId() -> String{
        return self.basicID
    }
}

