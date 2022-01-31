//
//  ContactosServerModel.swift
//  MiTaskVersion3.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 31/1/22.
//

import Foundation

// MARK: - ContactosServerModel
struct ContactosServerModel: Codable {
    let arrayContacts: [ArrayContact]?

    enum CodingKeys: String, CodingKey {
        case arrayContacts = "arrayContacts"
    }
}

// MARK: - ArrayContact
struct ArrayContact: Codable {
    let firstName: String?
    let lastName: String?
    let usernameTwitter: String?
    let createdPost: String?
    let experienciaCV: String?
    let numeroSeguidores: String?
    let abstractoVC: String?
    let descriptionCV: String?
    let imageProfile: String?
    let imagePost: String?
    let telefonoMovil: String?
    let telefonoTrabajo: String?
    let email: String?
    let cuentaLinkedin: String?

    enum CodingKeys: String, CodingKey {
        case firstName = "firstName"
        case lastName = "lastName"
        case usernameTwitter = "usernameTwitter"
        case createdPost = "createdPost"
        case experienciaCV = "experienciaCV"
        case numeroSeguidores = "numeroSeguidores"
        case abstractoVC = "abstractoVC"
        case descriptionCV = "descriptionCV"
        case imageProfile = "imageProfile"
        case imagePost = "imagePost"
        case telefonoMovil = "telefonoMovil"
        case telefonoTrabajo = "telefonoTrabajo"
        case email = "email"
        case cuentaLinkedin = "cuentaLinkedin"
    }
}

// MARK: - HUB
extension ContactosServerModel {
    
    static var stubbedContactos: [ArrayContact]? {
        var arrayContactos: [ArrayContact] = []
        do {
            let response: ContactosServerModel? = try Bundle.main.loadAndDecodeJSON(filename: "contacts")
            arrayContactos = response?.arrayContacts ?? []
        } catch let error {
            debugPrint(error.localizedDescription)
        }
        return arrayContactos
    }
    
}

extension Bundle {
    
    func loadAndDecodeJSON<D: Decodable>(filename: String) throws -> D? {
        
        guard let url = self.url(forResource: filename, withExtension: ".json") else {
            return nil
        }
        
        let data = try Data(contentsOf: url)
        let decodeModel = try JSONDecoder().decode(D.self, from: data)
        return decodeModel
    }
    
}
