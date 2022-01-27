//
//  LIstaPostsCoordinator.swift
//  MiUserDefault
//
//  Created by Andres Felipe Ocampo Eljaiek on 27/1/22.
//

import UIKit

final class LIstaPostsCoordinator {

    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view() -> UIViewController {
        let vc = LIstaPostsViewController()
        return vc
    }
}
