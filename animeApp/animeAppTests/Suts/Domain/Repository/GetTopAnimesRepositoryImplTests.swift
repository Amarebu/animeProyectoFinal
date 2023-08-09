//
//  GetTopAnimesRepositoryImplTests.swift
//  animeAppTests
//
//  Created by Reguera Bueno Ana María on 9/8/23.
//
@testable import animeApp
import Foundation
import XCTest

class GetTopAnimesRepositoryImplTests: XCTestCase {
    class TopAnimeRemoteDataSourceMock: TopAnimeRemoteDataSourceProtocol {
        var model: TopAnimeDTO?
        
        func getTopAnime() async throws -> TopAnimeDTO {
            guard let model else {
                return TopAnimeDTO(data: [], pagination: Pagination(lastVisiblePage: 2, hasNextPage: true, items: Items(count: 3, total: 2, perPage: 2)))
            }
            return model
        }
    }
    
    var sut: GetTopAnimesRepositoryImpl!
    var datasource: TopAnimeRemoteDataSourceProtocol!
    
    override func setUp() {
        super.setUp()
        datasource = TopAnimeRemoteDataSourceMock()
        sut = GetTopAnimesRepositoryImpl(topAnimeRemoteDataSource: datasource)
    }
    
    func testGetTopAnimes_whenGetTopAnime_expectTopAnimeDO() async throws {
        // GIVEN
        guard let datasource = datasource as? TopAnimeRemoteDataSourceMock else {
            return
        }
        datasource.model = getDTOModel()
        
        // WHEN
        let resultDO = try await sut.getTopAnimes()
        
        // THEN
        XCTAssertNotNil(resultDO)
    }
}

extension GetTopAnimesRepositoryImplTests {
    func getDTOModel() -> TopAnimeDTO {
        return TopAnimeDTO(data: [Datum(malID: 7,
                                        url: " ",
                                        images: ["test": Image(imageURL: " ",
                                                               smallImageURL: " ",
                                                               largeImageURL: " ")],
                                        trailer: Trailer(youtubeID: " ", url: " ", embedURL: " "),
                                        approved: true,
                                        titles: [Title(type: " ",
                                                       title: " ")],
                                        title: "",
                                        titleEnglish: " ",
                                        titleJapanese: " ",
                                        titleSynonyms: [" "],
                                        type: " ",
                                        source: " ",
                                        episodes: 4,
                                        status: " ",
                                        airing: false,
                                        aired: Aired(from: " ",
                                                     to: " ",
                                                     prop: Prop(from: From(day: 4,
                                                                           month: 4,
                                                                           year: 3),
                                                                to: From(day: 4,
                                                                         month: 4,
                                                                         year: 23),
                                                                string: " ")),
                                        duration: " ", rating: " ",
                                        score: 10.0,
                                        scoredBy: 3.0,
                                        rank: 2.0,
                                        popularity: 2.0,
                                        members: 3,
                                        favorites: 4,
                                        synopsis: " ",
                                        background: " ",
                                        season: " ",
                                        year: 45,
                                        broadcast: Broadcast(day: " ",
                                                             time: " ",
                                                             timezone: " ", string: " "),
                                        producers: [Demographic(malID: 4,
                                                                type: " ",
                                                                name: " ",
                                                                url: " ")],
                                        licensors: [Demographic(malID: 4,
                                                                type: " ",
                                                                name: " ",
                                                                url: " ")],
                                        studios:  [Demographic(malID: 4,
                                                               type: " ",
                                                               name: " ",
                                                               url: " ")],
                                        genres:  [Demographic(malID: 4,
                                                              type: " ",
                                                              name: " ",
                                                              url: " ")],
                                        explicitGenres:  [Demographic(malID: 4,
                                                                      type: " ",
                                                                      name: " ",
                                                                      url: " ")],
                                        themes:  [Demographic(malID: 4,
                                                              type: " ",
                                                              name: " ",
                                                              url: " ")],
                                        demographics:  [Demographic(malID: 4,
                                                                    type: " ",
                                                                    name: " ",
                                                                    url: " ")])],
                           pagination: Pagination(lastVisiblePage: 3,
                                                  hasNextPage: true,
                                                  items: Items(count: 5,
                                                               total: 6,
                                                               perPage: 4)))
    }
}
