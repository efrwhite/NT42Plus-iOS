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
                        VStack(alignment: .leading, spacing: 5) {
                            Text("First Name")
                                .font(.caption)
                                .foregroundStyle(Color("DarkBrown"))

                            TextField("John", text: $firstName)
                                .padding()
                                .background(Color("Surface"))
                                .cornerRadius(8)
                        }

                        VStack(alignment: .leading, spacing: 5) {
                            Text("Last Name")
                                .font(.caption)
                                .foregroundStyle(Color("DarkBrown"))

                            TextField("Doe", text: $lastName)
                                .padding()
                                .background(Color("Surface"))
                                .cornerRadius(8)
                        }
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Text("E-mail")
                            .font(.caption)
                            .foregroundStyle(Color("DarkBrown"))

                        TextField("Enter your email", text: $email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .padding()
                            .background(Color("Surface"))
                            .cornerRadius(8)
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Text("Password")
                            .font(.caption)
                            .foregroundStyle(Color("DarkBrown"))

                        HStack {
                            if showPassword {
                                TextField("Enter your password", text: $password)
                            } else {
                                SecureField("Enter your password", text: $password)
                            }

                            Button {
                                showPassword.toggle()
                            } label: {
                                Image(systemName: showPassword ? "eye" : "eye.slash")
                                    .foregroundStyle(Color("Taupe"))
                            }
                        }
                        .padding()
                        .background(Color("Surface"))
                        .cornerRadius(8)

                        Text("must contain 8 char.")
                            .font(.caption2)
                            .foregroundStyle(Color("Taupe"))
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Text("Confirm Password")
                            .font(.caption)
                            .foregroundStyle(Color("DarkBrown"))

                        HStack {
                            if showConfirmPassword {
                                TextField("Confirm your password", text: $confirmPassword)
                            } else {
                                SecureField("Confirm your password", text: $confirmPassword)
                            }

                            Button {
                                showConfirmPassword.toggle()
                            } label: {
                                Image(systemName: showConfirmPassword ? "eye" : "eye.slash")
                                    .foregroundStyle(Color("Taupe"))
                            }
                        }
                        .padding()
                        .background(Color("Surface"))
                        .cornerRadius(8)
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
