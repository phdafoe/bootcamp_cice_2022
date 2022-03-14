/*
 
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import Foundation

// Input del Interactor
protocol FavouritesInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataFromDBInteractor()
}

// Output Provider
protocol FavouritesProviderOutputProtocol: BaseProviderOutputProtocol{
    func setInformationFavourites(completion: Result<DetailMovieServerModel, NetworkError>)
}

final class FavouritesInteractor: BaseInteractor {
    
    // MARK: - DI
    weak var viewModel: FavouritesInteractorOutputProtocol? {
        super.baseViewModel as? FavouritesInteractorOutputProtocol
    }
    
    // MARK: - DI
    var provider: FavouritesProviderInputProtocol? {
        super.baseProvider as? FavouritesProviderInputProtocol
    }
    
    var dataSource: [DetailMovieTVModelView] = []
    
    func transformDataDetailMovieServerModelToDetailMovieTVModelView(data: DetailMovieServerModel?) {
        
        guard let dataUnw = data else { return }
        guard let videoUnw = dataUnw.videos?.results else { return }
        guard let castUnw = dataUnw.credits?.cast else { return }
        guard let crewUnw = dataUnw.credits?.crew else { return }
        let credits = CreditsViewModel(cast: self.transformDataDetailMovieServerModelToCastViewModel(data: castUnw) ?? [],
                                       crew: self.transformDataDetailMovieServerModelToCrewViewModel(data: crewUnw) ?? [])
        let objc = DetailMovieTVModelView(id: dataUnw.id,
                                          originalTitle: dataUnw.originalTitle,
                                          posterPath: dataUnw.posterPath,
                                          genres: dataUnw.genres,
                                          releaseDate: dataUnw.releaseDate,
                                          runtime: dataUnw.runtime,
                                          voteAverage: dataUnw.voteAverage,
                                          credits: credits,
                                          lastEpisodeToAir: nil,
                                          seasons: nil,
                                          overview: dataUnw.overview,
                                          resultsVideoYoutube: self.transformDataDetailMovieServerModelToVideosYouTubeViewModel(data: videoUnw))
        self.dataSource.append(objc)
        
    }
    
    func transformDataDetailMovieServerModelToCastViewModel(data: [Cast]?) -> [CastViewModel]? {
        var datasourceCastViewModel: [CastViewModel] = []
        guard let castUnw = data else { return [] }
        for item in 0..<castUnw.count {
            let objc = CastViewModel(id: castUnw[item].id,
                                     profilePath: castUnw[item].profilePath,
                                     name: castUnw[item].name)
            datasourceCastViewModel.append(objc)
        }
        return datasourceCastViewModel
    }
    
    func transformDataDetailMovieServerModelToCrewViewModel(data: [Crew]?) -> [CrewViewModel]? {
        var datasourceCrewViewModel: [CrewViewModel] = []
        guard let crewUnw = data else { return [] }
        for item in 0..<crewUnw.count {
            let objc = CrewViewModel(id: crewUnw[item].id,
                                     job: crewUnw[item].job,
                                     name: crewUnw[item].name)
            datasourceCrewViewModel.append(objc)
        }
        return datasourceCrewViewModel
    }
    
    func transformDataDetailMovieServerModelToVideosYouTubeViewModel(data: [ResultVideo]?) -> [VideosYouTubeViewModel]? {
        var datasourceYouTubeViewModel: [VideosYouTubeViewModel] = []
        guard let videosUnw = data else { return [] }
        for item in 0..<videosUnw.count {
            let objc = VideosYouTubeViewModel(id: videosUnw[item].id,
                                              key: videosUnw[item].key,
                                              site: videosUnw[item].site,
                                              name: videosUnw[item].name)
            datasourceYouTubeViewModel.append(objc)
        }
        return datasourceYouTubeViewModel
    }

    
}

// Input del Interactor
extension FavouritesInteractor: FavouritesInteractorInputProtocol {
    func fetchDataFromDBInteractor(){
        self.provider?.fetchDataFromDBProvider()
    }
}

// Output Provider
extension FavouritesInteractor: FavouritesProviderOutputProtocol {
    func setInformationFavourites(completion: Result<DetailMovieServerModel, NetworkError>) {
        switch completion{
        case .success(let data):
            self.transformDataDetailMovieServerModelToDetailMovieTVModelView(data: data)
            self.viewModel?.setInformationFavourites(data: self.dataSource )
        case .failure(let error):
            debugPrint(error)
        }
    }
}
