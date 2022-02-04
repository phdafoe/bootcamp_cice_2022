//
//  SplashViewController.swift
//  CiceMusic
//
//  Created by Andres Felipe Ocampo Eljaiek on 4/2/22.
//

import UIKit

// Output del Presenter
protocol SplashPresenterOutputProtocol {
    
}

class SplashViewController: BaseView<SplashPresenterInputProtocol> {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fetchDataFromWebService()
        // Do any additional setup after loading the view.
    }



}

// Output del Presenter
extension SplashViewController: SplashPresenterOutputProtocol{
    
}
