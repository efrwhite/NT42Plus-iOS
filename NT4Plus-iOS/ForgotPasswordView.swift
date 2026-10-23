import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var email = ""
    @State private var messageSent = false

    var onSuccess: () -> Void

    var body: some View {
        ZStack {
            AppTheme.background
                .ignoresSafeArea()

            VStack(spacing: 20) {

                Spacer()

                Text("Forgot Password")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(AppTheme.textPrimary)

                Text("Enter your email address and we'll send you a reset link.")
                    .font(.subheadline)
                    .foregroundStyle(AppTheme.textSecondary)
                    .multilineTextAlignment(.center)

                VStack(alignment: .leading, spacing: 5) {
                    Text("E-mail")
                        .font(.caption)
                        .foregroundStyle(AppTheme.textPrimary)

                    TextField("Enter your email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .inputBox()
                }

                Button("Send Reset Link") {
                    messageSent = true
                }
                .buttonStyle(PrimaryButtonStyle())

                if messageSent {
                    Text("Reset link sent! Please check your email.")
                        .font(.subheadline)
                        .foregroundStyle(AppTheme.gold)
                        .multilineTextAlignment(.center)
                }

                Button {
                    dismiss()
                } label: {
                    Text("Back to Login")
                        .font(.subheadline)
                        .underline()
                        .foregroundStyle(AppTheme.primary)
                }

                Spacer()
            }
            .padding(.horizontal, 32)
        }
    }
}

#Preview {
    ForgotPasswordView(onSuccess: {})
}
