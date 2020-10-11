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
    
    // initializer
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
    
    // get user's name
    func getName() -> String {
        return name
    }
}

