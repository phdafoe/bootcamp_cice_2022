//
//  AppCoreCoordinator.swift
//  MiTaskVersion3.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 28/1/22.
//

import UIKit

protocol AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow)
}

final class AppCoreCoordinator {
    var actualVC = UIViewController()
}

extension AppCoreCoordinator: AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow) {
        
        if Utils.Constantes().kPrefs.bool(forKey: Utils.Constantes().kUsuarioLogado) {
            self.actualVC = HomeTabBarViewCoordinator.homeViewController()
        } else {
            self.actualVC = LoginViewCoordinator.view()
        }
        
        window.rootViewController = self.actualVC
        window.makeKeyAndVisible()
    }
}
