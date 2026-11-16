import SwiftUI

enum AuthRoute: Hashable { case login, register }

struct RootView: View {
    @StateObject private var session = DemoSession()
    @State private var showSplash = true
    @State private var path: [AuthRoute] = []

    var body: some View {
        Group {
            if showSplash {
                SplashView { showSplash = false }
            } else if session.isAuthenticated {
                MainTabView()
            } else {
                NavigationStack(path: $path) {
                    WelcomeView(onRegister: { path.append(.register) }, onLogin: { path.append(.login) })
                        .navigationDestination(for: AuthRoute.self) { route in
                            switch route {
                            case .login:
                                LoginView(onSuccess: { email in
                                    session.signIn(email: email)
                                    path = []
                                })
                            case .register:
                                RegistrationView(onSuccess: { first, last, email in
                                    session.signIn(email: email, name: first + " " + last)
                                    path = []
                                })
                            }
                        }
                }
                .tint(AppTheme.primary)
            }
        }
        .environmentObject(session)
    }
}

#Preview { RootView() }
