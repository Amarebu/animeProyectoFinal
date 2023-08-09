//
//  TopMangaDO.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 9/8/23.
//

import Foundation

struct TopMangaDO: Codable {
    let data: [DatumMangaDO]
    let pagination: PaginationDO
}

extension TopMangaDO {
    
    func mapToVO() -> TopMangaVO {
        
        var dataVO: [TopMangaDataVO] = []
        var author: [AuthorVO] = []
        
        data.forEach { data in
            
            data.genres?.forEach { demo in
                
                author.append(AuthorVO(malID: demo.malID,
                                       type: demo.type,
                                       name: demo.name))
            }
                dataVO.append(TopMangaDataVO(malID: data.malID,
                                             url: data.url,
                                             images: data.images,
                                             titleEnglish: data.titleEnglish,
                                             chapters: data.chapters,
                                             status: data.status,
                                             score: data.score,
                                             synopsis: data.synopsis,
                                             genres: author))
            
        }
        let topMangaVO = TopMangaVO(topManga: dataVO, hasNextPage: pagination.hasNextPage)
        return topMangaVO
    }
}
