//
//  Contactos.swift
//  Contactos
//
//  Created by TECDATA ENGINEERING on 9/3/22.
//

import Foundation
import CoreData

final class Contactos: NSManagedObject, Identifiable {
    
    @NSManaged public var apellido: String
    @NSManaged public var direccion: String
    @NSManaged public var edad: String
    @NSManaged public var email: String
    @NSManaged public var genero: String
    @NSManaged public var iniciales: String
    @NSManaged public var nombre: String
    @NSManaged public var telefono: String
    
    
}

// Queries first option
extension Contactos {
    
    static func mostrarContactos() -> NSFetchRequest<Contactos> {
        // SQL SELECTY * FROM CONTACTOS
        let request: NSFetchRequest<Contactos> = Contactos.fetchRequest() as! NSFetchRequest<Contactos>
        // SQL ORDER BY NOMBRE ASC
        request.sortDescriptors = [NSSortDescriptor(key: "nombre", ascending: true)]
        return request
    }
    
    
}
