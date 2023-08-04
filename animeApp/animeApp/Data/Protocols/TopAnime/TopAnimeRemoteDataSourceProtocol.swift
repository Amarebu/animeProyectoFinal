//
//  TopAnimeRemoteDataSourceProtocol.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 1/8/23.
//

import Foundation

protocol TopAnimeRemoteDataSourceProtocol {
    func getTopAnime() async throws -> TopAnimeDTO
}
