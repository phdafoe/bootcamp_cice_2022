//
//  SplashCoordinator.swift
//  CiceMusic
//
//  Created by Andres Felipe Ocampo Eljaiek on 4/2/22.
//

import Foundation

final class SplashCoordinator{
    
    static func navigation(dto: SplashCoordinatorDTO? = nil) -> BaseNavigation {
        BaseNavigation(rootViewController: view())
    }
    
    static func view(dto: SplashCoordinatorDTO? = nil) -> SplashViewController & SplashPresenterOutputProtocol {
        let vc = SplashViewController()
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: SplashViewController) -> SplashPresenterInputProtocol & SplashInteractorOutputProtocol {
        let presenter = SplashPresenter(vc: vc)
        presenter.interactor = interactor(presenter: presenter)
        presenter.router = router(vc: vc)
        return presenter
    }
    
    static func interactor(presenter: SplashPresenter) -> SplashInteractorInputProtocol {
        let interactor = SplashInteractor(presenter: presenter)
        return interactor
    }
    
    static func router(vc: SplashViewController) -> SplashRouterInputProtocol {
        let router = SplashRouter(view: vc)
        return router
    }
    
}

struct SplashCoordinatorDTO {
    
}
