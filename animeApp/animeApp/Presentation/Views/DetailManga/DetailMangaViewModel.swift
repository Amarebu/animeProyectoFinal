//
//  DetailMangaViewModel.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 9/8/23.
//

import Foundation

protocol DetailMangaViewModelProtocol: AnyObject {
    
}

class DetailMangaViewModel {
    
    // MARK: Properties
    private let repository: GetTopMangaRepositoryImpl
    private weak var viewDelegate: DetailMangaViewControllerProtocol?
    
    // MARK: - Lifecycle
    init(repository: GetTopMangaRepositoryImpl,viewDelegate: DetailMangaViewControllerProtocol) {
        self.repository = repository
        self.viewDelegate = viewDelegate
    }
    
}

// MARK: - DetailViewModelProtocol extension
extension DetailMangaViewModel: DetailMangaViewModelProtocol {
    
}
