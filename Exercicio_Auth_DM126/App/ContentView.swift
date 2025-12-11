import SwiftUI

struct ContentView: View {
    @State private var users: [User] = usersMock
    @State private var showingAddUser = false

    var body: some View {
        VStack(spacing: 16) {
            FeaturesGrid()
            Spacer()
            NavigationBar(users: $users) {
                showingAddUser = true
            }
        }
        .padding()
        .sheet(isPresented: $showingAddUser) {
            AddUserView { newUser in
                users.append(newUser)
            }
        }
    }
}

#Preview {
    ContentView()
}
