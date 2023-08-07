//
//  HomeViewModel.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 2/8/23.
//
import Foundation

final class HomeViewModel {
    
    // MARK: Properties
    private let repository: GetTopAnimesRepositoryImpl
    private weak var homeView: HomeViewController?
    private var animes: [TopAnimeDataVO] = []

    init(repository: GetTopAnimesRepositoryImpl, homeView: HomeViewController) {
        self.repository = repository
        self.homeView = homeView
    }
    
    func getTopAnimes(onCompletion: @escaping () -> Void) {
        Task {
            var topAnimes = try await repository.getTopAnimes()
            animes = topAnimes.mapToVO().topAnime
            DispatchQueue.main.async {
                onCompletion()
            }
        }
    }
    
    func onNeeedTopAnimes() -> [TopAnimeDataVO] {
        return animes
    }
}
