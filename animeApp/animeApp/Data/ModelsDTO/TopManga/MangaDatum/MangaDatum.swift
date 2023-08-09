//
//  MangaDatum.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 9/8/23.
//

import Foundation

//MARK: - Data
struct MangaDatum: Codable {
    let malID: Int?
    let url: String?
    let images: [String: Image]?
    let approved: Bool?
    let titles: [Title]?
    let title, titleEnglish, titleJapanese, type: String?
    let chapters, volumes: Int?
    let status: String?
    let publishing: Bool?
    let published: MangaPublished?
    let score, scoredBy, rank, popularity: Double?
    let members, favorites: Int?
    let synopsis, background: String?
    let authors, serializations, genres, explicitGenres: [Author]?
    let themes, demographics: [Author]?

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case url, images, approved, titles, title
        case titleEnglish = "title_english"
        case titleJapanese = "title_japanese"
        case type, chapters, volumes, status, publishing, published, score
        case scoredBy = "scored_by"
        case rank, popularity, members, favorites, synopsis, background, authors, serializations, genres
        case explicitGenres = "explicit_genres"
        case themes, demographics
    }
}
