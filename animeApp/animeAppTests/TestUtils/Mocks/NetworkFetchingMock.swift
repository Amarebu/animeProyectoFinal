//
//  NetworkFetchingMock.swift
//  animeAppTests
//
//  Created by Reguera Bueno Ana María on 8/8/23.
//

import Foundation
import Combine
@testable import animeApp

class NetworkFetchingMock: NetworkFetchingProtocol {
    
    let result: Result<Data, Error>

    init(returning result: Result<Data, Error>) {
        self.result = result
    }
    
    func data(url: URLRequest) async throws -> (Data, URLResponse) {
        // Not needed as it is done with the URLProtocol
        return ("".data(using: .utf8)!,URLResponse()) // Not needed
    }
}
