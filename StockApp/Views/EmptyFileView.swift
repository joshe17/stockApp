//
//  EmptyFileView.swift
//  StockApp
//
//  Created by Joshua Ho on 7/12/23.
//

import SwiftUI

struct EmptyFileView: View {
    var body: some View {
        VStack {
            Text("No stock data is available at this time.")
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

struct EmptyFileView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyFileView()
    }
}
