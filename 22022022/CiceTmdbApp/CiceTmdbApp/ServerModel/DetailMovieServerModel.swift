//
//  DetailMovieServerModel.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 25/2/22.
//

import Foundation


// MARK: - DetailMovieServerModel
struct DetailMovieServerModel: Codable {
    let adult: Bool?
    let backdropPath: String?
    let belongsToCollection: BelongsToCollection?
    let budget: Int?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let imdbID: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ProductionCompany]?
    let productionCountries: [ProductionCountry]?
    let releaseDate: String?
    let revenue: Int?
    let runtime: Int?
    let spokenLanguages: [SpokenLanguage]?
    let status: String?
    let tagline: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let videos: Videos?
    let credits: Credits?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget = "budget"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue = "revenue"
        case runtime = "runtime"
        case spokenLanguages = "spoken_languages"
        case status = "status"
        case tagline = "tagline"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case videos = "videos"
        case credits = "credits"
    }
    
    var posterUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
    
    var genreText: String {
        genres?.first?.name ?? "n/a"
    }
    
    var yearText: String {
        guard let releaseDateUnw = releaseDate, let dateUnw = Utils.dateFormatter.date(from: releaseDateUnw) else {
            return "n/a"
        }
        return Utils.yearFormatter.string(from: dateUnw)
    }
    
    var durationText: String {
        guard let runtimeUnw = runtime, runtimeUnw > 0 else {
            return "n/a"
        }
        return Utils.durationFormatter.string(from: TimeInterval(runtimeUnw) * 60) ?? "n/a"
    }
    
    var ratingText: String {
        let rating = Int(voteAverage ?? 0)
        let ratingText = (0..<rating).reduce("") { (partialResult, _) -> String in
            return partialResult + "★"
        }
        return ratingText
    }
    
    var scoreText: String{
        guard ratingText.count > 0 else {
            return "N/A"
        }
        return "\(ratingText.count) / 10"
    }
    
    var cast: [Cast]? {
        credits?.cast
    }
    
    var crew: [Crew]? {
        credits?.crew
    }
    
    var directors: [Crew]? {
        crew?.filter { $0.job?.lowercased() == "director" }
    }
    
    var producers: [Crew]? {
        crew?.filter { $0.job?.lowercased() == "producer"}
    }
    
    var screenWriters: [Crew]? {
        crew?.filter { $0.job?.lowercased() == "writer"}
    }
    
    var youtubeTrailers: [ResultVideo]? {
        videos?.results?.filter { $0.youtubeURL != nil }
    }
    
}

// MARK: - BelongsToCollection
struct BelongsToCollection: Codable {
    let id: Int?
    let name: String?
    let posterPath: String?
    let backdropPath: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}

// MARK: - Credits
struct Credits: Codable {
    let cast: [Cast]?
    let crew: [Crew]?

    enum CodingKeys: String, CodingKey {
        case cast = "cast"
        case crew = "crew"
    }
}

// MARK: - Cast
struct Cast: Codable, Identifiable {
    let adult: Bool?
    let gender: Int?
    let id: Int?
    let knownForDepartment: String?
    let name: String?
    let originalName: String?
    let popularity: Double?
    let profilePath: String?
    let castID: Int?
    let character: String?
    let creditID: String?
    let order: Int?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case knownForDepartment = "known_for_department"
        case name = "name"
        case originalName = "original_name"
        case popularity = "popularity"
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character = "character"
        case creditID = "credit_id"
        case order = "order"
    }
    
    var profilePathUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(profilePath ?? "")")!
    }
}

// MARK: - Crew
struct Crew: Codable, Identifiable {
    let adult: Bool?
    let gender: Int?
    let id: Int?
    let knownForDepartment: String?
    let name: String?
    let originalName: String?
    let popularity: Double?
    let profilePath: String?
    let creditID: String?
    let department: String?
    let job: String?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case knownForDepartment = "known_for_department"
        case name = "name"
        case originalName = "original_name"
        case popularity = "popularity"
        case profilePath = "profile_path"
        case creditID = "credit_id"
        case department = "department"
        case job = "job"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    let id: Int?
    let logoPath: String?
    let name: String?
    let originCountry: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case logoPath = "logo_path"
        case name = "name"
        case originCountry = "origin_country"
    }
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
    let iso3166_1: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name = "name"
    }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let englishName: String?
    let iso639_1: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name = "name"
    }
}

// MARK: - Videos
struct Videos: Codable {
    let results: [ResultVideo]?

    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}

// MARK: - Result
struct ResultVideo: Codable, Identifiable {
    let iso639_1: String?
    let iso3166_1: String?
    let name: String?
    let key: String?
    let site: String?
    let size: Int?
    let type: String?
    let official: Bool?
    let publishedAt: String?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case name = "name"
        case key = "key"
        case site = "site"
        case size = "size"
        case type = "type"
        case official = "official"
        case publishedAt = "published_at"
        case id = "id"
    }
    
    var youtubeURL: URL? {
        guard site == "YouTube" else {
            return nil
        }
        return URL(string: "https://www.youtube.com/watch?v=\(key ?? "")")
    }
}


extension DetailMovieServerModel {
    
    static var stubbedDetailMovie: DetailMovieServerModel? {
        let response: DetailMovieServerModel? = try? Bundle.main.loadAndDecodeJSON(filename: "DetailMovie")
        if let responseUnw = response {
            return responseUnw
        }
        return nil
    }
    
}
