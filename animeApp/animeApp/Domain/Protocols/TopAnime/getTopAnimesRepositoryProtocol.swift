//
//  getTopAnimesRepositoryProtocol.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 2/8/23.
//

import Foundation

protocol getTopAnimesRepositoryProtocol {
    func getTopAnimes() async throws -> TopAnimeDO
}
