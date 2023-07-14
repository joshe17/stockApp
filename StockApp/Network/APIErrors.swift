//
//  APIErrors.swift
//  StockApp
//
//  Created by Joshua Ho on 7/13/23.
//

import Foundation

enum APIError: Error {
    case invalidUrl
    case invalidResponse
    case emptyData
    case serviceUnavailable
    case decodingError
                    
    var description: String {
        switch self {
        case .invalidUrl:
            return "invalid URL"
        case .invalidResponse:
            return "invalid response"
        case .emptyData:
            return "empty data"
        case .serviceUnavailable:
            return "service unavailable"
        case .decodingError:
            return "decoding error"
        }
    }
}
