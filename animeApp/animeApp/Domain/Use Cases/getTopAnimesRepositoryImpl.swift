//
//  getTopAnimesRepositoryImpl.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 2/8/23.
//

import Foundation

final class getTopAnimesRepositoryImpl: getTopAnimesRepositoryProtocol {
    
    // MARK: - Properties
    private let topAnimeRemoteDataSource: TopAnimeRemoteDataSourceProtocol
    
    init(topAnimeRemoteDataSource: TopAnimeRemoteDataSourceImpl) {
        self.topAnimeRemoteDataSource = topAnimeRemoteDataSource
    }
    
    func getTopAnimes() async throws -> TopAnimeDO {
        
        let topAnimes = try await topAnimeRemoteDataSource.getTopAnime()
         
        topAnimes.mapToDO().data.forEach{ j in
            print(j.titleEnglish)
        }
        return topAnimes.mapToDO()
    }
}


