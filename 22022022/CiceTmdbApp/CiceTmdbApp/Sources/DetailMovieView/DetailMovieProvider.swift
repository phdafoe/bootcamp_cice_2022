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
import Combine

// Input Protocol
protocol DetailMovieProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataDetailMovieProvider()
    func saveDataAsFavouritesProvider()
}

final class DetailMovieProvider: BaseProvider {
    
    // MARK: - DI
    weak var interactor: DetailMovieProviderOutputProtocol? {
        super.baseInteractor as? DetailMovieProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    var dataDTO: DetailMovieCoordinatorDTO?
    
}

extension DetailMovieProvider: DetailMovieProviderInputProtocol {
    
    func fetchDataDetailMovieProvider(){
        self.networkService.requestGeneric(payloadRequest: DetailMovieRequestDTO.requestDataDetail(idMovie: "\(dataDTO?.dataId ?? 0)",
                                                                                                   moreParams: "credits,videos"),
                                           entityClass: DetailMovieServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion{
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationDetailMovie(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationDetailMovie(completion: .success(resultData))
            }
            .store(in: &cancellable)
    }
    
    func saveDataAsFavouritesProvider() {
        DDBB.shared.addLocal(favorite: DownloadNewModel(pId: "\(self.dataDTO?.dataId ?? 0)")) { result in
            self.interactor?.savedCorrectly()
        } failure: { error in
            debugPrint("Error no se ha salvado correctamente, \(error ?? "")")
        }
    }
}

// MARK: - Request de apoyo
struct DetailMovieRequestDTO {
    
    static func requestDataDetail(idMovie: String, moreParams: String) -> RequestDTO {
        let argument: [CVarArg] = [idMovie, moreParams]
        let urlComplete = String(format: URLEnpoint.endpointDetailMovie, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
        return request
    }
}
