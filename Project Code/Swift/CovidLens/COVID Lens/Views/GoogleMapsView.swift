//
//  GoogleMapsView.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/9/20.
//

import SwiftUI
import GoogleMaps

struct GoogleMapsView: UIViewRepresentable {
    
    let resHalls = [
        // Tradtional Halls
        [
            "name": "Cone Residence Hall",
            "lat": 36.071220,
            "long": -79.807663,
            "cases": 0
        ],
        [
            "name": "Grogan Residence Hall",
            "lat": 36.071238,
            "long": -79.808695,
            "cases": 0
        ],
        [
            "name": "Guilford Residence Hall",
            "lat": 36.070312,
            "long": -79.808645,
            "cases": 0
        ],
        [
            "name": "Mary Foust Residence Hall",
            "lat": 36.070248,
            "long": -79.807991,
            "cases": 0
        ],
        [
            "name": "Moore/Strong Residence Hall",
            "lat": 36.071925,
            "long": -79.810980,
            "cases": 0
        ],
        [
            "name": "North Spencer Residence Hall",
            "lat": 36.069807,
            "long": -79.808637,
            "cases": 0
        ],
        [
            "name": "Phillips/Hawkins Residence Hall",
            "lat": 36.072588,
            "long": -79.809874,
            "cases": 0
        ],
        [
            "name": "Ragsdale/Mendenhall Residence Hall",
            "lat": 36.070663,
            "long": -79.810001,
            "cases": 0
        ],
        [
            "name": "Reynolds Residence Hall",
            "lat": 36.070988,
            "long": -79.809119,
            "cases": 0
        ],
        [
            "name": "South Spencer Residence Hall",
            "lat": 36.068966,
            "long": -79.808702,
            "cases": 0
        ],
        [
            "name": "Weil/Winfield Residence Hall",
            "lat": 36.071187,
            "long": -79.811050,
            "cases": 0
        ],
        // Suites
        [
            "name": "Jefferson Suites",
            "lat": 36.064802,
            "long": -79.813160,
            "cases": 0
        ],
        [
            "name": "Shaw Residence Hall",
            "lat": 36.068831,
            "long": -79.811276,
            "cases": 0
        ],
        [
            "name": "Gray Residence Hall",
            "lat": 36.069313,
            "long": -79.810866,
            "cases": 0
        ],
        [
            "name": "Hinshaw Residence Hall",
            "lat": 36.069339,
            "long": -79.811541,
            "cases": 0
        ],
        [
            "name": "Bailey Residence Hall",
            "lat": 36.069931,
            "long":-79.811485,
            "cases": 0
        ],
        [
            "name": "Cotten Residence Hall",
            "lat": 36.069862,
            "long": -79.810816,
            "cases": 0
        ],
        [
            "name": "Coit Residence Hall",
            "lat": 36.070422,
            "long": -79.810766,
            "cases": 0
        ],
        [
            "name": "Jamison Residence Hall",
            "lat": 36.070482,
            "long": -79.811409,
            "cases": 0
        ],
        // Apartments
        [
            "name": "Lee Residence Hall",
            "lat": 36.062782,
            "long": -79.807556,
            "cases": 0
        ],
        [
            "name": "Haywood Residence Hall",
            "lat": 36.062096,
            "long": -79.807478,
            "cases": 0
        ],
        [
            "name": "Union Residence Hall",
            "lat": 36.062026,
            "long": -79.807083,
            "cases": 0
        ],
        [
            "name": "Highland Residence Hall",
            "lat": 36.062752,
            "long": -79.806889,
            "cases": 0
        ],
        [
            "name": "Lexington Residence Hall",
            "lat": 36.062805,
            "long": -79.809754,
            "cases": 0
        ],
        [
            "name": "McCormick Residence Hall",
            "lat": 36.062659,
            "long": -79.811106,
            "cases": 0
        ],
        [
            "name": "Spring Garden Appartments",
            "lat": 36.065425,
            "long": -79.814261,
            "cases": 0
        ],
        [
            "name": "Tower Village",
            "lat": 36.064436,
            "long": -79.814264,
            "cases": 0
        ]
    ]
    
    func makeUIView(context: Self.Context) -> GMSMapView {
        
        let camera = GMSCameraPosition.camera(withLatitude: 36.0679, longitude: -79.810463, zoom: 15.5)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        do {
            // set the Goole Map style with style.json
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        // read residence hall info from json file
        for hall in DataLoader().readJSON() {
            let marker : GMSMarker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: hall.lat , longitude: hall.long )
            marker.title = hall.name
            marker.snippet = "Confirmed COVID-19 Cases: " + String(hall.cases)
            marker.icon = UIImage(named: "markerIcon")
            marker.map = mapView
        }
        
        // read resdience hall info from code above (array of dicts)
        //        for hall in resHalls {
        //            let marker : GMSMarker = GMSMarker()
        //            marker.position = CLLocationCoordinate2D(latitude: hall["lat"] as! CLLocationDegrees, longitude: hall["long"] as! CLLocationDegrees)
        //            marker.title = hall["name"] as? String
        //            marker.snippet = "Confirmed COVID-19 Cases: " + "\(hall["cases"] ?? "")"
        //            marker.icon = UIImage(named: "markerIcon")
        //            marker.map = mapView
        //        }
    }
}

