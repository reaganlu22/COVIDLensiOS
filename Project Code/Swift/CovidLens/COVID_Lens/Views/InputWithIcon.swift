//
//  InputWithIcon.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/9/20.
//

import SwiftUI

struct InputWithIcon: View {
    var placeholder:String = ""
    var value: Binding<String>
    var icon: String? = nil
    var secure: Bool = false
    
    var body: some View {
        Group {
            HStack {
                if let iconName = icon {
                    Image(systemName: iconName)
                        .font(.title2)
                        .foregroundColor(.black)
                        .frame(width: 35)
                }
                if (secure) {
                    SecureField(placeholder, text: value)
                        .font(.title2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .ignoresSafeArea(.keyboard, edges: .bottom)
                } else {
                    TextField(placeholder, text: value)
                        .font(.title2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .ignoresSafeArea(.keyboard, edges: .bottom)
                }
            }.padding(.horizontal, 20)
            .padding(.bottom, 5)
        }
    }
}
