//
//  TopMangaRemoteDataSourceProtocol.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 9/8/23.
//

import Foundation


protocol TopMangaRemoteDataSourceProtocol {
    func getTopManga() async throws -> TopMangaDTO
}
