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

    init() {
        fetchCoinData()
    }

    func fetchCoinData() {
        sendRequest(endpoint: CoinsEndpoint.all, responseModel: [Coin].self) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.coins = response
                    self.configureTopMovingCoins()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func configureTopMovingCoins() {
        let topMovers = coins.sorted(by: { $0.priceChangePercentage > $1.priceChangePercentage })
        self.topMovingCoins = Array(topMovers.prefix(10))
    }
}
