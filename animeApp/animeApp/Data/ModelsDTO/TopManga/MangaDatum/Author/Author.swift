//
//  Author.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 9/8/23.
//

import Foundation

// MARK: - Author
struct Author: Codable {
    let malID: Int?
    let type, name, url: String?

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case type, name, url
    }
}
