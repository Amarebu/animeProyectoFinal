//
//  Demographic.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 1/8/23.
//

import Foundation

// MARK: - Demographic
struct Demographic: Codable {
    let malID: Int?
    let type, name, url: String?

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case type, name, url
    }
}
