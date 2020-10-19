//
//  Report.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/9/20.
//

import Foundation

struct Report: Codable {
    var id = UUID()
    var affiliation: String
    var phoneNumber: String
    var residenceHall: String
    var lastOnCampus: Date
    var age: Int
    var status: String
}
