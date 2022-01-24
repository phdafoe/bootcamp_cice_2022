//
//  ListaCochesCoordinator.swift
//  MiAppIntroduccionTableView
//
//  Created by Andres Felipe Ocampo Eljaiek on 24/1/22.
//

import UIKit

final class ListaCochesCoordinator {
    
    // Comodin
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: self.view())
        return navVC
    }
    
    // Vista
    static func view() -> UIViewController {
        let vc = ListaCochesViewController()
        return vc
    }
    
}
