//
//  DetailMangaViewModel.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 9/8/23.
//

import Foundation

protocol DetailMangaViewModelProtocol: AnyObject {
    func onPressUrl(isValid: Bool, urlShared: URL?)
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
    func onPressUrl(isValid: Bool, urlShared: URL?) {
        if isValid {
            guard let urlShared else { return }
            viewDelegate?.searchLink(url: urlShared)
        } else {
            viewDelegate?.showAlert(alert: "At this moment the url isn't avaible")
        }
    }
}
