import SwiftUI

struct StudyRemindersView: View {
    let reminders: [StudyReminder]
    init(reminders: [StudyReminder] = LocalParticipantContent().reminders) { self.reminders = reminders }

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 14) {
                Text("Stay on track with your study activities. Dates shown are sample data.")
                    .font(.subheadline).foregroundStyle(AppTheme.textSecondary)
                ForEach(reminders) { reminder in
                    NavigationLink(value: reminder) {
                        ParticipantCard(symbol: reminder.symbol, title: reminder.title, detail: reminder.schedule)
                    }.buttonStyle(.plain)
                }
            }.padding(20)
        }
        .background(AppTheme.background)
        .navigationTitle("Study Reminders")
        .navigationDestination(for: StudyReminder.self) { reminder in
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Label(reminder.schedule, systemImage: "clock")
                        .font(.headline).foregroundStyle(AppTheme.primary)
                    Text(reminder.subtitle).font(.title3.weight(.semibold))
                    Text(reminder.details).foregroundStyle(AppTheme.textSecondary)
                    Text("Preview only — scheduling and push notifications are not enabled.")
                        .font(.footnote).foregroundStyle(AppTheme.textSecondary)
                }.frame(maxWidth: .infinity, alignment: .leading).padding(20)
            }
            .background(AppTheme.background)
            .navigationTitle(reminder.title)
        }
    }
}

#Preview { NavigationStack { StudyRemindersView() } }
