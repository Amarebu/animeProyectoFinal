//
//  GetTopMangasRepositoryImplTests.swift
//  animeAppTests
//
//  Created by Reguera Bueno Ana María on 10/8/23.
//

@testable import animeApp
import Foundation
import XCTest

class GetTopMangasRepositoryImplTests: XCTestCase {
    class TopMangaRemoteDataSourceMock: TopMangaRemoteDataSourceProtocol {
        var model: TopMangaDTO?
        
        func getTopManga() async throws -> TopMangaDTO {
            guard let model else {
                return TopMangaDTO(data: [], pagination: Pagination(lastVisiblePage: 2, hasNextPage: true, items: Items(count: 3, total: 2, perPage: 2)))
            }
            return model
        }
    }
    
    var sut: GetTopMangaRepositoryImpl!
    var datasource: TopMangaRemoteDataSourceProtocol!
    
    override func setUp() {
        super.setUp()
        datasource = TopMangaRemoteDataSourceMock()
        sut = GetTopMangaRepositoryImpl(topMangaRemoteDataSource: datasource)
    }
    
    func testGetTopMangas_whenGetTopAnime_expectTopAnimeDO() async throws {
        // GIVEN
        guard let datasource = datasource as? TopMangaRemoteDataSourceMock else {
            return
        }
        datasource.model = getDTOModel()
        
        // WHEN
        let resultDO = try await sut.getTopManga()
        
        // THEN
        XCTAssertNotNil(resultDO)
    }
}

extension GetTopMangasRepositoryImplTests {
    func getDTOModel() -> TopMangaDTO {
        return  TopMangaDTO(data: [MangaDatum( malID: 3,
                                               url: " ",
                                               images: ["jpg":Image( imageURL: " ",
                                                                     smallImageURL: " ",
                                                                     largeImageURL: " ")],
                                               approved: false,
                                               titles: [Title(type: " ",
                                                              title: " ")],
                                               title: " ",
                                               titleEnglish: " ",
                                               titleJapanese: " ",
                                               type: " ",
                                               chapters: 52,
                                               volumes: 23,
                                               status: " ",
                                               publishing: false,
                                               published: MangaPublished( from: " ",
                                                                          to: " ",
                                                                          prop: Prop( from: From( day: 43,
                                                                                                  month: 34,
                                                                                                  year: 4),
                                                                                      to: From(day: 45,
                                                                                               month: 3,
                                                                                               year: 4),
                                                                                      string: " ")),
                                               score: 1.2,
                                               scoredBy: 3.4,
                                               rank: 3.4,
                                               popularity: 3.4,
                                               members: 2,
                                               favorites: 4,
                                               synopsis: " ",
                                               background: " ",
                                               authors: [Author(malID: 45,
                                                                type: " ",
                                                                name: " ",
                                                                url: " ")],
                                               serializations: [Author(malID: 3,
                                                                       type: " ",
                                                                       name: " ",
                                                                       
                                                                       url: " ")],
                                               genres: [Author(malID: 3,
                                                               type: " ",
                                                               name: " ",
                                                               
                                                               url: " ")],
                                               explicitGenres: [Author(malID: 3,
                                                                       type: " ",
                                                                       name: " ",
                                                                       
                                                                       url: " ")],
                                               themes: [Author(malID: 3,
                                                               type: " ",
                                                               name: " ",
                                                               
                                                               url: " ")],
                                               demographics: [Author(malID: 3,
                                                                     type: " ",
                                                                     name: " ",
                                                                     
                                                                     url: " ")])],
                            pagination: Pagination(lastVisiblePage: 2,
                                                   hasNextPage: true,
                                                   items: Items(count: 45,
                                                                total: 3,
                                                                perPage: 25)))
    }
}
