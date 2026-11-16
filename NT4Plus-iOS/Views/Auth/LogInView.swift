import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var showForgotPassword = false
    @State private var validationError = ""
    var onSuccess: (String) -> Void

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

                if !validationError.isEmpty {
                    Text(validationError).font(.footnote).foregroundStyle(.red)
                        .accessibilityIdentifier("loginValidation")
                }
                Button("Login") {
                    guard DemoSession.validEmail(email) else {
                        validationError = "Enter a valid email address."
                        return
                    }
                    guard password.count >= 8 else {
                        validationError = "Enter a password of at least 8 characters."
                        return
                    }
                    validationError = ""
                    onSuccess(email)
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding(.top, 36)

                Text("Demo only: any valid email and password of 8+ characters opens the app. No real login or third-party sign-in is connected.")
                    .font(.footnote)
                    .foregroundStyle(AppTheme.textSecondary)
                    .padding(.top, 24)

                Spacer()
            }
            .padding(.horizontal, 28)
        }
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showForgotPassword) {
            ForgotPasswordView(onSuccess: { showForgotPassword = false })
        }
    }

}

#Preview { LoginView(onSuccess: { _ in }) }
