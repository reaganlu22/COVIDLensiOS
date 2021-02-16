//
//  Report.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/9/20.
//

import Foundation

struct Report: Codable {
    var age: Int
    var phoneNumber: String
    var residenceHall: String
    var affiliation: String
    var locationID: String
    var reportStatus: String
    var reportInfo: String
    var situationDescription: String
    var confirmerID: String
    var submitterID: String
    var reportID: String
    
    enum CodkingKeys: String, CodingKey {
        case age
        case phoneNumber
        case residenceHall
        case affiliation
        case locationID
        case reportStatus
        case reportInfo
        case situationDescription
        case confirmerID
        case submitterID
        case reportID
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodkingKeys.self)
        try container.encode(age, forKey: .age)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(residenceHall, forKey: .residenceHall)
        try container.encode(affiliation, forKey: .affiliation)
        try container.encode(locationID, forKey: .locationID)
        try container.encode(reportStatus, forKey: .reportStatus)
        try container.encode(reportInfo, forKey: .reportInfo)
        try container.encode(situationDescription, forKey: .situationDescription)
        try container.encode(confirmerID, forKey: .confirmerID)
        try container.encode(submitterID, forKey: .submitterID)
        try container.encode(reportID, forKey: .reportID)
    }
}
