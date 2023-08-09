//
//  TopAnimeDO.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 2/8/23.
//

import Foundation


struct TopAnimeDO: Codable {
    let data: [DatumDO]
    let pagination: PaginationDO
}

extension TopAnimeDO {
    func mapToVO() -> TopAnimeVO {
        
        var dataVO: [TopAnimeDataVO] = []
        var demographVO: [DemographicVO] = []
        
        
        data.forEach { data in
            
            data.genres?.forEach { demo in
                demographVO.append(DemographicVO(malID: demo.malID,
                                                 type: demo.type,
                                                 name: demo.name))
            }
            dataVO.append(TopAnimeDataVO(malID: data.malID,
                                         image: data.images,
                                         year: data.year,
                                         titleEnglish: data.titleEnglish,
                                         url: data.url,
                                         episodes: data.episodes,
                                         status: data.status,
                                         airing: data.airing,
                                         duration: data.duration,
                                         score: data.score,
                                         synopsis: data.synopsis,
                                         season: data.season,
                                         genre: demographVO))
        }
        
        let topAnimeVO = TopAnimeVO(topAnime: dataVO, hasNextPage: pagination.hasNextPage)
        
        return topAnimeVO
    }
}
