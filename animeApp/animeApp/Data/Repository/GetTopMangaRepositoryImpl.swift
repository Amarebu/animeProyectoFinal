//
//  GetTopMangaRepositoryImpl.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 9/8/23.
//

import Foundation

final class GetTopMangaRepositoryImpl: GetTopMangaRepositoryProtocol {
    
    // MARK: - Properties
    private let topMangaRemoteDataSource: TopMangaRemoteDataSourceProtocol
    
    init(topMangaRemoteDataSource: TopMangaRemoteDataSourceProtocol) {
        self.topMangaRemoteDataSource = topMangaRemoteDataSource
    }
    
    func getTopManga() async throws -> TopMangaDO {
        
        let topManga = try await topMangaRemoteDataSource.getTopManga()
        return topManga.mapToDO()
    }
    
}
