//
//  ContentView.swift
//  Contactos
//
//  Created by TECDATA ENGINEERING on 9/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(fetchRequest: Contactos.mostrarContactos()) var contactos: FetchedResults<Contactos>
    
    /*@FetchRequest(entity: Contactos.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Contactos.nombre, ascending: true)]) var contactos: FetchedResults<Contactos>*/
    // SQL: SELECT * FROM CONTACTOS WHERE APELLIDO = 'OCAMPO' ORDER BY ASC
    /*@FetchRequest(entity: Contactos.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Contactos.nombre, ascending: true)],
                  predicate: NSPredicate(format: "apellido = %@", "Ocampo")) var contactos: FetchedResults<Contactos>*/
        
    var body: some View {
        NavigationView{
            
            VStack{
                List{
                    ForEach(self.contactos){ item in
                        NavigationLink {
                            DetalleContactoView(data: item)
                        } label: {
                            ContactosCell(contactos: item)
                        }
                    }.onDelete { index in
                        self.borrarRegistros(data: index)
                    }
                }
                
                NavigationLink(destination: AgregarContactoView()) {
                    HStack(spacing: 20){
                        Image(systemName: "plus.app.fill")
                            .foregroundColor(.white)
                            .font(.title)
                        Text("Guargar contacto")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                    .background(.green)
                    .clipShape(Capsule())
                }
            }
            .onAppear(perform: {
                debugPrint("CoreData path :: \(self.getCoreDataDBPath())")
            })
            .navigationBarItems(leading: EditButton())
            .navigationTitle("Contactos")
        }
        
    }
    
    private func borrarRegistros(data: IndexSet) {
        guard let indexUnw = data.first else { return }
        let borrarRegistro = self.contactos[indexUnw]
        self.viewContext.delete(borrarRegistro)
        do {
            try self.viewContext.save()
        } catch let error as NSError {
            print("Error al borrar registros", error.localizedDescription)
        }
    }
    
    func getCoreDataDBPath() {
        let path = FileManager
            .default
            .urls(for: .applicationSupportDirectory, in: .userDomainMask)
            .last?
            .absoluteString
            .replacingOccurrences(of: "file://", with: "")
            .removingPercentEncoding
        
        print("Core Data DB Path :: \(path ?? "Not found")")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
