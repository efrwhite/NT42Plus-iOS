import SwiftUI

struct RegistrationView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    @State private var showPassword = false
    @State private var showConfirmPassword = false

    var onSuccess: () -> Void

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
                        .foregroundStyle(Color("DarkBrown"))

                    HStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("First Name")
                                .font(.subheadline)
                                .foregroundStyle(Color("DarkBrown"))

                            TextField("John", text: $firstName)
                                .autocorrectionDisabled()
                                .inputBox()
                        }

                        VStack(alignment: .leading, spacing: 0) {
                            Text("Last Name")
                                .font(.subheadline)
                                .foregroundStyle(Color("DarkBrown"))

                            TextField("Doe", text: $lastName)
                                .autocorrectionDisabled()
                                .inputBox()
                        }
                    }

                    VStack(alignment: .leading, spacing: 0) {
                        Text("E-mail")
                            .font(.subheadline)
                            .foregroundStyle(Color("DarkBrown"))

                        TextField("Enter your email", text: $email)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled()
                            .inputBox()
                    }

                    VStack(alignment: .leading, spacing: 0) {
                        Text("Password")
                            .font(.subheadline)
                            .foregroundStyle(Color("DarkBrown"))

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
                                    .foregroundStyle(Color("Taupe"))
                            }
                        }
                        .inputBox()

                        Text("must contain 8 char.")
                            .font(.caption2)
                            .foregroundStyle(Color("Taupe"))
                            .padding(.top, 4)
                    }

                    VStack(alignment: .leading, spacing: 0) {
                        Text("Confirm Password")
                            .font(.subheadline)
                            .foregroundStyle(Color("DarkBrown"))

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
                                    .foregroundStyle(Color("Taupe"))
                            }
                        }
                        .inputBox()
                    }

                    Spacer()
                        .frame(height: 20)

                    Button("Create Account") {
                        onSuccess()
                    }
                    .buttonStyle(PrimaryButtonStyle())

                    VStack(spacing: 2) {
                        Text("By continuing, you agree to our")
                            .font(.caption)
                            .foregroundStyle(Color("Taupe"))

                        HStack(spacing: 4) {
                            Text("Terms of Service")
                                .font(.caption)
                                .foregroundStyle(AppTheme.primary)

                            Text("and")
                                .font(.caption)
                                .foregroundStyle(Color("Taupe"))

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
    RegistrationView(onSuccess: {})
}
