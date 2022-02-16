//
//  GenericWebCoordinator.swift
//  CiceMusic
//
//  Created by TECDATA ENGINEERING on 16/2/22.
//

import Foundation

final class GenericWebCoordinator{
    
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view() -> GenericWebViewController & GenericWebOutputPresenterProtocol {
        let vc = GenericWebViewController()
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: GenericWebViewController) -> GenericWebPresenterInputProtocol {
        let presenter = GenericWebPresenter()
        presenter.viewController = vc
        return presenter
    }
 
}
