//
//  AppCoreCoordinator.swift
//  CiceMusic
//
//  Created by Andres Felipe Ocampo Eljaiek on 4/2/22.
//

import UIKit

protocol AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow)
    func createSlidingMenu(window: UIWindow, vc: UIViewController, menuDto: [MenuResponse])
}

final class AppCoreCoordinator {
    var actualVC = UIViewController()
}

extension AppCoreCoordinator: AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow) {
        self.actualVC = SplashCoordinator.view()
        window.rootViewController = self.actualVC
        window.makeKeyAndVisible()
    }
    
    func createSlidingMenu(window: UIWindow, vc: UIViewController, menuDto: [MenuResponse]) {
        let frontViewController = vc
        let rearViewController = MenuCoordinator.view(dto: MenuCoordinatorDTO(dataModel: menuDto))
        let swRevealVC = SWRevealViewController(rearViewController: rearViewController, frontViewController: frontViewController)
        swRevealVC?.toggleAnimationType = SWRevealToggleAnimationType.easeOut
        swRevealVC?.toggleAnimationDuration = 0.30
        window.rootViewController = swRevealVC
        window.makeKeyAndVisible()
    }
}
