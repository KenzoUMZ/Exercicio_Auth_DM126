//
//  LoginView.swift
//  Exercicio_Auth_DM126
//
//  Created by Kenzo Umezawa on 07/12/25.
//

import SwiftUI

struct SimpleLoginView: View {
    let onLogin: () -> Void

    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 8) {
                Text("Bem-vindo")
                    .font(.largeTitle).bold()
                Text("Entre para continuar")
                    .foregroundColor(.secondary)
            }

            VStack(spacing: 16) {
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                SecureField("Senha", text: $password)
                    .textContentType(.password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
            }

            Button {
                onLogin()
            } label: {
                Text("Entrar")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    SimpleLoginView(onLogin: {})
}
