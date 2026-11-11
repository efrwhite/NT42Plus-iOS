import SwiftUI

struct EngagementDemoView: View {
    @State private var triviaAnswer: Int? = nil
    @State private var surveyAnswer: String? = nil
    @State private var submitted = false
    let choices = ["Whole grains", "Sugary drinks", "Candy"]
    let surveyChoices = ["Very confident", "Somewhat confident", "Not yet confident"]

    var body: some View {
        Form {
            Section("Nutrition Trivia") {
                Text("Which option is generally a source of dietary fiber?").font(.headline)
                ForEach(choices.indices, id: \.self) { index in
                    Button {
                        triviaAnswer = index
                    } label: {
                        HStack {
                            Text(choices[index]).foregroundStyle(AppTheme.textPrimary)
                            Spacer()
                            if triviaAnswer == index { Image(systemName: "checkmark.circle.fill") }
                        }
                    }
                }
                if let triviaAnswer = triviaAnswer {
                    Text(triviaAnswer == 0 ? "Correct! Whole grains can provide fiber." : "Try again — whole grains are a source of fiber.")
                        .foregroundStyle(AppTheme.textPrimary)
                }
            }
            Section("Weekly Survey · Sample") {
                Text("How confident do you feel planning meals this week?")
                ForEach(surveyChoices, id: \.self) { choice in
                    Button {
                        surveyAnswer = choice
                        submitted = false
                    } label: {
                        HStack {
                            Text(choice).foregroundStyle(AppTheme.textPrimary)
                            Spacer()
                            if surveyAnswer == choice { Image(systemName: "checkmark.circle.fill") }
                        }
                    }
                }
                Button("Submit Sample Response") { submitted = true }
                    .disabled(surveyAnswer == nil)
                if submitted { Text("Saved for this screen only — not sent to the study team.") }
            }
            Section { Text("Mock interactions only. No responses are stored in a database.").font(.footnote) }
        }
        .navigationTitle("Engage")
    }
}

#Preview { NavigationStack { EngagementDemoView() } }
