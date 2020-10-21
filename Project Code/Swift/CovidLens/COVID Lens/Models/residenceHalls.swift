//
//  residenceHalls.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/19/20.
//

import Foundation

struct residenceHall : Codable {
    var name: String
    var lat: Double
    var long: Double
    var cases: Int
}
