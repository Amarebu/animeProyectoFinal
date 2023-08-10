//
//  MangaRemoteDataSourceTests.swift
//  animeAppTests
//
//  Created by Reguera Bueno Ana María on 10/8/23.
//

import XCTest
@testable import animeApp

final class MangaRemoteDataSourceTests: XCTestCase {

    //MARK: Properties
    var sut: TopMangaRemoteDataSourceProtocol?
    
    override func setUpWithError() throws {
     
        try super.setUpWithError()
        //Configuring the mock URLSession
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolMock.self]
        //Configuration injection
        let mockURLSession = URLSession.init(configuration: configuration)
        sut = TopMangaRemoteDataSourceImpl(session: mockURLSession)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testRemoteDataSource_whenGetManga_expectManga() async throws {
        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            let mangas = TopMangaDTO(data: [MangaDatum( malID: 3,
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
            let data = try JSONEncoder().encode(mangas) // Requiere cambiar hero a Encodable --> Decodable + Encodable = Codable
            return (response, data)
        }
        
        // WHEN
        guard let mangas = try? await sut?.getTopManga() else {
            XCTFail("Mangas must contain an mangas")
            return
        }
        
        // THEN
        XCTAssertNotNil(mangas)
        //XCTAssertEqual(animes.data.first?.images?["test"]?.imageURL, mockImageURL)
        //XCTAssertEqual(animes.first?.name, "name")
    }


}
