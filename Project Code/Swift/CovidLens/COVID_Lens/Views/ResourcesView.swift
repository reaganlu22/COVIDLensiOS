//
//  ResourcesView.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/8/20.
//

import SwiftUI

struct ResourcesView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    
                }
                Spacer()
                Divider()
            }.background(Color.white.ignoresSafeArea(.all, edges: .all))
            .navigationBarTitle("Resources", displayMode: .inline)
        }
    }
}
