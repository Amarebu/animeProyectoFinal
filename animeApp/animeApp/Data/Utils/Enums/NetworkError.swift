//
//  NetworkErrorEnum.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 1/8/23.
//

import Foundation

enum NetworkError: Error, Equatable {
    case malformedURL
    case noData
    case errorCode(Int?)
    case tokenFormat
    case decoding
    case noUser
    case other
}
