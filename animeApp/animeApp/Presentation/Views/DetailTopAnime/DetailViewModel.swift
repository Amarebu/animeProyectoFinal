//
//  DetailViewModel.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 6/8/23.
//

import Foundation

protocol DetailViewModelProtocol: AnyObject {
    func onPressUrl(isValid: Bool, urlShared: URL?)
}

class DetailViewModel {
    
    // MARK: Properties
    private let repository: GetTopAnimesRepositoryImpl
    private weak var viewDelegate: DetailViewControllerProtocol?
    
    // MARK: - Lifecycle
    init(repository: GetTopAnimesRepositoryImpl,viewDelegate: DetailViewControllerProtocol) {
        self.repository = repository
        self.viewDelegate = viewDelegate
    }
}

// MARK: - DetailViewModelProtocol extension
extension DetailViewModel: DetailViewModelProtocol {

    func onPressUrl(isValid: Bool, urlShared: URL?) {
        if isValid {
            guard let urlShared else { return }
            viewDelegate?.searchLink(url: urlShared)
        } else {
            viewDelegate?.showAlert(alert: "At this moment the url isn't avaible")
        }
    }
    
    
}
