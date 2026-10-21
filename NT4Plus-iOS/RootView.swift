import SwiftUI

enum AuthRoute: Hashable {
    case login
    case register
}

struct RootView: View {
    @State private var showSplash = true
    @State private var isAuthenticated = false
    @State private var path: [AuthRoute] = []

    var body: some View {
        ZStack {
            if showSplash {
                SplashView {
                    withAnimation(.easeInOut(duration: 0.4)) {
                        showSplash = false
                    }
                }
                .transition(.opacity)
            } else if isAuthenticated {
                MainTabView()
                    .transition(.opacity)
            } else {
                NavigationStack(path: $path) {
                    WelcomeView(
                        onRegister: { path.append(.register) },
                        onLogin: { path.append(.login) }
                    )
                    .navigationDestination(for: AuthRoute.self) { route in
                        switch route {
                        case .login:
                            LoginView(onSuccess: {
                                withAnimation {
                                    isAuthenticated = true
                                    path = []
                                }
                            })
                        case .register:
                            RegistrationView(onSuccess: {
                                withAnimation {
                                    isAuthenticated = true
                                    path = []
                                }
                            })
                        }
                    }
                }
                .tint(AppTheme.primary)
                .transition(.opacity)
            }
        }
    }
}

private struct PlaceholderScreen: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.title2)
            .foregroundStyle(AppTheme.primary)
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RootView()
}
