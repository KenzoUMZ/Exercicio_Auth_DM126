//
//  UsersMock.swift
//  Exercicio_Auth_DM126
//
//  Created by Kenzo Umezawa on 11/12/25.
//

import Foundation

struct User: Identifiable {
    var id: Int
    var nome: String
    var email: String
}

let usersMock: [User] = [
    User(id: 1, nome: "Alice Silva", email: "alice@email.com"),
    User(id: 2, nome: "Bruno Souza", email: "bruno@email.com"),
    User(id: 3, nome: "Carlos Lima", email: "carlos@email.com")
]
