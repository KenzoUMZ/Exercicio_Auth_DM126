//
//  NavigationBar.swift
//  Exercicio_Auth_DM126
//
//  Created by Kenzo Umezawa on 07/12/25.
//

import SwiftUI

struct NavigationBar: View {
    @Binding var users: [User]
    var onAddUser: () -> Void

    var body: some View {
        HStack {
            Menu {
                ForEach(users) { user in
                    Text("\(user.nome) (\(user.email))")
                }
            } label: {
                HStack(spacing: 6) {
                    Text(users.first?.nome ?? "Sem usuários")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Image(systemName: "chevron.down")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.8))
                }
            }

            Spacer()

            // MARK: - Botão de adicionar usuário
            Button(action: onAddUser) {
                Image(systemName: "plus")
                    .imageScale(.large)
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.white.opacity(0.15))
                    .clipShape(Circle())
            }
            .accessibilityLabel("Adicionar usuário")
        }
        .padding(.horizontal)
        .frame(height: 55)
        .background(
            LinearGradient(
                colors: [Color.blue.opacity(0.9), Color.blue.opacity(0.7)],
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var users = usersMock
        var body: some View {
            NavigationBar(users: $users) {}
        }
    }
    return PreviewWrapper()
}
