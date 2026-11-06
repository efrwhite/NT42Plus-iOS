import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var showForgotPassword = false
    var onSuccess: () -> Void

    var body: some View {
        ZStack {
            AppTheme.background.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 0) {
                Spacer()

                Text("Login")
                    .font(.largeTitle).bold()
                    .foregroundStyle(AppTheme.textPrimary)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 40)

                Text("E-mail")
                    .font(.subheadline)
                    .foregroundStyle(AppTheme.textPrimary)
                TextField("Enter your email", text: $email)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .inputBox()
                    .padding(.bottom, 16)

                Text("Password")
                    .font(.subheadline)
                    .foregroundStyle(AppTheme.textPrimary)
                HStack {
                    Group {
                        if showPassword {
                            TextField("Enter your password", text: $password)
                        } else {
                            SecureField("Enter your password", text: $password)
                        }
                    }
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()

                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye" : "eye.slash")
                            .foregroundStyle(AppTheme.textSecondary)
                    }
                }
                .inputBox()

                Button {
                    showForgotPassword = true
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .underline()
                        .foregroundStyle(AppTheme.primary)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.top, 12)
                }

                Button("Login") {
                    onSuccess()
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding(.top, 36)

                HStack(spacing: 8) {
                    Rectangle().frame(height: 1)
                    Text("Or")
                    Rectangle().frame(height: 1)
                }
                .foregroundStyle(AppTheme.textSecondary)
                .padding(.vertical, 28)

                VStack(spacing: 14) {
                    socialButton("Continue with Apple", icon: Image(systemName: "apple.logo"))
                    // Add logos later
                    socialButton("Continue with Google", icon: Image("GoogleLogo"))
                    socialButton("Continue with Facebook", icon: Image("FacebookLogo"))
                }

                Spacer()
            }
            .padding(.horizontal, 28)
        }
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showForgotPassword) {
            ForgotPasswordView(onSuccess: { showForgotPassword = false })
        }
    }

    private func socialButton(_ title: String, icon: Image) -> some View {
        Button {} label: {
            HStack(spacing: 10) {
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                Text(title)
            }
            .foregroundStyle(AppTheme.textPrimary)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .overlay(Capsule().stroke(AppTheme.primary, lineWidth: 1))
        }
    }
}

#Preview {
    LoginView(onSuccess: {})
}
