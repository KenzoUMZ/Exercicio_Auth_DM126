//
//  AddUserView.swift
//  Exercicio_Auth_DM126
//
//  Created by Kenzo Umezawa on 11/12/25.
//

import SwiftUI

struct AddUserView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var nome: String = ""
    @State private var email: String = ""

    var onAdd: (User) -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Informações do usuário")) {
                    TextField("Nome", text: $nome)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                }

                Section {
                    Button("Adicionar usuário") {
                        addUser()
                    }
                    .disabled(nome.isEmpty || email.isEmpty)
                }
            }
            .navigationTitle("Novo Usuário")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
            }
        }
    }

    private func addUser() {
        let newId = Int.random(in: 1000...999999)

        let user = User(
            id: newId,
            nome: nome,
            email: email
        )

        onAdd(user)
        dismiss()
    }
}

#Preview {
    AddUserView { user in
        print("Usuário adicionado:", user)
    }
}
