//
//  LoginViewModel.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 1/8/23.
//

import Foundation

final class LoginViewModel {
    
    // MARK: vars
    private weak var loginView: LoginViewController?
    private var remoteData: TopAnimeRemoteDataSourceImpl = TopAnimeRemoteDataSourceImpl()
    
    //MARK: Initializer
    init(loginView: LoginViewController?) {
        self.loginView = loginView
    }
    
    func login(user: String, pasword: String) {
        Task {
            try await self.remoteData.getTopAnime()
        }
        DispatchQueue.main.async {
            if user.isEmpty {
                self.loginView?.showAlert(alert: "The password can´t be empty")
                print("hola")
            }
            if pasword.isEmpty {
                self.loginView?.showAlert(alert: "The password can´t be empty")
            }
            
        }
    }
}
