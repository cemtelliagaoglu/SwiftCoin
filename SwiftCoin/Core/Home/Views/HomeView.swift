//
//  HomeView.swift
//  SwiftCoin
//
//  Created by admin on 25.07.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    TopMoversView(viewModel: viewModel)
                    Divider()
                    AllCoinsView(viewModel: viewModel)
                }
                if viewModel.isLoadingData {
                    CustomLoadingIndicator()
                }
            }
            .navigationTitle("Live Prices")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
