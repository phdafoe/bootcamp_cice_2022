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
            self.viewModel?.setInformationDetail(data: data)
        case .failure(let error):
            debugPrint(error)
        }
    }
}
