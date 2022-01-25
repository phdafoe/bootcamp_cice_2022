//
//  ListaPerfilPostCoordinator.swift
//  MiAppIntroduccionTableView
//
//  Created by Andres Felipe Ocampo Eljaiek on 25/1/22.
//

import UIKit

final class ListaPerfilPostCoordinator {
    
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: self.view())
        return navVC
    }
    
    static func view() -> UIViewController {
        let vc = ListaPerfilPostViewController()
        return vc
    }
}

