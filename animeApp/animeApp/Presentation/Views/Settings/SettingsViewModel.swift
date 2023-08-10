//
//  SettingsViewModel.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 10/8/23.
//

import Foundation

protocol SettingsViewModelProtocol: AnyObject {
    func onPressUrl(urlShared: String)
}

class SettingsViewModel {
    private weak var viewDelegate: SettingsViewControllerProtocol?
    
    // MARK: - Lifecycle
    init(viewDelegate: SettingsViewControllerProtocol) {
        self.viewDelegate = viewDelegate
    }
}


// MARK: - DetailViewControllerProtocol extension
extension SettingsViewModel: SettingsViewModelProtocol {
    func onPressUrl(urlShared: String) {
        print("hola")
        let urlShared = URL(string: urlShared)
        guard let urlShared else { return }
        viewDelegate?.searchLink(url: urlShared)
    }
}
