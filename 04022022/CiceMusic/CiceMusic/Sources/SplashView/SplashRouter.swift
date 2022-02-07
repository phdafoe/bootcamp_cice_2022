//
//  SplashRouter.swift
//  CiceMusic
//
//  Created by Andres Felipe Ocampo Eljaiek on 4/2/22.
//

import Foundation

// Input del Router
protocol SplashRouterInputProtocol {
    func showHometabBarRouter(dataSource: [ResultMusic])
}

final class SplashRouter: BaseRouter<SplashViewController>{
    
}

// Input del Router
extension SplashRouter: SplashRouterInputProtocol {
    func showHometabBarRouter(dataSource: [ResultMusic]) {
        debugPrint(dataSource)
    }
}
