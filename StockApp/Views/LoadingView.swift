//
//  LoadingView.swift
//  StockApp
//
//  Created by Joshua Ho on 7/12/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        List(["Loading stock data..."], id: \.self) { message in
            Text(message)
        }
        .scrollContentBackground(.hidden)
        .background(LinearGradient(colors: [.mint, .teal, .cyan, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
