//
//  AppCoreCoordinator.swift
//  MiUserDefault
//
//  Created by Andres Felipe Ocampo Eljaiek on 26/1/22.
//

import UIKit

protocol AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow)
}

final class AppCoreCoordinator {
    var actualVC: UIViewController?
}

extension AppCoreCoordinator: AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow) {
        self.actualVC = RegistroCoordinator.view()
        window.rootViewController = self.actualVC
        window.makeKeyAndVisible()
    }
}
