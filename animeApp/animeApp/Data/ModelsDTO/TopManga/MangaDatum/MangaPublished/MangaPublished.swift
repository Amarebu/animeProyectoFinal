//
//  MangaPublished.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 9/8/23.
//

import Foundation

// MARK: - Published
struct MangaPublished: Codable {
    let from, to: String?
    let prop: Prop
}

enum CodingKeys: String, CodingKey {
    case MangaPublished = "published"
}
