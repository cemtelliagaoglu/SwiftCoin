//
//  StatisticView.swift
//  SwiftCoin
//
//  Created by admin on 26.07.2023.
//

import SwiftUI

struct StatisticView: View {
    let model: StatisticModel

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(model.title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(model.value)
                .font(.headline)
            if let percentChange = model.percentageChange {
                HStack {
                    Image(systemName: percentChange > 0 ? "arrowtriangle.up.fill": "arrowtriangle.down.fill")
                        .font(.caption)

                    Text(percentChange.toPercentString())
                        .font(.caption)
                }
                .foregroundColor(percentChange > 0 ? .green : .red)
            }
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView(model: dev.stat3)
    }
}
