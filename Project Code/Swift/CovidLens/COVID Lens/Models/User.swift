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
    var loggedIn: Bool
    var report: Report?
    
    // default initializer
    init() {
        self.name = ""
        self.email =  ""
        self.password =  ""
        self.googleID =  ""
        self.profilePic = ""
        self.basicID = ""
        self.loggedIn = true
    }
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
        self.basicID = ""
        self.googleID = ""
        self.profilePic = ""
        self.loggedIn = false
    }
    
    // paramaterized initializer for google signin
    init(name: String, email: String, googleID: String, profilePic: String, basicID: String) {
        self.name = name
        self.email =  email
        self.password = googleID
        self.googleID =  googleID
        self.profilePic = profilePic
        self.basicID = basicID
        self.loggedIn = true
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

    mutating func setLoggedIn(status: Bool) {
        self.loggedIn = status
    }
    
    
    mutating func setReport(report: Report) {
        self.report = report
    }
    
    func getReport() -> Report {
        return self.report ?? Report(age: 0, phoneNumber: "NA", residenceHall: "NA", affiliation: "NA", locationID: "NA", reportStatus: "NA", reportInfo: "NA", situationDescription: "NA", confirmerID: "NA", submitterID:"NA", reportID: "NA")
    }
    func getLoggedIn()->Bool{
        return self.loggedIn
    }
    
    // get user's name
    func getName() -> String {
        return name
    }

    // get user's password
    func getPassword() -> String{
        return password ?? ""
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
        case name
        case email
        case password
        case googleID
        case profilePic
        case basicID
        case report
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodkingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try container.encode(googleID, forKey: .googleID)
        try container.encode(profilePic, forKey: .profilePic)
        try container.encode(basicID, forKey: .basicID)
        try container.encode(report, forKey: .report)
    }
}
