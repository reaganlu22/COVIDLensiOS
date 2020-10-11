//
//  HomeView.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/8/20.
//

import SwiftUI

struct HomeView: View {
    // string array from database of of form: <affiliation> : <number of cases>
    let data = ["Student", "13", "Faculty", "4", "Staff", "12", "Contractor", "1"]
    
    // two-column grid
    let layout = [GridItem(.flexible()), GridItem(.flexible()) ]
    
    var body: some View {
        NavigationView {
            VStack {
                //ScrollView {
                Spacer()
                    Text("Confirmed UNCG Cases")
                        .font(.title)
                        .foregroundColor(.black)
                        .fontWeight(.heavy)
                        .padding(.all)
                        .multilineTextAlignment(.center)
                    VStack {
                        LazyVGrid(columns: layout, spacing: 40) {
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
                        }.padding(.vertical, 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 5)
                        )
                    }.padding(.horizontal, 20)
                Spacer()
                Divider()
                //}
            }.background(Color.white.ignoresSafeArea(.all, edges: .all))
            .navigationBarTitle("Home", displayMode: .inline)
        }
    }
}
