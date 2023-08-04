//
//  TopAnime.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 1/8/23.
//

import Foundation

struct TopAnimeDTO: Codable {
    let data: [Datum]
    let pagination: Pagination
}


extension TopAnimeDTO {
    func mapToDO() -> TopAnimeDO {
        
        var dataDO: [DatumDO] = []
        
        let pagination = PaginationDO(
            lastVisiblePage: pagination.lastVisiblePage,
            hasNextPage: pagination.hasNextPage)
        
        data.forEach { data in
            var demographDO: [DemographicDO] = []
            let imageURL = data.images?["jpg"]?.imageURL
            
            
            data.demographics?.forEach { demo in
                demographDO.append(DemographicDO(malID: demo.malID,
                                                 type: demo.type,
                                                 name: demo.name))
            }
            
            dataDO.append(DatumDO(malID: data.malID,
                                  url: data.url,
                                  images: imageURL ?? "",
                                  titleEnglish: data.titleEnglish,
                                  episodes: data.episodes,
                                  status: data.status,
                                  airing: data.airing,
                                  duration: data.duration,
                                  score: data.score,
                                  synopsis: data.synopsis,
                                  season: data.season,
                                  year: data.year,
                                  genres: demographDO))
        }
        return TopAnimeDO(data: dataDO, pagination: pagination)
    }
}

