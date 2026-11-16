import SwiftUI

struct RegistrationView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    @State private var showPassword = false
    @State private var showConfirmPassword = false

    @State private var validationError = ""
    var onSuccess: (String, String, String) -> Void

    var body: some View {
        ZStack {
            AppTheme.background
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 18) {

                    Spacer()
                        .frame(height: 60)

                    Text("Register")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(AppTheme.textPrimary)

                    HStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("First Name")
                                .font(.subheadline)
                                .foregroundStyle(AppTheme.textPrimary)

                            TextField("John", text: $firstName)
                                .autocorrectionDisabled()
                                .inputBox()
                        }

                        VStack(alignment: .leading, spacing: 0) {
                            Text("Last Name")
                                .font(.subheadline)
                                .foregroundStyle(AppTheme.textPrimary)

                            TextField("Doe", text: $lastName)
                                .autocorrectionDisabled()
                                .inputBox()
                        }
                    }

                    VStack(alignment: .leading, spacing: 0) {
                        Text("E-mail")
                            .font(.subheadline)
                            .foregroundStyle(AppTheme.textPrimary)

                        TextField("Enter your email", text: $email)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled()
                            .inputBox()
                    }

                    VStack(alignment: .leading, spacing: 0) {
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

                        Text("must contain 8 char.")
                            .font(.caption2)
                            .foregroundStyle(AppTheme.textSecondary)
                            .padding(.top, 4)
                    }

                    VStack(alignment: .leading, spacing: 0) {
                        Text("Confirm Password")
                            .font(.subheadline)
                            .foregroundStyle(AppTheme.textPrimary)

                        HStack {
                            Group {
                                if showConfirmPassword {
                                    TextField("Confirm your password", text: $confirmPassword)
                                } else {
                                    SecureField("Confirm your password", text: $confirmPassword)
                                }
                            }
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()

                            Button {
                                showConfirmPassword.toggle()
                            } label: {
                                Image(systemName: showConfirmPassword ? "eye" : "eye.slash")
                                    .foregroundStyle(AppTheme.textSecondary)
                            }
                        }
                        .inputBox()
                    }

                    Spacer()
                        .frame(height: 20)

                    if !validationError.isEmpty {
                        Text(validationError).font(.footnote).foregroundStyle(.red)
                    }
                    Button("Create Account") {
                        let first = firstName.trimmingCharacters(in: .whitespacesAndNewlines)
                        let last = lastName.trimmingCharacters(in: .whitespacesAndNewlines)
                        guard !first.isEmpty && !last.isEmpty else {
                            validationError = "Enter first and last name."
                            return
                        }
                        guard DemoSession.validEmail(email) else {
                            validationError = "Enter a valid email address."
                            return
                        }
                        guard password.count >= 8 else {
                            validationError = "Password must be at least 8 characters."
                            return
                        }
                        guard password == confirmPassword else {
                            validationError = "Passwords do not match."
                            return
                        }
                        validationError = ""
                        onSuccess(first, last, email)
                    }
                    .buttonStyle(PrimaryButtonStyle())

                    VStack(spacing: 2) {
                        Text("Demo only: no real account is created or stored.")
                            .font(.caption).foregroundStyle(AppTheme.textSecondary)
                        Text("By continuing, you agree to our")
                            .font(.caption)
                            .foregroundStyle(AppTheme.textSecondary)

                        HStack(spacing: 4) {
                            Text("Terms of Service")
                                .font(.caption)
                                .foregroundStyle(AppTheme.primary)

                            Text("and")
                                .font(.caption)
                                .foregroundStyle(AppTheme.textSecondary)

                            Text("Privacy Policy.")
                                .font(.caption)
                                .foregroundStyle(AppTheme.primary)
                        }
                    }
                    .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 32)
            }
        }
    }
}

#Preview {
    RegistrationView(onSuccess: { _, _, _ in })
}
