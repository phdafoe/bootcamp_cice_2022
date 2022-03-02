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
protocol DetailMovieInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataDetailMovieInteractor()
}

// Output Provider
protocol DetailMovieProviderOutputProtocol: BaseProviderOutputProtocol{
    func setInformationDetailMovie(completion: Result<DetailMovieServerModel?, NetworkError>)
}

final class DetailMovieInteractor: BaseInteractor {
    
    // MARK: - DI
    weak var viewModel: DetailMovieInteractorOutputProtocol? {
        super.baseViewModel as? DetailMovieInteractorOutputProtocol
    }
    
    // MARK: - DI
    var provider: DetailMovieProviderInputProtocol? {
        super.baseProvider as? DetailMovieProviderInputProtocol
    }
    
    func transformDataDetailMovieServerModelToDetailMovieTVModelView(data: DetailMovieServerModel?) -> DetailMovieTVModelView? {
        var myData: DetailMovieTVModelView?
        guard let dataUnw = data else { return nil }
        guard let videoUnw = dataUnw.videos?.results else { return nil }
        guard let castUnw = dataUnw.credits?.cast else { return nil }
        guard let crewUnw = dataUnw.credits?.crew else { return nil }
        let credits = CreditsViewModel(cast: self.transformDataDetailMovieServerModelToCastViewModel(data: castUnw) ?? [],
                                       crew: self.transformDataDetailMovieServerModelToCrewViewModel(data: crewUnw) ?? [])
        let objc = DetailMovieTVModelView(posterPath: dataUnw.posterPath,
                                          genres: dataUnw.genres,
                                          releaseDate: dataUnw.releaseDate,
                                          runtime: dataUnw.runtime,
                                          voteAverage: dataUnw.voteAverage,
                                          credits: credits,
                                          lastEpisodeToAir: nil,
                                          seasons: nil,
                                          overview: dataUnw.overview,
                                          resultsVideoYoutube: self.transformDataDetailMovieServerModelToVideosYouTubeViewModel(data: videoUnw))
        myData = objc
        
        return myData
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
extension DetailMovieInteractor: DetailMovieInteractorInputProtocol {
    func fetchDataDetailMovieInteractor() {
        self.provider?.fetchDataDetailMovieProvider()
    }
}

// Output Provider
extension DetailMovieInteractor: DetailMovieProviderOutputProtocol {
    func setInformationDetailMovie(completion: Result<DetailMovieServerModel?, NetworkError>){
        switch completion{
        case .success(let data):
            self.viewModel?.setInformationDetail(data: self.transformDataDetailMovieServerModelToDetailMovieTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
}
