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
import SwiftUI


final class DetailMovieCoordinator: BaseCoordinator {

    typealias ContentView = DetailMovieView
    typealias ViewModel = DetailMovieViewModel
    typealias Interactor = DetailMovieInteractor
    typealias Provider = DetailMovieProvider
    
    static func navigation() -> NavigationView<ContentView> {
        NavigationView{
            self.view()
        }
    }
    
    static func view(dto: DetailMovieCoordinatorDTO? = nil) -> ContentView {
        let vip = BaseCoordinator.coordinator(viewModel: ViewModel.self,
                                              interactor: Interactor.self,
                                              provider: Provider.self)
        vip.provider.dataDTO = dto
        //let view = ContentView(viewModel: vip.viewModel)
        
//        guard let dataUnw = DetailMovieServerModel.stubbedDetailMovie else {
//            return nil
//        }
        let view = ContentView(viewModel: DetailMovieServerModel.stubbedDetailMovie!)
        return view
    }
    
}

struct DetailMovieCoordinatorDTO {
    var dataId: Int
}
