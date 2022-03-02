//
//  DetailMovieTVModelView.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 1/3/22.
//

import Foundation

struct DetailMovieTVModelView {
    
    let posterPath: String?
    let genres: [Genre]?
    let releaseDate: String?
    let runtime: Int?
    let voteAverage: Double?
    let credits: CreditsViewModel?
    let lastEpisodeToAir: LastEpisodeToAir?
    let seasons: [Season]?
    let overview: String?
    let resultsVideoYoutube: [VideosYouTubeViewModel]?
    
    
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
            return partialResult + "*"
        }
        return ratingText
    }
    
    var scoreText: String{
        guard ratingText.count > 0 else {
            return "N/A"
        }
        return "\(ratingText.count) / 10"
    }
    
    var cast: [CastViewModel]? {
        credits?.cast
    }
    
    var crew: [CrewViewModel]? {
        credits?.crew
    }
    
    var directors: [CrewViewModel]? {
        crew?.filter { $0.job?.lowercased() == "director" }
       
    }
    
    var producers: [CrewViewModel]? {
        crew?.filter { $0.job?.lowercased() == "producer"}
    }
    
    var screenWriters: [CrewViewModel]? {
        crew?.filter { $0.job?.lowercased() == "writer"}
    }
    
    var youtubeTrailers: [VideosYouTubeViewModel]? {
        resultsVideoYoutube?.filter { $0.youtubeURL != nil }
    }
   
    
}

// MARK: - Credits
struct CreditsViewModel {
    let cast: [CastViewModel]
    let crew: [CrewViewModel]
}

// MARK: - Crew
struct CrewViewModel: Identifiable {
    var id: Int?
    let job: String?
    let name: String?
}

struct CastViewModel: Identifiable {
    var id: Int?
    let profilePath: String?
    let name: String?
    var profilePathUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(profilePath ?? "")")!
    }
}

struct VideosYouTubeViewModel: Identifiable {
    var id: String?
    let key: String?
    let site: String?
    let name: String?
    
    var youtubeURL: URL? {
        guard site == "YouTube" else {
            return nil
        }
        return URL(string: "https://www.youtube.com/watch?v=\(key ?? "")")
    }
}
