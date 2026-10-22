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

            Color.clear
                .tabItem {
                    Label("Reminders", systemImage: "bell")
                }
                .tag(AppTab.reminders)

            Color.clear
                .tabItem {
                    Label("Community", systemImage: "person.2")
                }
                .tag(AppTab.community)

            Color.clear
                .tabItem {
                    Label("Tips", systemImage: "lightbulb")
                }
                .tag(AppTab.tips)

            Color.clear
                .tabItem {
                    Label("Engage", systemImage: "sparkles")
                }
                .tag(AppTab.engage)
        }
        .tint(AppTheme.primary)
    }
}

#Preview {
    MainTabView()
}
