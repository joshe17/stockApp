//
//  StockListView.swift
//  StockApp
//
//  Created by Joshua Ho on 7/11/23.
//

import SwiftUI

struct StockListView: View {
    let stockData: StockResponse
    
    var body: some View {
        List {
            Section {
                ForEach(stockData.ownedStocksArray, id: \.self)  { stock in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(stock.ticker)
                                .font(.title).bold()
                            Text(stock.name)
                                .font(.system(size: 14))
                                .padding(.bottom)
                            Text("Last updated \(stock.convertTimestampToDate())")
                                .font(.system(size: 12))
                        }
                        Spacer()
                        VStack {
                            Text("$\(stock.convertCentsToDollars()) \(stock.currency)")
                                .padding()
                            Text(stock.displayNumberOfShares())
                                .font(.title2).bold()
                                .foregroundColor(.green)
                                .padding()
                        }
                    }
                }
            } header: {
                Text("Current Shares")
                    .bold()
                    .foregroundColor(.white)
            }
            
            
            Section {
                ForEach(stockData.unownedStocksArray, id: \.self)  { stock in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(stock.ticker)
                                .font(.title).bold()
                            Text(stock.name)
                                .font(.system(size: 14))
                                .padding(.bottom)
                            Text("Last updated \(stock.convertTimestampToDate())")
                                .font(.system(size: 12))
                        }
                        Spacer()
                        VStack {
                            Text("$\(stock.convertCentsToDollars()) \(stock.currency)")
                                .padding()
                            Text(stock.displayNumberOfShares())
                                .font(.title2).bold()
                                .padding()
                        }
                    }
                }
            } header: {
                Text("Watched Stock")
                    .bold()
                    .foregroundColor(.white)
            }
           
        }
        .scrollContentBackground(.hidden)
        .background(LinearGradient(colors: [.mint, .teal, .cyan, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
        
    }
}

//struct StockListView_Previews: PreviewProvider {
//    static var previews: some View {
//        StockListView()
//    }
//}
