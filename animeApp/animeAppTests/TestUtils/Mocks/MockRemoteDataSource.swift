//
//  MockRemoteDataSource.swift
//  animeAppTests
//
//  Created by Reguera Bueno Ana María on 8/8/23.


import Foundation
@testable import animeApp

final class MockRemoteDataSource:TopAnimeRemoteDataSourceProtocol {
    func getTopAnime() async throws -> animeApp.TopAnimeDTO {
        return TopAnimeDTO(data: [], pagination: Pagination(lastVisiblePage: 2, hasNextPage: true, items: Items(count: 1, total: 2, perPage: 3)))
    }
    

    var loginSucces: Bool = false
    var heroesEmpty: Bool = false
    
    init(loginSucces: Bool, heroesEmpty: Bool) {
        self.loginSucces = loginSucces
        self.heroesEmpty = heroesEmpty
    }
    

    
}
