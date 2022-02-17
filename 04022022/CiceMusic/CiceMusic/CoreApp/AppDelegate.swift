//
//  AppDelegate.swift
//  CiceMusic
//
//  Created by Andres Felipe Ocampo Eljaiek on 4/2/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    // MARK: - Variables globales
    var window: UIWindow?
    let appCore: AppCoreCoordinatorProtocol = AppCoreCoordinator()
    
    var canRotate = false
    //var orientationEnable: UIInterfaceOrientationMask = .portrait

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let windowUnw = self.window {
            self.appCore.initialViewController(window: windowUnw)
        }
        return true
    }
    
    // MARK: - Autorotations
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if canRotate {
            return .all
        } else {
            return .portrait
        }
    }
}

