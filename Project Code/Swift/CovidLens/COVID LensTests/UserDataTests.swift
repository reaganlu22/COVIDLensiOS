//
//  UserDataTests.swift
//  COVID LensTests
//
//  Created by Isaac Taylor on 10/16/20.
//
import XCTest
@testable import COVID_Lens
class UserDataTests: XCTestCase {

    let TEST_EMAIL:String = "jd1234@somewhere.com"
    let TEST_PASSWORD:String = "12Abcde!"
    let TEST_BASIC_ID:String = UUID().uuidString
    let TEST_NAME:String = "John Doe"
    
    let TEST_USER:User = User(name: "Seth2", email: "seth2@gmail.com", password: "12Abcde!")
    
    private var connection = UserData()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
    
    /**
        This function tests to see if a default failure message is returned from the server when trying to perform a data request with insufficient user details .
     */
    func testFailSafe(){
        var user = User()
        user.setName(name: "test person")
        _ = connection.DataRequest(user: user)
        let actual = connection.getResponse() as? [String:String] ?? [:]
        let expected = ["status": "FAILED", "data": ""]
        XCTAssert(actual == expected)
    }
    

    /**
        This function tests to see if a user can be created successfully from the app.
     */
    func testCreateUser() throws {
        //var user = User()
        //user.setName(name: TEST_NAME)
        //user.setEmail(email: TEST_EMAIL)
        //user.setPassword(password: TEST_PASSWORD)
        _ = connection.createUser(newUser: TEST_USER)
        let actual = connection.getResponse() as? [String:String] ?? [:]
        let expected = ["status": "SUCCESS", "data": ""]
        XCTAssert(actual == expected)
    }

    /**
        This function tests to see if an existing user can be loaded.
     */
    func testLoadUser() throws {
<<<<<<< HEAD
        //var user = User()
        //user.setEmail(email: "testUser5f9e7b24a5136@covidlens.com")
        //user.setPassword(password: "12345ABC!")
        _ = connection.loadUser(user: TEST_USER)
        let actual = connection.getResponse()
        let expected = ["data": ["userData": "some user data", "id": "123"], "status": "SUCCESS"] as [String : Any]
        XCTAssert(actual["status"] as! String == expected["status"] as! String)
=======
        var user = User()
        user.setName(name: TEST_NAME)
        user.setEmail(email: TEST_EMAIL)
        user.setPassword(password: TEST_PASSWORD)
        user.setBasicID(basicID: TEST_BASIC_ID)
        _ = connection.loadUser(user: user)
        let actual = connection.getResponse() as? [String:String] ?? [:]
        let expected = ["status": "FAILED", "data": ""]
        XCTAssert(actual == expected)
    }
    
    /**
        This function tests to see if a users profile can be saved.
     */
    func testSave() throws {
        var user = User()
        user.setName(name: TEST_NAME)
        user.setEmail(email: TEST_EMAIL)
        user.setPassword(password: TEST_PASSWORD)
        user.setBasicID(basicID: TEST_BASIC_ID)
        _ = connection.save(user: user)
        let actual = connection.getResponse() as? [String:String] ?? [:]
        let expected = ["status": "FAILED", "data": "Random update "+UUID().uuidString]
        XCTAssert(actual == expected)
>>>>>>> 5df89cf136cc25ceac546cd025baea6e4078e0e2
    }
//
//    /**
//        This function tests to see if a users profile can be saved.
//     */
//    func testSave() throws {
//        var user = User()
//        user.setName(name: TEST_NAME)
//        user.setEmail(email: TEST_EMAIL)
//        user.setPassword(password: TEST_PASSWORD)
//        user.setBasicID(basicID: TEST_BASIC_ID)
//        _ = connection.save(user: user)
//        let actual = connection.getResponse() as? [String:String] ?? [:]
//        let expected = ["status": "FAILED", "data": ""]
//        XCTAssert(actual == expected)
//    }
//
//    /**
//        This function tests to see if an existing user can be loaded.
//     */
//    func testLogout() throws {
//        var user = User()
//        user.setName(name: TEST_NAME)
//        user.setEmail(email: TEST_EMAIL)
//        user.setPassword(password: TEST_PASSWORD)
//        user.setBasicID(basicID: TEST_BASIC_ID)
//        _ = connection.DataRequest(user: user)
//        let actual = connection.getResponse() as? [String:String] ?? [:]
//        let expected = ["status": "FAILED", "data": ""]
//        XCTAssert(actual == expected)
//    }
}
