//
//  AppDelegate.swift
//  MiUserDefault
//
//  Created by Andres Felipe Ocampo Eljaiek on 26/1/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoreCoordinator: AppCoreCoordinatorProtocol = AppCoreCoordinator()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if let windowUnw = self.window {
            self.appCoreCoordinator.initialViewController(window: windowUnw)
        }
        
        return true
    }

}

