//
//  Datum.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 2/8/23.
//

import Foundation

// MARK: - Datum
struct DatumDO: Codable {
    let malID: Int?
    let url: String?
    let images: String?
    let titleEnglish: String?
    let episodes: Int?
    let status: String?
    let airing: Bool?
    let duration: String?
    let score: Double?
    let synopsis: String?
    let season: String?
    let year: Int?
    let genres: [DemographicDO]?
}

