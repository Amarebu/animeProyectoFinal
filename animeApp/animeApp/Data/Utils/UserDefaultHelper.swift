//
//  UserDefaultHelper.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 1/8/23.
//

import Foundation

final class UserDefaultHelper {
    
    static let defaults = UserDefaultHelper()
    private init() {}
    
    func save(user: String) {
        UserDefaults.standard.setValue(user, forKey: "useriOSAnimeApp")
        UserDefaults.standard.synchronize()
    }
    
    func readUser() -> String? {
        return UserDefaults.standard.string(forKey: "useriOSAnimeApp")
    }
}
