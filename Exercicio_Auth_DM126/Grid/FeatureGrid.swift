//
//  Features_Grid.swift
//  Exercicio_Auth_DM126
//
//  Created by Kenzo Umezawa on 07/12/25.
//

import SwiftUI

struct FeaturesGrid: View {

    private let rows = [
        GridItem(.fixed(100), spacing: 12),
        GridItem(.fixed(100), spacing: 12)
    ]

    private let itemWidth: CGFloat = 120

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 12) {
                ForEach(servicesMock) { service in
                    FeatureType(service: service)
                        .frame(width: itemWidth)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
        .frame(height: 240)
    }
}

#Preview {
    FeaturesGrid()
}
