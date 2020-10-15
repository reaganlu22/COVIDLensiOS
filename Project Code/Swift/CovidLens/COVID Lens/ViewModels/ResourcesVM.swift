//
//  ResourcesVM.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/12/20.
//

import Foundation

final class ResourcesVM: ObservableObject {
    let links = [
        LinkViewModel(name: "North Carolina Department of Health and Human Servics (NCDHHS)", url: URL("https://covid19.ncdhhs.gov")),
        .init(name: "Centers for Disease Control and Prevention (CDC)", url: URL("https://www.cdc.gov/coronavirus/2019-nCoV/index.html")),
        .init(name: "World Health Organization (WHO)", url: URL("https://www.who.int/emergencies/diseases/novel-coronavirus-2019"))
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
