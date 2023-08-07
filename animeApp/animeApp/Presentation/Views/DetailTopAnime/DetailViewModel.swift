//
//  DetailViewModel.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 6/8/23.
//

import Foundation

protocol DetailViewModelProtocol: AnyObject {
    
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
    
}
