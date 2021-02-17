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
    let title = "COVID-19-Related Resources" //Resource title
    let title2 = "About COVID Lens" //App documetation title
    let info2 = "The purpose of our application and it's Documentation"
    let info = "Relevant links regarding COVID-19-related information are provided below."
    let icon = "list.bullet"
    let linksAboutUs = [
        LinkViewModel(name: "Technical Report",url:
            URL("https://drive.google.com/file/d/1fu-v5XfzR_svfXrcgWdH3PikS5yG3Y7p/view?usp=sharing")),
                        .init(name:"User Maunual", url:
                              URL("https://drive.google.com/file/d/1lKo7z_ZLJXlDPJeJaahxFuVHudcN1JO-/view?usp=sharing")),
                        .init(name:"Project Definition", url:
                              URL("https://drive.google.com/file/d/1NbBSSUxsJ-4uoEYGP5fQfQ_O6yyY38pQ/view?usp=sharing")),
                        .init(name:"Progress Report",url:
                              URL("https://drive.google.com/file/d/11zGWcbjALRgtQn6i26tIsjoc8DNzXvJe/view?usp=sharing")),
                        .init(name:"COVID Lens Application Poster", url:
                              URL("https://drive.google.com/file/d/1Pa0bxTEHIgn8nuEwU7iv4Ynay1XfuoRy/view?usp=sharing"))]
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
