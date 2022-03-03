//
//  LoginViewModel.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 3/3/22.
//

import Foundation

enum LoginOption{
    case sessionWithApple
    case emailAndPassword(email: String, password: String)
}

enum AuthenticationType: String {
    
    case signIn
    case signUp
    
    var text: String {
        rawValue.capitalized
    }
    
    var footterText: String {
        switch self{
        case .signIn:
            return "Your aren't member yet, SignUp"
        case .signUp:
            return "Are your ready for Cice TMDB App??"
        }
    }
    
}
