//
//  CategoriaViewCoordinator.swift
//  MiTaskVersion3.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 28/1/22.
//

import UIKit

final class CategoriaViewCoordinator {
    
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view(delegate: CategoriaViewControllerDelegate? = nil) -> UIViewController {
        let vc = CategoriaViewController()
        vc.delegate = delegate
        return vc
    }
}
