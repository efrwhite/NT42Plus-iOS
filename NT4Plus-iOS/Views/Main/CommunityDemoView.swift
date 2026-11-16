import SwiftUI

struct CommunityDemoView: View {
    @State private var messages = ["Welcome to the community preview.", "Share your favorite easy meal idea!"]
    @State private var draft = ""
    @FocusState private var isInputFocused: Bool

    var body: some View {
        VStack(spacing: 0) {
            List(messages.indices, id: \.self) { index in
                Text(messages[index]).foregroundStyle(AppTheme.textPrimary)
            }
            .scrollDismissesKeyboard(.interactively)
            HStack {
                TextField("Type a demo message", text: $draft)
                    .focused($isInputFocused)
                    .submitLabel(.done)
                    .onSubmit {
                        isInputFocused = false
                    }
                    .inputBox()
                Button {
                    let value = draft.trimmingCharacters(in: .whitespacesAndNewlines)
                    guard !value.isEmpty else { return }
                    messages.append(value)
                    draft = ""
                } label: { Image(systemName: "paperplane.fill") }
                .disabled(draft.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                .accessibilityLabel("Send demo message")
            }.padding(.horizontal)
            Text("Offline preview: messages stay on this screen and are not sent to other people.")
                .font(.caption).foregroundStyle(AppTheme.textSecondary).padding()
        }
        .background(AppTheme.background)
        .navigationTitle("Community")

    }
}

#Preview { NavigationStack { CommunityDemoView() } }
