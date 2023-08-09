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
    private var repositoryteData: GetTopAnimesRepositoryProtocol
    private var mangaRepositoryData: GetTopMangaRepositoryProtocol
    
    //MARK: Initializer
    init(loginView: LoginViewController?, repositoryteData: GetTopAnimesRepositoryProtocol, mangaRepositoryData: GetTopMangaRepositoryProtocol) {
        self.loginView = loginView
        self.repositoryteData = repositoryteData
        self.mangaRepositoryData = mangaRepositoryData
    }
    
    func login(user: String, pasword: String, testcompletion: @escaping (() ->()) = {}) {
        
        DispatchQueue.main.async {
            if user.isEmpty {
                self.loginView?.showAlert(alert: "The user can´t be empty")
            } else if pasword.isEmpty {
                self.loginView?.showAlert(alert: "The password can´t be empty")
            } else {
                let dataPassword = Data(pasword.utf8)
                 KeyChainHelper.standar.save(data: dataPassword, account: user)
                 testcompletion()
                self.loginView?.navigateToHome()
            }
            
        }
    }
}
