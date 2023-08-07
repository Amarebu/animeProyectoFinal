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
    
    //MARK: Initializer
    init(loginView: LoginViewController?, repositoryteData: GetTopAnimesRepositoryProtocol) {
        self.loginView = loginView
        self.repositoryteData = repositoryteData
    }
    
    func login(user: String, pasword: String) {
        
        DispatchQueue.main.async {
            if user.isEmpty {
                self.loginView?.showAlert(alert: "The password can´t be empty")
            } else if pasword.isEmpty {
                self.loginView?.showAlert(alert: "The password can´t be empty")
            } else {
                self.loginView?.navigateToHome()
            }
            
        }
    }
}
