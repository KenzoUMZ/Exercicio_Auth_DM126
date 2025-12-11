//
//  UsersView.swift
//  Exercicio_Auth_DM126
//
//  Created by Kenzo Umezawa on 11/12/25.
//

import SwiftUI

struct UsersView: View {
    @State private var users: [User] = usersMock
    @State private var showingAddUser = false

    var body: some View {
        VStack(spacing: 0) {

            NavigationBar(users: $users) {
                showingAddUser = true
            }

            List(users) { user in
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.nome)
                        .font(.headline)

                    Text(user.email)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .sheet(isPresented: $showingAddUser) {
            AddUserView { newUser in
                users.append(newUser)
            }
        }
    }
}

#Preview {
    UsersView()
}
