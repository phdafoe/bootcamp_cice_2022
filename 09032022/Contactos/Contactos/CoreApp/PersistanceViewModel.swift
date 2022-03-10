//
//  PersistanceViewModel.swift
//  Contactos
//
//  Created by TECDATA ENGINEERING on 10/3/22.
//

import CoreData

struct PersistanceViewModel {
    
    static let shared = PersistanceViewModel()
    
    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "Contactos")
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores { storeDescription, error in
            if let errorUnw = error as NSError? {
                fatalError("Error desconocido \(errorUnw), \(errorUnw.userInfo)")
            }
        }
    }
    
}
