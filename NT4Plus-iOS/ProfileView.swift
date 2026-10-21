import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            AppTheme.background.ignoresSafeArea()

            VStack(spacing: 32) {
                Text("Profile")
                    .font(.largeTitle).bold()
                    .foregroundStyle(Color("DarkBrown"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)

                // Study Progress
                VStack(alignment: .leading, spacing: 14) {
                    Text("Study Progress")
                        .font(.title2).bold()
                        .foregroundStyle(Color("DarkBrown"))

                    Text("Week 4 of 12")
                        .font(.title3)
                        .foregroundStyle(AppTheme.primary)

                    ProgressView(value: 4.0 / 12.0)
                        .tint(AppTheme.primary)
                        .scaleEffect(x: 1, y: 1.5, anchor: .center)
                }
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("Surface"))
                .clipShape(RoundedRectangle(cornerRadius: 14))

                // Profile Options
                VStack(spacing: 16) {
                    optionButton(title: "Study Week", icon: "calendar")
                    optionButton(title: "Community Guidelines", icon: "book.closed")
                    optionButton(title: "Contact Study Team", icon: "envelope")
                    optionButton(title: "Settings", icon: "gearshape")
                }

                Spacer()
            }
            .padding(.horizontal, 24)
        }
    }

    private func optionButton(title: String, icon: String) -> some View {
        Button {
            // Action to be added later
        } label: {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundStyle(AppTheme.primary)
                    .frame(width: 28)

                Text(title)
                    .font(.title3)
                    .foregroundStyle(Color("DarkBrown"))

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.body.weight(.semibold))
                    .foregroundStyle(Color("Taupe"))
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .background(Color("Surface"))
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
    }
}

#Preview {
    ProfileView()
}
