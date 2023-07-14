//
//  ContentView.swift
//  StockApp
//
//  Created by Joshua Ho on 7/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = StockViewModel(service: StockService())
    
    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.status {
                case .initial, .loading:
                    LoadingView()
                case .loaded:
                    if let stockData = viewModel.stockData {
                        if stockData.stocks.count == 0 {
                            EmptyFileView()
                        }else  {
                            StockListView(stockData: stockData)
                        }
                    }
                case .error:
                    ErrorView()
                }
            }
            .navigationTitle("Stock Portfolio")
        }
        .onAppear {
            viewModel.getStocks()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
