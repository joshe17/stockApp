//
//  ErrorView.swift
//  StockApp
//
//  Created by Joshua Ho on 7/12/23.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        VStack {
            Text("Error fetching stock data. Please try again later.")
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, maxHeight: 100)
                .background(Color.white)
                .cornerRadius(15)
                .padding()
        }
        .frame(maxHeight: .infinity)
        .background(LinearGradient(colors: [.mint, .teal, .cyan, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)).ignoresSafeArea(.all)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
