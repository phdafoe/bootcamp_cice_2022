//
//  SplashPresenter.swift
//  CiceMusic
//
//  Created by Andres Felipe Ocampo Eljaiek on 4/2/22.
//

import Foundation

// Input del Presenter
protocol SplashPresenterInputProtocol {
    func fetchDataFromWebService()
    func showHometabBar()
}

// Output del Interactor
protocol SplashInteractorOutputProtocol {
    func setDataFromWebInteractor(data: [ResultMusic]?)
}

final class SplashPresenter: BasePresenter<SplashPresenterOutputProtocol, SplashInteractorInputProtocol, SplashRouterInputProtocol> {
    
    var dataSourceMusic: [ResultMusic] = []
    
}

// Input del Presenter
extension SplashPresenter: SplashPresenterInputProtocol {
    func fetchDataFromWebService() {
        self.interactor?.fetchDataFromWebServiceInteractor()
    }
    
    func showHometabBar() {
        self.router?.showHometabBarRouter(dataSource: self.dataSourceMusic)
    }
}

// Output del Interactor
extension SplashPresenter: SplashInteractorOutputProtocol{
    func setDataFromWebInteractor(data: [ResultMusic]?) {
        guard let dataUnw = data else { return }
        self.dataSourceMusic.removeAll()
        self.dataSourceMusic = dataUnw
        self.viewController?.launchAnimation()
    }
    
    
}
