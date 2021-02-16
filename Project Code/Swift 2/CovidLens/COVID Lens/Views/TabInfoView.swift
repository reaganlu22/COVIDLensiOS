//
//  TabInfoView.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/12/20.
//

import SwiftUI

struct TabInfoView: View {
    var icon: String = ""
    var title: String = ""
    var info: String = ""
    var disclaimer: String? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10){
                Image(systemName: icon)
                    .imageScale(.large)
                    .foregroundColor(.black)
                if #available(iOS 14.0, *) {
                    Text(title)
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                } else {
                    // Fallback on earlier versions
                }
            }.padding(.top, 10)
            .padding(.horizontal, 12)
            Text(info)
                .foregroundColor(.black)
                .padding([.horizontal, .bottom], 12)
                .font(.system(size: 16.0))
                .fixedSize(horizontal: false, vertical: true)
            if let disclaimerMsg = disclaimer {
                Text(disclaimerMsg)
                    .italic()
                    .foregroundColor(Color.black.opacity(0.6))
                    .padding(.top, -12)
                    .padding([.horizontal, .bottom], 12)
                    .font(.system(size: 16.0))
            }
        }.padding(.all, 12)
        .padding(.top, 8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black.opacity(0.7))
                .padding(.all, 10)
                .padding(.top, 8)
        )
    }
}
