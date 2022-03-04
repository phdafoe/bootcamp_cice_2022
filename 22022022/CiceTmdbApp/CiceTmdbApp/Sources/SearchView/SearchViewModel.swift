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


// Output del Interactor
protocol SearchInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoSearchMoviesViewModel(data: [MoviesTVModelView]?)
}

final class SearchViewModel: BaseViewModel, ObservableObject  {
    
    // MARK: - DI
    var interactor: SearchInteractorInputProtocol?{
        super.baseInteractor as? SearchInteractorInputProtocol
    }
    
    // MARK: - Variables @Published
    @Published var query = ""
    @Published var dataSourceSearchMovie: [MoviesTVModelView]? = []
    private var subscription: AnyCancellable?
    
    // MARK: - Métodos publicos para View
    func fetchData() {
        guard subscription == nil else { return }
        self.subscription = self.$query.map { [weak self] text in
            self?.dataSourceSearchMovie = nil
            if text.count > 4 {
                return text
            }
            return ""
        }
        .throttle(for: 1, scheduler: DispatchQueue.main, latest: true)
        .sink(receiveValue: { [weak self] in
            self?.searchWith(text: $0 )
        })
    }
    
    func searchWith(text: String) {
        self.dataSourceSearchMovie?.removeAll()
        guard !query.isEmpty else { return }
        self.interactor?.fetchDataSearchMovieInteractor(query: text)
    }
    
}

// Output del Interactor
extension SearchViewModel: SearchInteractorOutputProtocol {
    func setInfoSearchMoviesViewModel(data: [MoviesTVModelView]?){
        self.dataSourceSearchMovie = data ?? []
    }
}


