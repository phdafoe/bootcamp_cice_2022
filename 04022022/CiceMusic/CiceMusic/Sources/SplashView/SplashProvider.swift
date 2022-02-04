//
//  SplashProvider.swift
//  CiceMusic
//
//  Created by Andres Felipe Ocampo Eljaiek on 4/2/22.
//

import Foundation

protocol SplashProviderInputProtocol {
    func fetchData()
}

final class SplashProvider: SplashProviderInputProtocol {
    
    let networkservice: NetworkServiceProtocol = NetworkService()
    
    func fetchData() {
        self.networkservice.requestGeneric(requestPayload: SplashRequestDTO.requestData(numeroItems: "10"),
                                           entityClass: <#T##Decodable.Protocol#>,
                                           success: <#T##(Decodable?) -> Void#>,
                                           failure: <#T##(NetworkError) -> Void#>)
    }
}


struct SplashRequestDTO {
    
    static func requestData(numeroItems: String) -> RequestDTO {
        let argument: [CVarArg] = [numeroItems]
        let urlComplete = String(format: URLEnpoint.music, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete)
        return request
    }
}
