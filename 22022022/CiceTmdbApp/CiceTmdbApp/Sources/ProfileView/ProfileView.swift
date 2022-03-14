//
//  ProfileView.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 3/3/22.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModelSession: LoginViewModel
    @State private var isPresented = false
    
    var body: some View {
        if self.viewModelSession.userLogged != nil{
            Form{
                Section("Profile data"){
                    Button {
                        self.viewModelSession.logoutSession()
                    } label: {
                        Text("Logout")
                    }
                    .buttonStyleH1()
                }
                Section("Mis favoritos"){
                    Button {
                        self.isPresented.toggle()
                    } label: {
                        Text("Favorites")
                    }
                    .buttonStyleH1()
                    .sheet(isPresented: self.$isPresented) {
                        //
                    } content: {
                        FavouritesCoordinator.navigation()
                    }
                }
            }
        } else {
            ContentView()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
