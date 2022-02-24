//
//  MoviesViewModel.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 22/2/22.
//

import Foundation

// Output del Interactor
protocol MoviesInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoNowPlayingViewModel(data: [MoviesTVModelView]?)
    func setInfoPopularViewModel(data: [MoviesTVModelView]?)
    func setInfoTopRateViewModel(data: [MoviesTVModelView]?)
    func setInfoUpcomingViewModel(data: [MoviesTVModelView]?)
}

final class MoviesViewModel: BaseViewModel, ObservableObject {
    
    // MARK: - DI
    var interactor: MoviesInteractorInputProtocol?{
        super.baseInteractor as? MoviesInteractorInputProtocol
    }
    
    // MARK: - Variables
    @Published var dataSourceNowPlaying: [MoviesTVModelView] = []
    @Published var dataSourcePopular: [MoviesTVModelView] = []
    @Published var dataSourceTopRate: [MoviesTVModelView] = []
    @Published var dataSourceUpcoming: [MoviesTVModelView] = []
    
    // MARK: - Métodos publicos para View
    func fetchData() {
        self.interactor?.fetchDataNowPlayingInteractor()
        self.interactor?.fetchDataPopularInteractor()
        self.interactor?.fetchDataTopRateInteractor()
        self.interactor?.fetchDataUpcomingInteractor()
    }
    
}

// Output del Interactor
extension MoviesViewModel: MoviesInteractorOutputProtocol {
    func setInfoNowPlayingViewModel(data: [MoviesTVModelView]?) {
        self.dataSourceNowPlaying.removeAll()
        self.dataSourceNowPlaying = data ?? []
    }
    
    func setInfoPopularViewModel(data: [MoviesTVModelView]?) {
        self.dataSourcePopular.removeAll()
        self.dataSourcePopular = data ?? []
    }
    
    func setInfoTopRateViewModel(data: [MoviesTVModelView]?) {
        self.dataSourceTopRate.removeAll()
        self.dataSourceTopRate = data ?? []
    }
    
    func setInfoUpcomingViewModel(data: [MoviesTVModelView]?) {
        self.dataSourceUpcoming.removeAll()
        self.dataSourceUpcoming = data ?? []
    } 
}
