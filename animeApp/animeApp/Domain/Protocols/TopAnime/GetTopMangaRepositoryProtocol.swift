//
//  GetTopMangaRepositoryProtocol.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 9/8/23.
//

import Foundation

protocol GetTopMangaRepositoryProtocol {
    func getTopManga() async throws -> TopMangaDO
}
