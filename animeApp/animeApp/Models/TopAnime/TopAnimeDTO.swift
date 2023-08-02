//
//  TopAnime.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 1/8/23.
//

import Foundation

struct TopAnimeDTO: Codable {
    let data: [Datum]
    let pagination: Pagination
}
