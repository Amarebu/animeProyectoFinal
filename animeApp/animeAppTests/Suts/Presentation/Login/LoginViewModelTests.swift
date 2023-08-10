//
//  LoginViewModelTests.swift
//  animeAppTests
//
//  Created by Reguera Bueno Ana María on 8/8/23.
//

import XCTest
@testable import animeApp

final class LoginViewModelTests: XCTestCase {

    var sut: LoginViewModel!
    var repositoryData: GetTopAnimesRepositoryProtocol!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
   }
    
    override func setUp() {
        super.setUp()
        let topAnimeDataSource = TopAnimeRemoteDataSourceImpl()
        let topMangaDataSource = TopMangaRemoteDataSourceImpl()
        let repoManga = GetTopMangaRepositoryImpl(topMangaRemoteDataSource: topMangaDataSource)
        repositoryData = GetTopAnimesRepositoryImpl(topAnimeRemoteDataSource: topAnimeDataSource)
        sut = LoginViewModel(loginView: nil,
                             repositoryteData: repositoryData, mangaRepositoryData: repoManga)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testLoginViewModel_whenLoginWithEmptyUserResponse_expectError() throws {
        let badUser = ""
        let goodPassword = "1234"
        sut?.login(user: badUser, pasword: goodPassword)
        XCTAssertNil(KeyChainHelper.standar.read(account: badUser), "ERROR: The user is in the KeyChain")
    }
    
    func testLoginViewModel_whenLoginWithEmptyPasswordResponse_expectError() throws {
        let user = "userTests"
        let badPassword = ""
        sut?.login(user: user, pasword: badPassword)
        XCTAssertNil(KeyChainHelper.standar.read(account: user), "ERROR: The user is in the KeyChain")
    }
    
    func testLoginViewModel_whenLoginWithGoodResponse_expectNavigateToHome() throws {
        let expectation = XCTestExpectation(description: "ERROR")
        let user = "userTests"
        let password = "passwordTests"
        var stringData = ""
        sut?.login(user: user, pasword: password) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
        let data = KeyChainHelper.standar.read(account: user) ?? Data()
        stringData = String(data: data, encoding: .utf8) ?? "UserNoEncontrado"
        XCTAssertEqual(stringData, password, "ERROR: The user not is in the KeyChain")
        KeyChainHelper.standar.delete(account: user)
    }

}
