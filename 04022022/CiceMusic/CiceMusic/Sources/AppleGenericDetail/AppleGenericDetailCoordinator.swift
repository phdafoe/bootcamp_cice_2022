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


final class AppleGenericDetailCoordinator {

    static func navigation(dto: AppleGenericDetailCoordinatorDTO? = nil) -> BaseNavigation {
        BaseNavigation(rootViewController: view(dto: dto))
    }
    
    static func view(dto: AppleGenericDetailCoordinatorDTO? = nil) -> AppleGenericDetailViewController & AppleGenericDetailPresenterOutputProtocol {
        let vc = AppleGenericDetailViewController()
        vc.presenter = presenter(vc: vc, dto: dto)
        return vc
    }
    
    static func presenter(vc: AppleGenericDetailViewController, dto: AppleGenericDetailCoordinatorDTO? = nil) -> AppleGenericDetailPresenterInputProtocol & AppleGenericDetailInteractorOutputProtocol {
        let presenter = AppleGenericDetailPresenter(vc: vc)
        presenter.interactor = interactor(presenter: presenter)
        presenter.router = router(vc: vc)
        presenter.dataModel = dto?.dataModel
        return presenter
    }
    
    static func interactor(presenter: AppleGenericDetailPresenter) -> AppleGenericDetailInteractorInputProtocol {
        let interactor = AppleGenericDetailInteractor(presenter: presenter)
        return interactor
    }
    
    static func router(vc: AppleGenericDetailViewController) -> AppleGenericDetailRouterInputProtocol {
        let router = AppleGenericDetailRouter(view: vc)
        return router
    }
    
}

struct AppleGenericDetailCoordinatorDTO {
    var dataModel: GenericResult?
}
