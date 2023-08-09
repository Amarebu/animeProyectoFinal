//
//  TopMangaDataVO.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 9/8/23.
//

import Foundation

struct TopMangaDataVO {
    let malID: Int?
    let url: String?
    let images: String?
    let titleEnglish: String?
    let chapters: Int?
    let status: String?
    let score: Double?
    let synopsis: String?
    let genres: [AuthorVO]?
}
