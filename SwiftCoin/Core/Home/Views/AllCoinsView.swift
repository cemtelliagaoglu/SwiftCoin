//
//  AllCoinsView.swift
//  SwiftCoin
//
//  Created by admin on 25.07.2023.
//

import SwiftUI

struct AllCoinsView: View {

    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins")
                .font(.headline)
                .padding()

            HStack {
                Text("Coin")
                Spacer()
                Text("Price")
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)

            ScrollView(.vertical) {
                ForEach(viewModel.coins) { coin in
                    HStack(alignment: .center) {
                        CoinRowView(coin: coin)
                    }
                }
            }
        }
    }
}
