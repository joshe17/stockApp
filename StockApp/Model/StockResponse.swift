//
//  StockResponse.swift
//  StockApp
//
//  Created by Joshua Ho on 7/11/23.
//

import Foundation

struct StockResponse: Codable {
    let stocks: [Stock]
    var ownedStocksArray: [Stock] = []
    var unownedStocksArray: [Stock] = []
    
    private enum CodingKeys: String, CodingKey {
        case stocks = "stocks"
    }
    
    func getPortfolioWorth() -> String {
        var currSum: Double = 0
        for stock in stocks {
            if let q = stock.quantity {
                let stockValue = (Double(stock.convertCentsToDollars()) ?? 0) * Double(q)
                currSum += stockValue
            }
        }
        return String(format: "%.2f", currSum)
    }
    
    mutating func getOwnedStocks() {
        for stock in stocks {
            if stock.quantity != nil {
                ownedStocksArray.append(stock)
            } else {
                unownedStocksArray.append(stock)
            }
        }
    }

}

struct Stock: Codable, Hashable {
    let ticker: String
    let name: String
    let currency: String
    let currentPriceCents: Int
    let quantity: Int?
    let currentPriceTimestamp: Int
    
    private enum CodingKeys: String, CodingKey {
        case ticker = "ticker"
        case name = "name"
        case currency = "currency"
        case currentPriceCents = "current_price_cents"
        case quantity = "quantity"
        case currentPriceTimestamp = "current_price_timestamp"
    }
    
    func convertCentsToDollars() -> String {
        let priceInDollars = Double(currentPriceCents) / 100
        return String(format: "%.2f", priceInDollars)
    }
    
    func convertTimestampToDate() -> String {
        let date = Date(timeIntervalSince1970: Double(currentPriceTimestamp))
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "MM/dd/YY"

        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
        
    }
    
    func displayNumberOfShares() -> String {
        if let q = quantity {
            return "\(q) Shares"
        } else {
            return "0 Shares"
        }
    }
    
    func hasSharesOfStock() -> Bool {
        if quantity != nil {
            return true
        } else {
            return false
        }
    }
}
