import SwiftUI

struct EducationTipsView: View {
    let articles: [EducationArticle]
    init(articles: [EducationArticle] = LocalParticipantContent().articles) { self.articles = articles }

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 14) {
                Text("Explore recipes and practical nutrition tips.")
                    .font(.subheadline).foregroundStyle(AppTheme.textSecondary)
                ForEach(articles) { article in
                    NavigationLink(value: article) {
                        ParticipantCard(symbol: article.symbol, title: article.title, detail: article.category + " · " + article.summary)
                    }.buttonStyle(.plain)
                }
            }.padding(20)
        }
        .background(AppTheme.background)
        .navigationTitle("Education & Tips")
        .navigationDestination(for: EducationArticle.self) { article in
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(article.category.uppercased()).font(.caption.bold()).foregroundStyle(AppTheme.primary)
                    Text(article.title)
                        .font(.title.bold())
                        .foregroundStyle(AppTheme.textPrimary)
                        .fixedSize(horizontal: false, vertical: true)
                    Text(article.summary).font(.title3.weight(.medium))
                    Text(article.body).foregroundStyle(AppTheme.textPrimary)
                }.frame(maxWidth: .infinity, alignment: .leading).padding(20)
            }
            .background(AppTheme.background)
            .navigationTitle(article.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview { NavigationStack { EducationTipsView() } }
