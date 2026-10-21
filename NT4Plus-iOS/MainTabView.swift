import SwiftUI

enum AppTab: Hashable {
    case profile
    case reminders
    case community
    case tips
    case engage
}

struct MainTabView: View {
    @State private var selectedTab: AppTab = .profile

    var body: some View {
        TabView(selection: $selectedTab) {
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
                .tag(AppTab.profile)

            PlaceholderTabView(title: "Reminders", icon: "bell")
                .tabItem {
                    Label("Reminders", systemImage: "bell")
                }
                .tag(AppTab.reminders)

            PlaceholderTabView(title: "Community", icon: "person.2")
                .tabItem {
                    Label("Community", systemImage: "person.2")
                }
                .tag(AppTab.community)

            PlaceholderTabView(title: "Tips", icon: "lightbulb")
                .tabItem {
                    Label("Tips", systemImage: "lightbulb")
                }
                .tag(AppTab.tips)

            PlaceholderTabView(title: "Engage", icon: "sparkles")
                .tabItem {
                    Label("Engage", systemImage: "sparkles")
                }
                .tag(AppTab.engage)
        }
        .tint(AppTheme.primary)
    }
}

private struct PlaceholderTabView: View {
    let title: String
    let icon: String

    var body: some View {
        ZStack {
            AppTheme.background.ignoresSafeArea()

            VStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.system(size: 40))
                    .foregroundStyle(AppTheme.primary)

                Text(title)
                    .font(.title2).bold()
                    .foregroundStyle(Color("DarkBrown"))
            }
        }
    }
}

#Preview {
    MainTabView()
}
