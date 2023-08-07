//
//  RootViewModel.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 7/8/23.
//

import Foundation

enum Status:Equatable {
    static func == (lhs: Status, rhs: Status) -> Bool {
        switch(lhs,rhs) {
        case (.login, .login): return true
        case (.home, .home): return true
        default: return false
        }
    }
    

    case login, home, detail(model: TopAnimeDataVO)
}

final class RootViewModel {
    
    var activeView: Status = .login {
        didSet {
            print("New value of activeView is \(activeView)")
            if oldValue != activeView {
                self.onViewChange?()
            }
        }
    }
    
    var onViewChange: (() -> Void)?
}
