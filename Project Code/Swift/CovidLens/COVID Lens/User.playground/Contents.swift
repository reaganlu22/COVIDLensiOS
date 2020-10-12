//
//  User.swift
//  COVID Lens
//

// user struct
struct User {
    private var name: String
    private var email: String
    private var password: String
    private var id: String
    
    // default constructor
    init() {
        self.name = ""
        self.email = ""
        self.password = ""
        self.id = ""
       }
    
    // parameterized constructor
    init(name: String, email: String, password: String, id: String) {
        self.name = name
        self.email = email
        self.password = password
        self.id = id
       }
    
    // update the user's name
    mutating func updateName(name: String) {
        self.name = name
    }
    
    // update the user's email
    mutating func updateEmail(email: String) {
        self.email = email
    }
    
    // get user's name
    func getName() -> String {
        return self.name
    }
    
    // get user's email
    func getEmail() -> String {
        return self.email
    }
    
    // get user's password
    func getPass() -> String {
        return self.password
    }
}

var user1 = User(name: "Seth", email: "sethkgoodwin@yahoo.com", password: "password", id: "1234")
print(user1.getName())


