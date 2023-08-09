//
//  HomeViewModel.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 9/8/23.
//

import Foundation

final class HomeMangaViewModel {
    
    // MARK: Properties
    private let repository: GetTopMangaRepositoryImpl
    private weak var homeView: HomeMangaViewController?
    private var mangas: [TopMangaDataVO] = []

    init(repository: GetTopMangaRepositoryImpl, homeView: HomeMangaViewController) {
        self.repository = repository
        self.homeView = homeView
    }
    
    func getTopManga(onCompletion: @escaping () -> Void) {
        Task {
            let topManga = try await repository.getTopManga()
            mangas = topManga.mapToVO().topManga
            DispatchQueue.main.async {
                onCompletion()
            }
        }
    }
    
    func onNeeedTopManga() -> [TopMangaDataVO] {
        return mangas
    }
    
}
