//
//  RegistroCoordinator.swift
//  MiUserDefault
//
//  Created by Andres Felipe Ocampo Eljaiek on 26/1/22.
//

import UIKit

final class RegistroCoordinator {
    
    // Wildcard - Comodin
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController (rootViewController: view())
        return navVC
    }
    
    static func view() -> UIViewController {
        let vc = RegistroViewController()
        return vc
    }
    
}
