//
//  UserDataTests.swift
//  COVID LensTests
//
//  Created by Isaac Taylor on 10/16/20.
//

import XCTest
@testable import COVID_Lens
class UserDataTests: XCTestCase {

    let TEST_EMAIL:String = ""
    let TEST_PASSWORD:String = ""
    let TEST_BASIC_ID:String = ""
    let TEST_NAME:String = ""
    
    private var connection = UserData()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /**
        This function tests to see if a default failure message is returned from the server when trying to perform a data request.
     */
    func testFailSafe(){
        var user = User()
        user.setName(name: "test person")
        _ = connection.DataRequest(user: user)
        dump(connection.getResponse())
        let actual = connection.getResponse() as? [String:String] ?? [:]
        let expected = ["status": "FAILED", "data": ""]
        XCTAssert(actual == expected)
    }
    
    func testCreateUser() throws {
        XCTAssert(1 == 0)
    }



}
