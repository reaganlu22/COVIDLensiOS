//
//  HomeView.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/8/20.
//

import SwiftUI

@available(iOS 14.0, *)
struct HomeView: View {
    private var viewModel = HomeVM()
    // string array from database of of form: <affiliation> : <number of cases>
    let data = ["Student", "13", "Faculty", "4", "Staff", "12", "Contractor", "1"]
    
    // two-column grid
    let layout = [GridItem(.flexible()), GridItem(.flexible()) ]
    
    var body: some View {
        NavigationView {
            VStack {
                //ScrollView {
                TabInfoView(icon: viewModel.icon, title: viewModel.title, info: viewModel.info, disclaimer: viewModel.disclaimer)
                Spacer()
                VStack {
                    LazyVGrid(columns: layout, spacing: 30) {
                        ForEach(data, id: \.self) { item in
                            Text(item)
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                        }
                        Text("Total")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text("30")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }.padding(.vertical, 25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 4)
                    )
                }.padding(.horizontal, 20)
                
                .padding(.vertical, -8)
                Spacer()
                Divider()
                //}
            }.background(Color.white.ignoresSafeArea(.all, edges: .all))
            .navigationBarTitle("Home", displayMode: .inline)
        }
    }
}
