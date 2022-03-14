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
protocol FavouritesProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataFromDBProvider()
}

final class FavouritesProvider: BaseProvider {
    
    // MARK: - DI
    weak var interactor: FavouritesProviderOutputProtocol? {
        super.baseInteractor as? FavouritesProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    
    func getMovieFromDB(completionHandler: @escaping (DownloadNewModels?) -> ()){
        DDBB.shared.getAllLocal { results in
            completionHandler(results)
        } failure: { error in
            debugPrint(error ?? "")
        }
    }
    
}

extension FavouritesProvider: FavouritesProviderInputProtocol {
    
    
    func fetchDataFromDBProvider(){
        self.getMovieFromDB { results in
            results?.downloads.map{ item in
                item.map{ itemX in
                    self.networkService.requestGeneric(payloadRequest: FavouritesRequestDTO.requestData(movieId: itemX.id,
                                                                                                        supportParameters: "videos,credits"),
                                                       entityClass: DetailMovieServerModel.self)
                        .sink { [weak self] completion in
                            guard self != nil else { return }
                            switch completion{
                            case .finished:
                                debugPrint("finished")
                            case let .failure(error):
                                debugPrint(error)
                                self?.interactor?.setInformationFavourites(completion: .failure(error))
                            }
                        } receiveValue: { [weak self] resultData in
                            guard self != nil else { return }
                            debugPrint(resultData)
                            self?.interactor?.setInformationFavourites(completion: .success(resultData))
                        }
                        .store(in: &self.cancellable)
                }
            }
        }
    }
}

// MARK: - Request de apoyo
struct FavouritesRequestDTO {
    
    static func requestData(movieId: String, supportParameters: String) -> RequestDTO {
        let argument: [CVarArg] = [movieId, supportParameters]
        let urlComplete = String(format: URLEnpoint.endpointDetailMovie, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
        return request
    }
}
