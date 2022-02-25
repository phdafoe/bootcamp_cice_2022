//
//  ShowsServerModel.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 25/2/22.
//

import Foundation

// MARK: - ShowsServerModel
struct ShowsServerModel: Codable {
    let page: Int?
    let results: [ResultShows]?
    let totalPages: Int?
    let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct ResultShows: Codable {
    let backdropPath: String?
    let firstAirDate: String?
    let genreIDS: [Int]?
    let id: Int?
    let name: String?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIDS = "genre_ids"
        case id = "id"
        case name = "name"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension ShowsServerModel {
    
    static var stubbedShows: [ResultShows] {
        let response: ShowsServerModel? = try? Bundle.main.loadAndDecodeJSON(filename: "ShowsModel")
        return response?.results ?? []
    }
    
    static var stubbedShow: ResultShows {
        return stubbedShows[0]
    }
    
}


