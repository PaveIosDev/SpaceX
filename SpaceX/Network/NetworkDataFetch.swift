//
//  NetworkDataFetch.swift
//  SpaceX
//
//  Created by Павел Яковенко on 22.01.2023.
//

import Foundation

class NetworkDataFetch {
    static let shared = NetworkDataFetch()
    private init() {}
    
    func fetchRocket(responce: @escaping (RocketModel?, Error) -> Void) {
        NetworkRequest.shared.requestData { result in
            
            switch result {
            case .success(_):
                <#code#>
            case .failure(_):
                <#code#>
            }
        }
    }
}
