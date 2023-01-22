//
//  NetworkRequest.swift
//  SpaceX
//
//  Created by Павел Яковенко on 18.01.2023.
//

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    private init() {}
    
    
    func requestData(completion: @escaping (Result<Data, Error>) -> Void) {
        let urlString = "https://api.spacexdata.com/v4/rockets"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }
    }
}
