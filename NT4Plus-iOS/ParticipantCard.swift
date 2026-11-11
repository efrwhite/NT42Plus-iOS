import SwiftUI

struct ParticipantCard: View {
    let symbol: String
    let title: String
    let detail: String

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: symbol)
                .font(.title3)
                .foregroundStyle(AppTheme.primary)
                .frame(width: 42, height: 42)
                .background(AppTheme.accent.opacity(0.18), in: RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 5) {
                Text(title).font(.headline).foregroundStyle(AppTheme.textPrimary)
                Text(detail).font(.subheadline).foregroundStyle(AppTheme.textSecondary)
            }
            Spacer(minLength: 4)
            Image(systemName: "chevron.right")
                .foregroundStyle(AppTheme.textSecondary)
        }
        .padding(16)
        .background(AppTheme.surface, in: RoundedRectangle(cornerRadius: 18))
    }
}
