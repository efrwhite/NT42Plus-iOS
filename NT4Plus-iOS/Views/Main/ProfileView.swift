import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var session: DemoSession
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
            VStack(spacing: 32) {
                Text("Profile")
                    .font(.largeTitle).bold()
                    .foregroundStyle(AppTheme.textPrimary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)
                
                HStack(alignment: .top) {
                    
                    VStack(alignment: .leading, spacing: 14) {
                        Text(session.name)
                            .font(.title).bold()
                            .foregroundStyle(AppTheme.textPrimary)
                        Text("Study Progress")
                            .font(.title2).bold()
                            .foregroundStyle(AppTheme.textPrimary)
                        Text("Week 4 of 12")
                            .font(.title3)
                            .foregroundStyle(AppTheme.primary)
                        
                        ProgressView(value: 4.0 / 12.0)
                            .tint(AppTheme.primary)
                            .scaleEffect(x: 1, y: 1.5, anchor: .center)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "person.crop.circle.fill") // Replace with Image("your_asset_name") for a custom photo
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .foregroundStyle(AppTheme.textPrimary) // Only needed if using a systemImage icon
                        .clipShape(Circle())
                }
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(AppTheme.surface)
                .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            
            
            VStack(spacing: 14) {
                NavigationLink { ProfileInformationView(title: "Study Week", detail: "Week 4 of 12 is illustrative demo data, not an actual progress record.") } label: { optionRow(title: "Study Week", icon: "calendar") }
                    .buttonStyle(.plain)
                NavigationLink { ProfileInformationView(title: "Community Guidelines", detail: "Be respectful and protect other participants' privacy. This is an offline community preview.") } label: { optionRow(title: "Community Guidelines", icon: "book.closed") }
                    .buttonStyle(.plain)
                NavigationLink { ProfileInformationView(title: "Contact Study Team", detail: "Study team contact information is not connected in this mock demo.") } label: { optionRow(title: "Contact Study Team", icon: "envelope") }
                    .buttonStyle(.plain)
                NavigationLink { ProfileInformationView(title: "Settings", detail: "No settings are persisted in this mock demo.") } label: { optionRow(title: "Settings", icon: "gearshape") }
                    .buttonStyle(.plain)
                Button("Log Out", role: .destructive) { session.signOut() }
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
            }
            .padding(.horizontal, 24)
        }
        .background(AppTheme.background.ignoresSafeArea())
    }
    
    private func optionRow(title: String, icon: String) -> some View {
        ParticipantCard(symbol: icon, title: title)
    }
}

private struct ProfileInformationView: View {
    let title: String
    let detail: String
    var body: some View {
        ScrollView {
            Text(detail).frame(maxWidth: .infinity, alignment: .leading).padding()
        }
        .background(AppTheme.background)
        .navigationTitle(title)
    }
}

#Preview { NavigationStack { ProfileView() }.environmentObject(DemoSession()) }
