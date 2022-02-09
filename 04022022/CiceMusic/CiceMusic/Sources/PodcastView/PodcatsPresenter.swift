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

// Input del Presenter
protocol PodcatsPresenterInputProtocol {
    func fetchPodcastFromWebService()
    func numberOfRows() -> Int?
    func informationForCell(indexPath: Int) -> GenericResult?
}

// Output del Interactor
protocol PodcatsInteractorOutputProtocol {
    func setDataFromWebInteractor(data: [GenericResult]?)
}

final class PodcatsPresenter: BasePresenter<PodcatsPresenterOutputProtocol, PodcatsInteractorInputProtocol, PodcatsRouterInputProtocol> {
    
   
    var dataSourceViewModel: [GenericResult] = []
    
}

// Input del Presenter
extension PodcatsPresenter: PodcatsPresenterInputProtocol {
    
    func fetchPodcastFromWebService() {
        self.interactor?.fetchPodcastFromWebServiceInteractor()
    }
    
    func numberOfRows() -> Int? {
        return self.dataSourceViewModel.count
    }
    
    func informationForCell(indexPath: Int) -> GenericResult? {
        return self.dataSourceViewModel[indexPath]
    }
}

// Output del Interactor
extension PodcatsPresenter: PodcatsInteractorOutputProtocol {
    
    func setDataFromWebInteractor(data: [GenericResult]?) {
        guard let dataUnw = data else { return }
        self.dataSourceViewModel.removeAll()
        self.dataSourceViewModel = dataUnw
        self.viewController?.reloadInformationInView()
    }
}


