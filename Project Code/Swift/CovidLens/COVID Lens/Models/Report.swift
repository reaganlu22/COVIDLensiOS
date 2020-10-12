//
//  Report.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/9/20.
//

import Foundation

struct Report: Codable {
    let affiliation: String
    let phoneNumber: String
    let residenceHall: String
    let lastOnCampus: Date
}
