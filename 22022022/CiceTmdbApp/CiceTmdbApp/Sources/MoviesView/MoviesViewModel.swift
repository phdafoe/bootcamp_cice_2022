//
//  MoviesViewModel.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 22/2/22.
//

import Foundation

// Output del Interactor
protocol MoviesInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoNowPlayingViewModel(data: [ResultNowPlaying]?)
}

final class MoviesViewModel: BaseViewModel, ObservableObject {
    
    // MARK: - DI
    var interactor: MoviesInteractorInputProtocol?{
        super.baseInteractor as? MoviesInteractorInputProtocol
    }
    
    // MARK: - Variables
    @Published var dataSourceNowPlaying: [ResultNowPlaying] = []
    
    // MARK: - Métodos publicos para View
    func fetchData() {
        self.interactor?.fetchDataNowPlayingInteractor()
    }
    
    
}

// Output del Interactor
extension MoviesViewModel: MoviesInteractorOutputProtocol {
    func setInfoNowPlayingViewModel(data: [ResultNowPlaying]?) {
        self.dataSourceNowPlaying.removeAll()
        self.dataSourceNowPlaying = data ?? []
    }
}
