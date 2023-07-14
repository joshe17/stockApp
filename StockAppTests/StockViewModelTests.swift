//
//  StockViewModelTests.swift
//  StockAppTests
//
//  Created by Joshua Ho on 7/13/23.
//

import XCTest
import Combine
@testable import StockApp

enum FileName: String {
    case getStocksSuccess
    case getStocksFailure
    case getStocksEmpty
}

final class StockViewModelTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cancellables = Set<AnyCancellable>()
    }

    func test_getStocks_returns_success() async throws{
        let exp = XCTestExpectation(description: "testing getStocks success")
        let viewModel = StockViewModel(service: MockStockService(fileName: .getStocksSuccess))
        
        await viewModel.getStocks()
        
        if let s = viewModel.stockData?.stocks {
            XCTAssertTrue(s.count > 0)
        }
        
        exp.fulfill()
        
        await fulfillment(of: [exp], timeout: 5.0)
    }
    
    func test_getStocks_returns_empty_array() async throws {
        let exp = XCTestExpectation(description: "testing getStocks returns empty")
        let viewModel = StockViewModel(service: MockStockService(fileName: .getStocksEmpty))
        
        await viewModel.getStocks()
        
        if let s = viewModel.stockData?.stocks {
            XCTAssertTrue(s.count == 0)
        }
        
        exp.fulfill()
        
        await fulfillment(of: [exp], timeout: 5.0)
    }
    
    func test_getStocks_fails() async throws {
        let exp = XCTestExpectation(description: "testing getStocks fails")
        let viewModel = StockViewModel(service: MockStockService(fileName: .getStocksFailure))
        
        await viewModel.getStocks()
        
        XCTAssertNil(viewModel.stockData)
        
        exp.fulfill()
        
        await fulfillment(of: [exp], timeout: 5.0)

    }

}

class MockStockService: StockServiceProtocol {
    let fileName: FileName
    
    init(fileName: FileName) {
        self.fileName = fileName
    }
    
    private func loadMockData(_ file: String) -> URL? {
        return Bundle(for: type(of: self)).url(forResource: file, withExtension: "json")
    }
    
    func fetchStocks() async throws -> StockApp.StockResponse {
        guard let url = loadMockData(fileName.rawValue) else { throw APIError.invalidUrl}
        let data = try! Data(contentsOf: url)
        
        do {
            let result = try JSONDecoder().decode(StockResponse.self, from: data)
            return result
        } catch {
            throw APIError.decodingError
        }
    }
    
    
}
