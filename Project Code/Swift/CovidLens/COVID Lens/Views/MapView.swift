//
//  MapView.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/8/20.
//

import SwiftUI
import GoogleMaps
import UIKit

struct MapView: View {
    var body: some View {
        NavigationView {
            VStack {
                GoogleMapsView().edgesIgnoringSafeArea(.all).padding(.vertical, -8)
                Divider()
            }.background(Color.white.ignoresSafeArea(.all, edges: .all))
            .navigationBarTitle("Map", displayMode: .inline)
        }
    }
}

