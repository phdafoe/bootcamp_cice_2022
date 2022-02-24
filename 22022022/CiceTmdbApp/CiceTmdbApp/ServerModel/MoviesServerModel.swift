//
//  MoviesServerModel.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 22/2/22.
//

import Foundation

// MARK: - MoviesServerModel
struct MoviesServerModel: Codable {
    let page: Int?
    let results: [ResultNowPlaying]?
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
struct ResultNowPlaying: Codable, Identifiable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id = "id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension MoviesServerModel {
    
    static var stubbedMoviesNowPlaying: [ResultNowPlaying] {
        let response: MoviesServerModel? = try? Bundle.main.loadAndDecodeJSON(filename: "MoviesModel")
        return response?.results ?? []
    }
    
    static var stubbedMovieNowPlaying: ResultNowPlaying {
        return stubbedMoviesNowPlaying[0]
    }
    
}

extension Bundle {
    func loadAndDecodeJSON<D: Decodable>(filename: String) throws -> D? {
        guard let url = self.url(forResource: filename, withExtension: ".json") else { return nil }
        let data = try Data(contentsOf: url)
        let decodeModel = try JSONDecoder().decode(D.self, from: data)
        return decodeModel
    }
}

