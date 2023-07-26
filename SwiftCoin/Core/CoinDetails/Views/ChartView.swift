//
//  ChartView.swift
//  SwiftCoin
//
//  Created by admin on 26.07.2023.
//

import Charts
import SwiftUI

struct ChartView: View {
    let viewModel: CoinDetailsViewModel

    var body: some View {
        Chart {
            ForEach(viewModel.chartData) { item in
                LineMark(x: .value("Date", item.date),
                         y: .value("Price", item.value))
                    .interpolationMethod(.cardinal)
                    .foregroundStyle(viewModel.chartLineColor)
            }
        }
        .chartXScale(domain: ClosedRange(uncheckedBounds: (viewModel.startDate, viewModel.endDate)))
        .chartXAxis {
            AxisMarks(position: .bottom, values: viewModel.xAxisValues) { value in
                AxisGridLine()
                AxisValueLabel {
                    if let dateValue = value.as(Date.self) {
                        Text(dateValue.asShortDateString())
                    }
                }
            }
        }
        .chartYScale(domain: ClosedRange(uncheckedBounds: (viewModel.minPrice, viewModel.maxPrice)))
        .chartYAxis {
            AxisMarks(position: .leading, values: viewModel.yAxisValues) { value in
                AxisGridLine()
                AxisValueLabel {
                    if let doubleValue = value.as(Double.self) {
                        Text(doubleValue.formatWithAbbreviations())
                    }
                }
            }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(viewModel: CoinDetailsViewModel(coin: dev.coin))
    }
}
