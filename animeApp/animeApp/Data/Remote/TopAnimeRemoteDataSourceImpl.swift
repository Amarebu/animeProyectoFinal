//
//  TopAnimeRemoteDataSourceImpl.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 1/8/23.
//

import Foundation

final class TopAnimeRemoteDataSourceImpl: TopAnimeRemoteDataSourceProtocol {
    
    //MARK: Properties
    private let session: NetworkFetchingProtocol
    private let server: String = "https://api.jikan.moe/v4"
    
    init(session: NetworkFetchingProtocol = URLSession.shared) {
        self.session = session
    }
    
    func getTopAnime() async throws -> TopAnimeDTO {
        // Get URLSession
        guard let urlRequest = getSessionTopAnime() else {
            throw NetworkError.malformedURL // Para seguir el ejemplo del playground
        }
        // Obtener la data de la llamada
        let (data, _) = try await session.data(url: urlRequest)
        let topAnimes = try JSONDecoder().decode(TopAnimeDTO.self, from: data)    // si no quiero que se propague le pongo try?

        return topAnimes
    }
  
}
extension TopAnimeRemoteDataSourceImpl {
    
    private func getSessionTopAnime() -> URLRequest? {
        // Get URL request:
        guard let url = URL(string: "\(server)/top/anime") else {
            print("URL Error")
            return nil
        }
        // URL request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
}
