import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var email = ""
    @State private var messageSent = false
    @State private var validationError = ""

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

                Text("Enter your email to preview a password reset request.")
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

                Button("Preview Reset Request") {
                    guard DemoSession.validEmail(email) else {
                        validationError = "Enter a valid email address."
                        messageSent = false
                        return
                    }
                    validationError = ""
                    messageSent = true
                }
                .buttonStyle(PrimaryButtonStyle())

                if !validationError.isEmpty {
                    Text(validationError).font(.footnote).foregroundStyle(.red)
                }
                if messageSent {
                    Text("Demo confirmation only — no reset email was sent.")
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
