import SwiftUI

// App-Theme
enum AppTheme {
    // Maiin Colors
    static let primary = Color("Wine")
    static let accent = Color("Rose")
    static let gold = Color("Gold")

    // Semantic Colors  - Colors adapt to light or dark - check assets to see color pair
    static let background = Color("Cream")
    static let surface = Color("Surface")
    static let textPrimary = Color("DarkBrown")
    static let textSecondary = Color("Taupe")
    static let border = Color("Taupe").opacity(0.3)
}

// Input-Box
extension View {
    func inputBox() -> some View {
        self
            .padding()
            .background(AppTheme.surface)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(AppTheme.border))
            .padding(.top, 6)
    }
}

// Primary-Button
struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(AppTheme.primary)
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            .opacity(configuration.isPressed ? 0.85 : 1)
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

// Secondary-Button
struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundStyle(AppTheme.primary)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .contentShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .stroke(AppTheme.primary, lineWidth: 2)
            )
            .opacity(configuration.isPressed ? 0.7 : 1)
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}
