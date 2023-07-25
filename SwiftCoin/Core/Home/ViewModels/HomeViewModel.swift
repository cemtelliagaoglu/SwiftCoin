//
//  HomeViewModel.swift
//  SwiftCoin
//
//  Created by admin on 25.07.2023.
//

import SwiftUI

class HomeViewModel: ObservableObject, HTTPClient {

    @Published var coins = [Coin]()

    init() {
        fetchCoinData()
    }

    func fetchCoinData() {
        sendRequest(endpoint: CoinsEndpoint.all, responseModel: [Coin].self) { result in
            switch result {
            case .success(let response):
                self.coins = response
            case .failure(let error):
                print(error)
            }
        }
    }
}
