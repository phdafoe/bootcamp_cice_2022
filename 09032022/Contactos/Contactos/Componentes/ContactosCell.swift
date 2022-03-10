//
//  ContactosCell.swift
//  Contactos
//
//  Created by TECDATA ENGINEERING on 9/3/22.
//

import SwiftUI

struct ContactosCell: View {
    
    @ObservedObject var contactos: Contactos

    var body: some View {
        HStack{
            Text(contactos.iniciales)
                .padding(20)
                .background(.gray)
                .clipShape(Circle())
                .foregroundColor(.white)
                .font(.title)
            
            VStack(alignment: .leading){
                Text(contactos.nombre)
                    .font(.title)
                    .bold()
                Text(contactos.apellido)
                    .font(.headline)
                Text(contactos.telefono)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ContactosCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactosCell(contactos: Contactos())
    }
}
