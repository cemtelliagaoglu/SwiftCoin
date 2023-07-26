//
//  CoinDetailsView.swift
//  SwiftCoin
//
//  Created by admin on 26.07.2023.
//

import SwiftUI

struct CoinDetailsView: View {
    let viewModel: CoinDetailsViewModel

    init(coin: Coin) {
        viewModel = CoinDetailsViewModel(coin: coin)
    }

    var body: some View {
        NavigationView {
            ScrollView {
//                 overView
                CoinDetailsSection(model: viewModel.overviewSectionModel)
                    .padding(.vertical)
//                 additionalDetails
                CoinDetailsSection(model: viewModel.additionalDetailsSectionModel)
                    .padding(.vertical)
            }
            .padding()
            .navigationTitle(viewModel.coinName)
        }
    }
}

struct CoinDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsView(coin: dev.coin)
    }
}
