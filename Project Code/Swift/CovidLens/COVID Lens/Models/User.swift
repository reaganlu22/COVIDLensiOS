//
//  User.swift
//  COVID Lens
//

// user struct
struct User: Codable {
    var name: String
    var email: String
    var password: String
    var googleID: String
    var basicID: String
    var profilePic: String
    var report: Report?

    // initializer
    init() {
        self.name = ""
        self.email =  ""
        self.password =  ""
        self.googleID =  ""
        self.profilePic = ""
        self.basicID = ""

       }

    // set the user's name
    mutating func setName(name: String) {
        self.name = name
    }

    mutating func setEmail(email: String) {
        self.email = email
    }

    mutating func setGoogleID(googleID: String) {
        self.googleID = googleID
    }

    mutating func setProfilePic(profilePic: String) {
        self.profilePic = profilePic
    }

    mutating func setPassword(password: String) {
        self.password = password
    }

    mutating func setBasicID(basicID: String) {
        self.basicID = basicID
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

    enum CodkingKeys: String, CodingKey {
        case name = "name"
        case email = "email"
        case password = "password"
        case googleID = "googleID"
        case profilePic = "profilePic"
        case basicID = "basicID"
        case report = "report"
    }
}
