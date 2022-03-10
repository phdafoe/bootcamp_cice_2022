//
//  ContactosApp.swift
//  Contactos
//
//  Created by TECDATA ENGINEERING on 9/3/22.
//

import SwiftUI

@main
struct ContactosApp: App {
    
    let persistanceVM = PersistanceViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistanceVM.container.viewContext)
        }
    }
}
