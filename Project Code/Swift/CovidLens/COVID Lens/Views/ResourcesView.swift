//
//  ResourcesView.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/8/20.
//

import SwiftUI

@available(iOS 14.0, *)
struct ResourcesView: View {
    private var viewModel = ResourcesVM()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    // info text
                    TabInfoView(icon: viewModel.icon, title: viewModel.title, info: viewModel.info)
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(viewModel.links, id: \.self) { website in
                            HStack(spacing: 15) {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 8.0))
                                    .foregroundColor(.black)
                                // links to resources
                                Link(destination: website.url, label: {
                                    Text(website.name)
                                        .font(.system(size: 17.0))
                                        .foregroundColor(.blue)
                                        .fontWeight(.medium)
                                })
                                Spacer()
                            }
                        }
                    }.padding(.top)
                    .padding(.horizontal, 20)
                }
                .padding(.vertical, -8)
                Spacer()
                Divider()
            }.background(Color.white.ignoresSafeArea(.all, edges: .all))
            .navigationBarTitle("Resources", displayMode: .inline)
        }
    }
}
