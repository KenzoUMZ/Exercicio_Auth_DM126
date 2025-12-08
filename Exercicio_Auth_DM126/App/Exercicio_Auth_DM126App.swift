//
//  Exercicio_Auth_DM126App.swift
//  Exercicio_Auth_DM126
//
//  Created by Kenzo Umezawa on 07/12/25.
//

import SwiftUI

@main
struct Exercicio_Auth_DM126App: App {
    @StateObject private var auth = AuthViewModel()

    var body: some Scene {
        WindowGroup {
            Group {
                if auth.isAuthenticated {
                    ContentView()
                } else {
                    LoginView()
                }
            }
            .environmentObject(auth)
        }
    }
}
