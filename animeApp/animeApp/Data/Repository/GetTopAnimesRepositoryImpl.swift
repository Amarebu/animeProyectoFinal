//
//  getTopAnimesRepositoryImpl.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 2/8/23.
//

import Foundation

final class GetTopAnimesRepositoryImpl: GetTopAnimesRepositoryProtocol {
    
    // MARK: - Properties
    private let topAnimeRemoteDataSource: TopAnimeRemoteDataSourceProtocol
    
    init(topAnimeRemoteDataSource: TopAnimeRemoteDataSourceProtocol) {
        self.topAnimeRemoteDataSource = topAnimeRemoteDataSource
    }
    
    func getTopAnimes() async throws -> TopAnimeDO {
        let topAnimes = try await topAnimeRemoteDataSource.getTopAnime()
        return topAnimes.mapToDO()
    }
    
}


