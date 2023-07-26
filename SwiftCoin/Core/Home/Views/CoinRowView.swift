//
//  CoinRowView.swift
//  SwiftCoin
//
//  Created by admin on 25.07.2023.
//

import Kingfisher
import SwiftUI

struct CoinRowView: View {
    let coin: Coin

    var body: some View {
        HStack(alignment: .center) {
            Text("\(coin.marketRank ?? 1)")
                .font(.caption)
                .foregroundColor(.gray)

            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)

                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .foregroundColor(Color.theme.primaryTextColor)
            .padding(.leading, 2)

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                Text(String(coin.currentPrice.toCurrency()))
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                    .foregroundColor(Color.theme.primaryTextColor)
                Text(String(coin.priceChangePercentage.toPercentString()))
                    .font(.caption)
                    .foregroundColor(coin.priceChangePercentage > 0 ? .green : .red)
                    .padding(.leading, 6)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}
