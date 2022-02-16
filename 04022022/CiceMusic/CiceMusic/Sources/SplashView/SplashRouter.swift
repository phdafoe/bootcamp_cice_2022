//
//  SplashRouter.swift
//  CiceMusic
//
//  Created by Andres Felipe Ocampo Eljaiek on 4/2/22.
//

import Foundation

// Input del Router
protocol SplashRouterInputProtocol {
    func showHometabBarRouter(dataSource: [MenuResponse])
    func showAlert(title: String, message: String)
    func showLoginViewRouter(dataSource: [MenuResponse])
}

final class SplashRouter: BaseRouter<SplashViewController>{
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    let appCore: AppCoreCoordinatorProtocol = AppCoreCoordinator()
    
}

// Input del Router
extension SplashRouter: SplashRouterInputProtocol {
    func showHometabBarRouter(dataSource: [MenuResponse]) {
        DispatchQueue.main.async {
            let vc = HomeTabBarCoordinator.tabBarController()
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            if let windowUnw = self.delegate.window {
                self.appCore.createSlidingMenu(window: windowUnw, vc: vc, menuDto: dataSource)
            }
        }
    }
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            self.viewController?.present(Utils.showAlert(title: title, message: message), animated: true, completion: nil)
        }
    }
    
    func showLoginViewRouter(dataSource: [MenuResponse]) {
        DispatchQueue.main.async {
            let vc = LoginCoordinator.view(dto: LoginCoordinatorDTO(dataModel: dataSource))
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            self.viewController?.present(vc, animated: true, completion: nil)
        }
    }
    
}
