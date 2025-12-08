//
//  LoginView.swift
//  Exercicio_Auth_DM126
//
//  Created by Kenzo Umezawa on 07/12/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var auth: AuthViewModel
    
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    @FocusState private var focusedField: Field?
    
    enum Field: Hashable {
        case email, password
    }
    
    private let navyBlue = Color(red: 0.05, green: 0.10, blue: 0.18)
    
    var body: some View {
        VStack(spacing: 0) {
            
            ScrollView {
                VStack(spacing: 32) {
                    
                    VStack(spacing: 8) {
                        Text("Bem-vindo")
                            .font(.largeTitle.bold())
                        Text("Entre para continuar")
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 60)
                    
                    VStack(spacing: 16) {
                        inputField(
                            title: "Email",
                            text: $email,
                            isSecure: false,
                            field: .email
                        )
                        
                        inputField(
                            title: "Senha",
                            text: $password,
                            isSecure: true,
                            field: .password
                        )
                    }
                    
                    if let message = errorMessage ?? auth.errorMessage {
                        Text(message)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding(.horizontal)
            }
            
        
            Button(action: login) {
                HStack {
                    if isLoading || auth.isLoading { ProgressView() }
                    Text("Entrar")
                        .bold()
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(navyBlue)
                .foregroundColor(.white)
                .cornerRadius(12)
                .padding(.horizontal)
                .padding(.vertical, 12)
            }
            .disabled(isLoading || auth.isLoading)
        }
        .onAppear { focusedField = .email }
    }
    
    @ViewBuilder
    private func inputField(title: String, text: Binding<String>, isSecure: Bool, field: Field) -> some View {
        Group {
            if isSecure {
                SecureField(title, text: text)
                    .textContentType(.password)
            } else {
                TextField(title, text: text)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .keyboardType(.emailAddress)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .focused($focusedField, equals: field)
        .submitLabel(field == .email ? .next : .go)
        .onSubmit {
            if field == .email {
                focusedField = .password
            } else {
                login()
            }
        }
    }
    
    private func login() {
        
        auth.email = email
        auth.password = password
        
        errorMessage = nil
        isLoading = true
        
        Task {
            await auth.login()
            isLoading = false
            
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}

