//
//  NetworkFetchingProtocol.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 8/8/23.
//

import Foundation
import Combine


protocol NetworkFetchingProtocol {
    func data(url: URLRequest) async throws  -> (Data, URLResponse)
}
