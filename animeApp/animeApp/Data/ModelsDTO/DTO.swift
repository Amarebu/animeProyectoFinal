//
//  File.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 1/8/23.
//


struct DTO {
    let a: Int
    let b: String
    let c: Bool
}

extension DTO {
    func map() -> DO {
        return DO(a: "\(a)",
                  b: J(rawValue: b) ?? .a)
    }
}
