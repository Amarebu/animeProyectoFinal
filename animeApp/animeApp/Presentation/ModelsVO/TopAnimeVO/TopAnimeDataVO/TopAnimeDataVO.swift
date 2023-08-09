//
//  TopAnimeDataVO.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 3/8/23.
//

import Foundation

struct TopAnimeDataVO {
    let malID: Int?
    let image: String?
    let year: Int?
    let titleEnglish: String?
    let url: String?
    let episodes: Int?
    let status: String?
    let airing: Bool?
    let duration: String?
    let score: Double?
    let synopsis: String?
    let season: String?
    let genre: [DemographicVO]?
}
