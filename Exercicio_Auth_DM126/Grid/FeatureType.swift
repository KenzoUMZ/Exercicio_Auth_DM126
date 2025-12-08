//
//  FeatureType.swift
//  Exercicio_Auth_DM126
//
//  Created by Kenzo Umezawa on 07/12/25.
//

import SwiftUI

struct FeatureType: View {
    let service: ServiceType
    var body: some View {
        VStack(spacing: 8) {
            Image(service.imagem)
                .resizable()
                .scaledToFit()
                .cornerRadius(16)
                .clipped()

            Text(service.nome)
                .font(.system(size: 16, weight: .semibold))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .minimumScaleFactor(0.8)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    FeatureType(service: ServiceType(id: 1,nome: "Exercitar", imagem: "exercicio"))
}
