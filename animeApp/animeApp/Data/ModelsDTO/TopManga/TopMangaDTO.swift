//
//  TopMangaDTO.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 9/8/23.
//

import Foundation

// MARK: - Manga
struct TopMangaDTO: Codable {
    let data: [MangaDatum]
    let pagination: Pagination
}

extension TopMangaDTO {
    func mapToDO() -> TopMangaDO {
        
        var dataDO: [DatumMangaDO] = []
        
        let pagination = PaginationDO(
            lastVisiblePage: pagination.lastVisiblePage ?? 1,
            hasNextPage: pagination.hasNextPage ?? true)
        
        data.forEach { data in
            var authorDO: [AuthorDO] = []
            let imageURL = data.images?["jpg"]?.imageURL
            
            
            data.genres?.forEach { demo in
                authorDO.append(AuthorDO(malID: demo.malID,
                                       type: demo.type,
                                       name: demo.name,
                                       url: demo.url))
            }
            
            dataDO.append(DatumMangaDO(malID: data.malID,
                                       url: data.url,
                                       images: imageURL,
                                       titleEnglish: data.title,
                                       chapters: data.chapters,
                                       status: data.status,
                                       score: data.score,
                                       synopsis: data.synopsis,
                                       genres: authorDO
                                      ))
        }
        return TopMangaDO(data: dataDO, pagination: pagination)
    }
}
