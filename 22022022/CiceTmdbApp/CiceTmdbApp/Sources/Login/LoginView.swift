//
//  LoginView.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 3/3/22.
//

import SwiftUI

struct LoginView: View {
    
    
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
                if true{
                    VStack(spacing: 20){
                        CustomTextField(placeholder: "email",
                                        title: "email",
                                        text: self.$email)
                            .padding(10)
                            .background(
                                Color(red: 239/255,
                                      green: 243/255,
                                      blue: 244/255,
                                      opacity: 1)
                            )
                            .cornerRadius(10)
                            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 5, y: 5)
                        
                        if self.showPassword{
                            CustomTextField(placeholder: "Password",
                                            title: "Password",
                                            text: self.$password)
                                .padding(10)
                                .background(
                                    Color(red: 239/255,
                                          green: 243/255,
                                          blue: 244/255,
                                          opacity: 1)
                                )
                                .cornerRadius(10)
                                .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 5, y: 5)
                        } else {
                            CustomSecureTextField(placeholder: "Password",
                                                  title: "Password",
                                                  text: self.$password)
                                .padding(10)
                                .background(
                                    Color(red: 239/255,
                                          green: 243/255,
                                          blue: 244/255,
                                          opacity: 1)
                                )
                                .cornerRadius(10)
                                .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 5, y: 5)
                        }
                        
                        if authType == .signUp{
                            if showPassword {
                                CustomTextField(placeholder: "ConfirmationPassword",
                                                title: "ConfirmationPassword",
                                                text: self.$confirmationPassword)
                                    .padding(10)
                                    .background(
                                        Color(red: 239/255,
                                              green: 243/255,
                                              blue: 244/255,
                                              opacity: 1)
                                    )
                                    .cornerRadius(10)
                                    .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 5, y: 5)
                            } else {
                                CustomSecureTextField(placeholder: "ConfirmationPassword",
                                                      title: "ConfirmationPassword",
                                                      text: self.$confirmationPassword)
                                    .padding(10)
                                    .background(
                                        Color(red: 239/255,
                                              green: 243/255,
                                              blue: 244/255,
                                              opacity: 1)
                                    )
                                    .cornerRadius(10)
                                    .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 5, y: 5)
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
                                .font(.headline)
                                .lineLimit(2)
                                .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
                                .background(
                                    Color(red: 239/255, green: 243/255, blue: 244/255)
                                )
                                .clipShape(Capsule())
                        }
                        .foregroundColor(.gray)
                        .padding()
                        
                        
                        
                        // BOTON DE cambio de formulario sino estoy logado
                        Button {
                            self.footerTouched()
                        } label: {
                            Text(self.authType.footterText)
                                .font(.headline)
                                .lineLimit(2)
                                .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
                                .background(
                                    Color(red: 239/255, green: 243/255, blue: 244/255)
                                )
                                .clipShape(Capsule())
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
        
    }
    
    private func footerTouched() {
        self.authType = authType == .signUp ? .signIn : .signUp
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authType: .signIn)
    }
}
