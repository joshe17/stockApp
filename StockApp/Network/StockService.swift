//
//  StockService.swift
//  StockApp
//
//  Created by Joshua Ho on 7/11/23.
//

import Foundation
import Combine

protocol StockServiceProtocol {
    func fetchStocks() async throws -> StockResponse
}

class StockService: StockServiceProtocol {
    var cancellable = Set<AnyCancellable>()
    
    func fetchStocks() async throws -> StockResponse {
        let urlString = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json"
//        let urlString = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio_malformed.json"
//        let urlString = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio_empty.json"
        guard let url = URL(string: urlString) else { throw APIError.invalidUrl }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else { throw APIError.invalidResponse }
        return try JSONDecoder().decode(StockResponse.self, from: data)

//        do {
//            return try JSONDecoder().decode(StockResponse.self, from: data)
//        } catch {
//            throw APIError.decodingError
//        }
    }
}
