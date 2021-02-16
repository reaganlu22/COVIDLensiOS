//
//  PrimaryButton.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/8/20.
//

import SwiftUI

struct PrimaryButton: View {
    var label: String = ""
    var icon: String? = nil
    var action: () -> Void
    
    var body:  some View {
        Button(action: {
            self.action()
        }) {
            HStack {
                if icon != nil {
                    Image("google")
                        .resizable()
                        .frame(width: 36, height: 36)
                }
                Text(label)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.all, 8)
            }
        }.buttonStyle(PrimaryButtonStyle())
    }
}
