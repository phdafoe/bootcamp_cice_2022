//
//  AppleServerModel.swift
//  CiceMusic
//
//  Created by Andres Felipe Ocampo Eljaiek on 7/2/22.
//

import Foundation

// MARK: - AppleServerModel
struct AppleServerModel: Codable {
    let feed: Feed?

    enum CodingKeys: String, CodingKey {
        case feed = "feed"
    }
}

// MARK: - Feed
struct Feed: Codable {
    let title: String?
    let id: String?
    let author: Author?
    let links: [Link]?
    let copyright: String?
    let country: String?
    let icon: String?
    let updated: String?
    let results: [ResultMusic]?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case id = "id"
        case author = "author"
        case links = "links"
        case copyright = "copyright"
        case country = "country"
        case icon = "icon"
        case updated = "updated"
        case results = "results"
    }
}

// MARK: - Author
struct Author: Codable {
    let name: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}

// MARK: - Link
struct Link: Codable {
    let linkSelf: String?

    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
    }
}

// MARK: - Result
struct ResultMusic: Codable {
    let artistName: String?
    let id: String?
    let name: String?
    let releaseDate: String?
    let kind: String?
    let artistId: String?
    let artistUrl: String?
    let contentAdvisoryRating: String?
    let artworkUrl100: String?
    let genres: [Genre]?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case id = "id"
        case name = "name"
        case releaseDate = "releaseDate"
        case kind = "kind"
        case artistId = "artistId"
        case artistUrl = "artistUrl"
        case contentAdvisoryRating = "contentAdvisoryRating"
        case artworkUrl100 = "artworkUrl100"
        case genres = "genres"
        case url = "url"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let genreId: String?
    let name: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case genreId = "genreId"
        case name = "name"
        case url = "url"
    }
}

