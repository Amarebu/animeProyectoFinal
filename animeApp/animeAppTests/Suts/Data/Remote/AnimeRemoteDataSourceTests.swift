//
//  RemoteDataSourceTests.swift
//  animeAppTests
//
//  Created by Reguera Bueno Ana María on 8/8/23.
//

import XCTest
import Combine
@testable import animeApp

final class AnimeRemoteDataSourceTests: XCTestCase {
    
    //MARK: Properties
    var sut: TopAnimeRemoteDataSourceProtocol?
    override func setUpWithError() throws {
        try super.setUpWithError()
        //Configuring the mock URLSession
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolMock.self]
        //Configuration injection
        let mockURLSession = URLSession.init(configuration: configuration)
        sut = TopAnimeRemoteDataSourceImpl(session: mockURLSession)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testRemoteDataSource_whenGetAnime_expectAnimes() async throws {
        // GIVEN
        // Le metemos el request handler con status code y la data que queramos
        let mockImageURL = "asdv"
        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            let animes = TopAnimeDTO(data: [Datum(malID: 7,
                                                   url: " ",
                                                   images: ["test": Image(imageURL: mockImageURL,
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
            let data = try JSONEncoder().encode(animes) // Requiere cambiar hero a Encodable --> Decodable + Encodable = Codable
            return (response, data)
        }
        
        // WHEN
        guard let animes = try? await sut?.getTopAnime() else {
            XCTFail("Animes must contain an animes")
            return
        }
        
        // THEN
        XCTAssertNotNil(animes)
        XCTAssertEqual(animes.data.first?.images?["test"]?.imageURL, mockImageURL)
        //XCTAssertEqual(animes.first?.name, "name")
    }
}
