//
//  HomeViewModel.swift
//  SwiftCoin
//
//  Created by admin on 25.07.2023.
//

import SwiftUI

class HomeViewModel: ObservableObject, HTTPClient {
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    @Published var isLoadingData = true

    init() {
        fetchCoinData()
    }

    func fetchCoinData() {
        sendRequest(endpoint: CoinsEndpoint.all, responseModel: [Coin].self) { result in
            switch result {
            case let .success(response):
                DispatchQueue.main.async {
                    self.coins = response
                    self.configureTopMovingCoins()
                    self.isLoadingData = false
                }
            case let .failure(error):
                DispatchQueue.main.async {
                    print(error)
                    self.isLoadingData = false
                }
            }
        }
    }

    func configureTopMovingCoins() {
        let topMovers = coins.sorted(by: { $0.priceChangePercentage > $1.priceChangePercentage })
        topMovingCoins = Array(topMovers.prefix(10))
    }
}
