//
//  NavigationBar.swift
//  Exercicio_Auth_DM126
//
//  Created by Kenzo Umezawa on 07/12/25.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack{
            Button("Kenzo"){}.font(.headline)
                .fontWeight(.bold)
            Button(action: {} ) {
                Image(systemName: "person.badge.plus.fill")
            }
        }
    }
}

#Preview {
    NavigationBar()
}
