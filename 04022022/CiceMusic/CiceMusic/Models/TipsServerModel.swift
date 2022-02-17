//
//  TipsServerModel.swift
//  CiceMusic
//
//  Created by TECDATA ENGINEERING on 17/2/22.
//

import Foundation


// MARK: - TipsServerModel
struct TipsServerModel: Codable {
    let icoResponseConsejos: IcoResponseConsejos?

    enum CodingKeys: String, CodingKey {
        case icoResponseConsejos = "icoResponseConsejos"
    }
}


// MARK: - IcoResponseConsejos
struct IcoResponseConsejos: Codable {
    let consejosGenerales: [ConsejosGenerale]?

    enum CodingKeys: String, CodingKey {
        case consejosGenerales = "consejosGenerales"
    }
}

// MARK: - ConsejosGenerale
struct ConsejosGenerale: Codable {
    let image: String?
    let title: String?
    let subtitle: String?
    let messageArray: [MessageArray]?

    enum CodingKeys: String, CodingKey {
        case image = "image"
        case title = "title"
        case subtitle = "subtitle"
        case messageArray = "messageArray"
    }
}

// MARK: - MessageArray
struct MessageArray: Codable {
    let titleMessage: String?
    let developMessage: String?

    enum CodingKeys: String, CodingKey {
        case titleMessage = "titleMessage"
        case developMessage = "developMessage"
    }
}

