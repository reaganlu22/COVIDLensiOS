//
//  ResourcesVM.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/12/20.
//

import Foundation

final class ResourcesVM: ObservableObject {
    let links = [
        LinkViewModel(name: "UNCG COVID-19 Updates", url: URL("https://update.uncg.edu/home/")),
        .init(name: "North Carolina Department of Health and Human Servics (NCDHHS)", url: URL("https://covid19.ncdhhs.gov")),
        .init(name: "Centers for Disease Control and Prevention (CDC)", url: URL("https://www.cdc.gov/coronavirus/2019-nCoV/index.html")),
        .init(name: "World Health Organization (WHO)", url: URL("https://www.who.int/emergencies/diseases/novel-coronavirus-2019")),
        .init(name: "Guilford County Health Department", url: URL("https://www.guilfordcountync.gov/our-county/human-services/health-department/coronavirus-covid-19-info")),
        .init(name: "Nearby Testing Locations", url: URL("https://covid19.ncdhhs.gov/about-covid-19/testing/find-my-testing-place"))
    ]
    let title = "COVID-19-Related Resources"
    let info = "Relevant links regarding COVID-19-related information are provided below."
    let icon = "list.bullet"
}

struct LinkViewModel: Hashable {
    let name: String
    let url: URL
}

extension URL {
    init(_ string: StaticString) {
        self.init(string: "\(string)")!
    }
}
