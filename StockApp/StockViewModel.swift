//
//  StockViewModel.swift
//  StockApp
//
//  Created by Joshua Ho on 7/11/23.
//

import Foundation
import Combine

enum AsyncStatus {
    case initial, loading, loaded, error
}

class StockViewModel: ObservableObject {
    @Published var stockData: StockResponse?
    @Published var status: AsyncStatus = .initial

    var cancellable = Set<AnyCancellable>()
    
    let service: StockServiceProtocol
    
    init(service: StockServiceProtocol) {
        self.service = service
    }
    
    @MainActor func getStocks() {
        Task {
            do {
                status = .loading
                self.stockData = try await service.fetchStocks()
                if stockData != nil {
                    stockData?.getOwnedStocks()
                }
                status = .loaded
            } catch {
                if let error = error as? APIError {
                    print(error)
                } else {
                    print(error)
                }
                status = .error
            }
        }
    }
    
}
