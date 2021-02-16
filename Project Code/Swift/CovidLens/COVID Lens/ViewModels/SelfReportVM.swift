//
//  SelfReportVM.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/12/20.
//

import Foundation

final class SelfReportVM: ObservableObject {
    
    @Published var showAlert = false
    @Published var activeAlert: ActiveAlert = .valid
    @Published var reportSubmitedAlert = false
    @Published var invalidReportAlert = false
    var twoWeeks = 14
    
    let title = "Share A Positive Result"
    let info = "If you test positive for COVID-19, experience COVID-19 symptoms, or have been identified as a close contact of someone who has tested positive for COVID-19, please fill out and submit the following form."
    let disclaimer = "Important: * indicates a required field."
    let icon = "checkmark.shield.fill"
    var affiliations: [String] = ["Student", "Faculty", "Staff", "Contractor"]
    var resHall: [String] = ["Cone", "Grogan", "Guilford", "Mary Foust", "Moore/Strong", "North Spencer", "Phillips/Hawkins", "Ragsdale/Mendenhall", "Reynolds", "South Spencer", "Weil/Winfield", "Jefferson Suites", "Shaw", "Gray", "Hinshaw", "Bailey", "Cotten", "Coit", "Jamison", "Lee", "Haywood", "Union", "Highland", "Lexington", "McCormick", "Spring Garden Appartments", "Tower Village"].sorted()
}
