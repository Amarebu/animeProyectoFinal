//
//  URLSessionExtension.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 8/8/23.
//

import Foundation
import Combine

extension URLSession: NetworkFetchingProtocol {
    func data(url: URLRequest) async throws -> (Data, URLResponse) {
        return try await data(for: url)
    }
    
    func load(fromRequest request: URLRequest) -> AnyPublisher<Data, Error> {
        
        return dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .eraseToAnyPublisher()
    }
}
