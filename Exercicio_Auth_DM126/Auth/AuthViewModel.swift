//
//  AuthViewModel.swift
//  Exercicio_Auth_DM126
//
//  Created by Kenzo Umezawa on 07/12/25.
//

import Foundation
import Combine

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func login() async {
        errorMessage = nil
        isLoading = true
        defer { isLoading = false }

        // Simula uma validação local (fake). Ajuste conforme necessário.
        try? await Task.sleep(nanoseconds: 600_000_000) // 0.6s

        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Preencha email e senha."
            return
        }

        // Validação simples: qualquer email com "@" e senha >= 4 caracteres
        guard email.contains("@"), password.count >= 4 else {
            errorMessage = "Credenciais inválidas."
            return
        }

        isAuthenticated = true
    }

    func logout() {
        isAuthenticated = false
        email = ""
        password = ""
        errorMessage = nil
    }
}
