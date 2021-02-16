//
//  LoginSignupViewModel.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/7/20.
//

import Foundation

final class LoginSignupViewModel: ObservableObject {
    private let mode: Mode
    
    init(mode: Mode) {
        self.mode = Mode
    }
    
    
    
}

extension LoginSignupViewModel {
    enum Mode {
        case login
        case signup
    }
}
