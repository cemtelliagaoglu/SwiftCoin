//
//  TopMoversItemView.swift
//  SwiftCoin
//
//  Created by admin on 25.07.2023.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {

    let coin: Coin

    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32, height: 32)
                .padding(.bottom, 8)
            HStack(spacing: 2) {
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                Text("\(coin.currentPrice?.toCurrency() ?? "1")")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Text("\(coin.priceChangePercentage.toPercentString())")
                .font(.title2)
                .foregroundColor(coin.priceChangePercentage > 0 ? .green: .red)
        }
        .frame(width: 140, height: 140)
        .background(Color("ItemBackgroundColor"))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 2)
        }
        .padding()
    }
}
