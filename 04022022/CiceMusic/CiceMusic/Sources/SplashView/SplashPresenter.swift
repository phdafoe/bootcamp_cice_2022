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
    func setDataFromWebInteractor(data: [GenericResult]?)
    func setAlertMessage(error: NetworkError)
}

final class SplashPresenter: BasePresenter<SplashPresenterOutputProtocol, SplashInteractorInputProtocol, SplashRouterInputProtocol> {
    
    var dataSourceViewModel: [GenericResult] = []
    
}

// Input del Presenter
extension SplashPresenter: SplashPresenterInputProtocol {
    func fetchDataFromWebService() {
        self.interactor?.fetchDataFromWebServiceInteractor()
    }
    
    func showHometabBar() {
        self.router?.showHometabBarRouter(dataSource: self.dataSourceViewModel)
    }
}

// Output del Interactor
extension SplashPresenter: SplashInteractorOutputProtocol{
    
    func setDataFromWebInteractor(data: [GenericResult]?) {
        guard let dataUnw = data else { return }
        self.dataSourceViewModel.removeAll()
        self.dataSourceViewModel = dataUnw
        self.viewController?.launchAnimation()
    }
    
    func setAlertMessage(error: NetworkError) {
        self.router?.showAlert(title: "\(error.status)",
                               message: error.status.rawValue == -1011
                                ? error.localizedDescription
                                : "AQUI ANDRES")
    }
    
}
