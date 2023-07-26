//
//  LazyNavigationView.swift
//  SwiftCoin
//
//  Created by admin on 26.07.2023.
//

import SwiftUI

struct LazyNavigationView<Content: View>: View {
    let build: () -> Content

    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }

    var body: Content {
        build()
    }
}
