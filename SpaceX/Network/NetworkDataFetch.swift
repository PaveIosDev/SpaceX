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
    
    func fetchRocket(responce: @escaping (RocketModel?, Error?) -> Void) {
        NetworkRequest.shared.requestData { result in
            
            switch result {
            case .success(let data):
                do {
                    let rocket = try JSONDecoder().decode([RocketModel].self, from: data)
                    responce(rocket[0], nil)
                    responce(rocket[1], nil)
                    responce(rocket[2], nil)
                    responce(rocket[3], nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print(error.localizedDescription)
                responce(nil, error)
            }
        }
    }
}
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

