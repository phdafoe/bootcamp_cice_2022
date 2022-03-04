//
//  LoginView.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 3/3/22.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModelSession: LoginViewModel
    @State var authType: AuthenticationType
    
    @State var email = ""
    @State var password = ""
    @State var confirmationPassword = ""
    @State var showPassword = false
    
    
    var body: some View {
        ZStack{
            VStack(spacing: 40){
                helloApp
                imageAppLogo
                // Haremos una comprobacion para saber si el usuarioa esta autenticado en Firebase
                if !self.viewModelSession.userAutheticated {
                    VStack(spacing: 20){
                        CustomTextField(placeholder: "email",
                                        title: "email",
                                        text: self.$email)
                            .textfieldStyle()
                        
                        if self.showPassword{
                            CustomTextField(placeholder: "Password",
                                            title: "Password",
                                            text: self.$password)
                                .textfieldStyle()
                        } else {
                            CustomSecureTextField(placeholder: "Password",
                                                  title: "Password",
                                                  text: self.$password)
                                .textfieldStyle()
                        }
                        
                        if authType == .signUp{
                            if showPassword {
                                CustomTextField(placeholder: "ConfirmationPassword",
                                                title: "ConfirmationPassword",
                                                text: self.$confirmationPassword)
                                    .textfieldStyle()
                            } else {
                                CustomSecureTextField(placeholder: "ConfirmationPassword",
                                                      title: "ConfirmationPassword",
                                                      text: self.$confirmationPassword)
                                    .textfieldStyle()
                            }
                        }
                        
                        Toggle("show password", isOn: self.$showPassword)
                            .padding()
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        // BOTON DE LOGIN / REGISTRO
                        Button {
                            self.authEmailTouched()
                        } label: {
                            Text(self.authType.text)
                                .buttonStyleH1()
                        }
                        .foregroundColor(.gray)
                        .padding()
                        
                        
                        
                        // BOTON DE cambio de formulario sino estoy logado
                        Button {
                            self.footerTouched()
                        } label: {
                            Text(self.authType.footterText)
                                .buttonStyleH1()
                        }
                        .foregroundColor(.gray)
                        .padding()
                    }
                }
            }
            .padding()
        }
    }
    
    var helloApp: some View {
        Text("Cice TMDB App")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 10)
            .foregroundColor(.gray)
    }
    
    var imageAppLogo: some View {
        Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.horizontal, 20)
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)
            .overlay(
                Circle()
                    .stroke(Color.red, lineWidth: 2)
            )
    }
    
    private func authEmailTouched() {
        switch authType{
        case .signIn:
            self.viewModelSession.sigIn(with: .emailAndPassword(email: self.email, password: self.password))
        case .signUp:
            self.viewModelSession.signUp(email: self.email, password: self.password, passwordConfirmation: self.confirmationPassword)
        }
    }
    
    private func footerTouched() {
        self.authType = authType == .signUp ? .signIn : .signUp
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authType: .signUp)
    }
}
