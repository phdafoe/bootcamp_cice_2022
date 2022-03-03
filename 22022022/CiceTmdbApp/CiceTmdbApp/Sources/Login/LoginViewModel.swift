//
//  LoginViewModel.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 3/3/22.
//

import Foundation
import FirebaseAuth

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

final class LoginViewModel: ObservableObject {
    
    @Published var userLogged: User?
    @Published var userAutheticated = false
    @Published var error: NSError?
    
    private let authenticationData = Auth.auth()
    
    required init() {
        userLogged = authenticationData.currentUser
        authenticationData.addStateDidChangeListener(stateAuthenticationModified)
    }
    
    private func stateAuthenticationModified(with auth: Auth, user: User?) {
        guard user != self.userLogged else { return }
        self.userLogged = user
    }
    
    // SigIn
    func sigIn(with loginOption: LoginOption){
        self.userAutheticated = true
        self.error = nil
        switch loginOption{
        case .sessionWithApple:
            print("Login con Apple")
        case let .emailAndPassword(email, password):
            authenticationData.signIn(withEmail: email,
                                      password: password,
                                      completion: handlerAuthenticationState)
        }
    }
    
    // SigUp
    func signUp(email: String, password: String, passwordConfirmation: String){
        guard password == passwordConfirmation else {
            self.error = NSError(domain: "", code: 9210, userInfo: [NSLocalizedDescriptionKey: "La password y la confirmacion no son iguales"])
            return
        }
        self.userAutheticated = true
        self.error = nil
        authenticationData.createUser(withEmail: email,
                                      password: password,
                                      completion: handlerAuthenticationState)
    }
    
    // Logout
    func logoutSession() {
        do {
            try authenticationData.signOut()
        } catch {
            self.error = NSError(domain: "", code: 9999, userInfo: [NSLocalizedDescriptionKey: "El usuario no ha logrado cerrar la sesion"])
        }
    }
    
    // Handler
    private func handlerAuthenticationState(with auth: AuthDataResult?, and error: Error?) {
        DispatchQueue.main.async {
            self.userAutheticated = false
            if let user = auth?.user{
                self.userLogged = user
            } else if let errorUnw = error {
                self.error = errorUnw as NSError
            }
        }
    }
}
