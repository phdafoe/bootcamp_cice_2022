//
//  PeoplePopularServerModel.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 2/3/22.
//

import Foundation

// MARK: - PeoplePopularServerModel
struct PeoplePopularServerModel: Codable {
    let page: Int?
    let results: [ResultPeople]?
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
struct ResultPeople: Codable {
    let adult: Bool?
    let gender: Int?
    let id: Int?
    let knownFor: [KnownFor]?
    let knownForDepartment: String?
    let name: String?
    let popularity: Double?
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case knownFor = "known_for"
        case knownForDepartment = "known_for_department"
        case name = "name"
        case popularity = "popularity"
        case profilePath = "profile_path"
    }
}

// MARK: - KnownFor
struct KnownFor: Codable {
    let adult: Bool?
    let backdropPath: String?
    let firstAirDate: String?
    let genreIDS: [Int]?
    let id: Int?
    let mediaType: String?
    let name: String?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let posterPath: String?
    let voteAverage: Double?
    let voteCount: Int?
    let originalTitle: String?
    let releaseDate: String?
    let title: String?
    let video: Bool?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIDS = "genre_ids"
        case id = "id"
        case mediaType = "media_type"
        case name = "name"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case title = "title"
        case video = "video"
    }
}

extension PeoplePopularServerModel {
    
    static var stubbedPeoplePopular: PeoplePopularServerModel? {
        let response: PeoplePopularServerModel? = try? Bundle.main.loadAndDecodeJSON(filename: "PeoplePopularModel")
        if let responseUnw = response {
            return responseUnw
        }
        return nil
    }
    
}

