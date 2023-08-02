//
//  Pagination.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 1/8/23.
//

import Foundation

// MARK: - Pagination
struct Pagination: Codable {
    let lastVisiblePage: Int
    let hasNextPage: Bool
    let items: Items

    enum CodingKeys: String, CodingKey {
        case lastVisiblePage = "last_visible_page"
        case hasNextPage = "has_next_page"
        case items
    }
}
