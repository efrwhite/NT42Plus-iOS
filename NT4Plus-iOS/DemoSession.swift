import Foundation
import Combine

// In-memory state; this is not a real authentication implementation.
final class DemoSession: ObservableObject {
    @Published var isAuthenticated = false
    @Published var name = "Demo Participant"
    @Published var email = ""

    static func validEmail(_ text: String) -> Bool {
        let value = text.trimmingCharacters(in: .whitespacesAndNewlines)
        let parts = value.split(separator: "@")
        return parts.count == 2 && parts[1].contains(".") && !value.contains(" ")
    }

    func signIn(email value: String, name displayName: String = "Demo Participant") {
        email = value.trimmingCharacters(in: .whitespacesAndNewlines)
        name = displayName
        isAuthenticated = true
    }

    func signOut() {
        email = ""
        name = "Demo Participant"
        isAuthenticated = false
    }
}
