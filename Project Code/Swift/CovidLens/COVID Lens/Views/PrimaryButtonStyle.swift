//
//  PrimaryButtonStyle.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/7/20.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    var fillColor: Color = Color(red: 0/255, green: 193/255, blue: 203/255)
    func makeBody(configuration: Configuration) -> some View {
        return PrimaryButtonStyle(configuration: configuration, fillColor: fillColor)
    }
    
    struct PrimaryButtonStyle: View {
        let configuration: Configuration
        let  fillColor: Color
        var body: some View {
            return configuration.label
                .padding(1)
                .background(RoundedRectangle(cornerRadius: 10.0).fill(fillColor))
        }
    }
}
