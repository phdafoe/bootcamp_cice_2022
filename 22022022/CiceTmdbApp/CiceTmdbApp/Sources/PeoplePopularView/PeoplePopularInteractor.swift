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
protocol PeoplePopularInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDatPeoplePopularInteractor()
}

// Output Provider
protocol PeoplePopularProviderOutputProtocol: BaseProviderOutputProtocol{
    func setInformationPeoplePopular(completion: Result<PeoplePopularServerModel?, NetworkError>)
}

final class PeoplePopularInteractor: BaseInteractor {
    
    // MARK: - DI
    weak var viewModel: PeoplePopularInteractorOutputProtocol? {
        super.baseViewModel as? PeoplePopularInteractorOutputProtocol
    }
    
    // MARK: - DI
    var provider: PeoplePopularProviderInputProtocol? {
        super.baseProvider as? PeoplePopularProviderInputProtocol
    }
    
    func transformDataFromPeoplePopularServerModelToPeopleViewModel(data: PeoplePopularServerModel?) -> [PeopleViewModel]? {
        var datasourcePeopleViewModel: [PeopleViewModel] = []
        guard let dataUnw = data?.results else { return [] }
        for item in 0..<dataUnw.count {
            let objc = PeopleViewModel(id: dataUnw[item].id,
                                       knownFor: self.transformDataFromKnownForToKnownForViewModel(data: dataUnw[item].knownFor),
                                       name: dataUnw[item].name,
                                       profilePath: dataUnw[item].profilePath)
            datasourcePeopleViewModel.append(objc)
        }
        return datasourcePeopleViewModel
    }
    
    func transformDataFromKnownForToKnownForViewModel(data: [KnownFor]?) -> [KnownForViewModel]? {
        var datasourceKnowForViewModel: [KnownForViewModel] = []
        guard let dataUnw = data else { return [] }
        for item in 0..<dataUnw.count {
            let objc = KnownForViewModel(id: dataUnw[item].id,
                                         overview: dataUnw[item].overview,
                                         posterPath: dataUnw[item].posterPath,
                                         voteAverage: dataUnw[item].voteAverage,
                                         originalTitle: dataUnw[item].originalTitle,
                                         releaseDate: dataUnw[item].releaseDate)
            datasourceKnowForViewModel.append(objc)
        }
        return datasourceKnowForViewModel
    }

    
}

// Input del Interactor
extension PeoplePopularInteractor: PeoplePopularInteractorInputProtocol {
    func fetchDatPeoplePopularInteractor() {
        self.provider?.fetchDatPeoplePopularProvider()
    }
}

// Output Provider
extension PeoplePopularInteractor: PeoplePopularProviderOutputProtocol {
    func setInformationPeoplePopular(completion: Result<PeoplePopularServerModel?, NetworkError>) {
        switch completion{
        case .success(let data):
            self.viewModel?.setInformationPeoplePopular(data: self.transformDataFromPeoplePopularServerModelToPeopleViewModel(data: data))
        case let .failure(error):
            debugPrint(error)
        }
    }
}
