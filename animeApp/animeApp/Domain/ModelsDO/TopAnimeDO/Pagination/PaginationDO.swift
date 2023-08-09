//
//  PaginationDO.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 2/8/23.
//

import Foundation

struct PaginationDO: Codable {
    let lastVisiblePage: Int
    let hasNextPage: Bool
}
