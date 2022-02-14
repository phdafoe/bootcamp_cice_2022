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


final class MenuCoordinator {

    static func navigation(dto: MenuCoordinatorDTO? = nil) -> BaseNavigation {
        BaseNavigation(rootViewController: view())
    }
    
    static func view(dto: MenuCoordinatorDTO? = nil) -> MenuViewController & MenuPresenterOutputProtocol {
        let vc = MenuViewController()
        vc.presenter = presenter(vc: vc, dto: dto)
        return vc
    }
    
    static func presenter(vc: MenuViewController, dto: MenuCoordinatorDTO? = nil) -> MenuPresenterInputProtocol & MenuInteractorOutputProtocol {
        let presenter = MenuPresenter(vc: vc)
        presenter.interactor = interactor(presenter: presenter, dto: dto)
        presenter.router = router(vc: vc)
        return presenter
    }
    
    static func interactor(presenter: MenuPresenter, dto: MenuCoordinatorDTO? = nil) -> MenuInteractorInputProtocol {
        let interactor = MenuInteractor(presenter: presenter)
        interactor.dataModel = dto
        return interactor
    }
    
    static func router(vc: MenuViewController) -> MenuRouterInputProtocol {
        let router = MenuRouter(view: vc)
        return router
    }
    
}

struct MenuCoordinatorDTO {
    var dataModel: [MenuResponse]
}
