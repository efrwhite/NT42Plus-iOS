import SwiftUI

enum AppTab: Hashable { case profile, reminders, community, tips, engage }

struct MainTabView: View {
    @State private var selectedTab: AppTab = .profile

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack { ProfileView() }
                .tabItem { Label("Profile", systemImage: "person.crop.circle") }
                .tag(AppTab.profile)
            NavigationStack { StudyRemindersView() }
                .tabItem { Label("Reminders", systemImage: "bell") }
                .tag(AppTab.reminders)
            NavigationStack { CommunityDemoView() }
                .tabItem { Label("Community", systemImage: "person.2") }
                .tag(AppTab.community)
            NavigationStack { EducationTipsView() }
                .tabItem { Label("Tips", systemImage: "lightbulb") }
                .tag(AppTab.tips)
            NavigationStack { EngagementDemoView() }
                .tabItem { Label("Engage", systemImage: "sparkles") }
                .tag(AppTab.engage)
        }
        .tint(AppTheme.primary)
    }
}

#Preview { MainTabView().environmentObject(DemoSession()) }
