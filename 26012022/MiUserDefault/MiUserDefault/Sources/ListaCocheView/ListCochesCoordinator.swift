//
//  ListCochesCoordinator.swift
//  MiUserDefault
//
//  Created by Andres Felipe Ocampo Eljaiek on 27/1/22.
//

import UIKit

final class ListCochesCoordinator {

    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view() -> UIViewController {
        let vc = ListCochesViewController()
        return vc
    }
}
