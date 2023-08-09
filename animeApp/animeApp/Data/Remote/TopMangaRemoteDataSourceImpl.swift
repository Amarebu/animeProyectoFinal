//
//  TopMangaRemoteDataSourceImpl.swift
//  animeApp
//
//  Created by Reguera Bueno Ana María on 9/8/23.
//

import Foundation

final class TopMangaRemoteDataSourceImpl: TopMangaRemoteDataSourceProtocol {
    
    //MARK: Properties
    private let session: NetworkFetchingProtocol
    private let server: String = "https://api.jikan.moe/v4"
    
    init(session: NetworkFetchingProtocol = URLSession.shared) {
        self.session = session
    }
    
    func getTopManga() async throws -> TopMangaDTO {
        // Get URLSession
        guard let urlRequest = getSessionTopManga() else {
            throw NetworkError.malformedURL // Para seguir el ejemplo del playground
        }
        // Obtener la data de la llamada
        //let (data,_) = try await URLSession.shared.data(for: urlRequest)
        let (data, _) = try await session.data(url: urlRequest)
        let topMangas = try JSONDecoder().decode(TopMangaDTO.self, from: data)
        topMangas.data.forEach { data in
            print(data.title)
        }
        
        return topMangas
    }
  
}
extension TopMangaRemoteDataSourceImpl {
    
    private func getSessionTopManga() -> URLRequest? {
        // Get URL request:
        guard let url = URL(string: "\(server)/top/manga") else {
            print("URL Error")
            return nil
        }
        // URL request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        print(urlRequest)
        return urlRequest
    }
}
