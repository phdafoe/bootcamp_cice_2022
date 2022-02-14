//
//  SplashProvider.swift
//  CiceMusic
//
//  Created by Andres Felipe Ocampo Eljaiek on 4/2/22.
//

import Foundation

protocol SplashProviderInputProtocol {
    func fetchData(completioHadler: @escaping (Result<MenuServerModel, NetworkError>) -> Void)
}

final class SplashProvider: SplashProviderInputProtocol {
    
    let networkservice: NetworkServiceProtocol = NetworkService()
    
    func fetchData(completioHadler: @escaping (Result<MenuServerModel, NetworkError>) -> Void) {
        self.networkservice.requestGeneric(requestPayload: SplashRequestDTO.requestData(),
                                           entityClass: MenuServerModel.self) { [weak self] (result) in
            guard self != nil else { return }
            guard let resultUnw = result else { return }
            completioHadler(.success(resultUnw))
        } failure: { [weak self] (error) in
            guard self != nil else { return }
            completioHadler(.failure(error))
        }
    }
    
}


struct SplashRequestDTO {
    
    static func requestData() -> RequestDTO {
        let request = RequestDTO(params: nil, method: .get, endpoint: URLEnpoint.menu, urlContext: .heroku)
        return request
    }
}
