//
//  ContentView.swift
//  Exercicio_Auth_DM126
//
//  Created by Kenzo Umezawa on 07/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            NavigationBar()
            FeaturesGrid()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

