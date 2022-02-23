//
//  MoviesCoordinator.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 23/2/22.
//

import Foundation
import SwiftUI

final class MoviesCoordinator: BaseCoordinator {
    
    typealias ContentView = MoviesView
    typealias ViewModel = MoviesViewModel
    typealias Interactor = MoviesInteractor
    typealias Provider = MoviesProvider
    
    static func navigation() -> NavigationView<ContentView> {
        NavigationView{
            self.view()
        }
    }
    
    static func view() -> ContentView {
        let vip = BaseCoordinator.coordinator(viewModel: ViewModel.self,
                                              interactor: Interactor.self,
                                              provider: Provider.self)
        let view = ContentView(viewModel: vip.viewModel)
        return view
    }
}
