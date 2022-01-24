//
//  ListSuperCochesCoordinator.swift
//  MiAppIntroduccionTableView
//
//  Created by Andres Felipe Ocampo Eljaiek on 24/1/22.
//

import UIKit

final class ListSuperCochesCoordinator {
    
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view() -> UIViewController {
        let vc = ListSuperCochesViewController()
        return vc
    }
}
