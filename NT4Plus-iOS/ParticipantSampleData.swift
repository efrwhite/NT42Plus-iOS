import Foundation

struct StudyReminder: Identifiable, Hashable {
    let id: String
    let title: String
    let subtitle: String
    let schedule: String
    let symbol: String
    let details: String
}

struct EducationArticle: Identifiable, Hashable {
    let id: String
    let title: String
    let category: String
    let summary: String
    let symbol: String
    let body: String
}

protocol ParticipantContentProviding {
    var reminders: [StudyReminder] { get }
    var articles: [EducationArticle] { get }
}

struct LocalParticipantContent: ParticipantContentProviding {
    let reminders: [StudyReminder] = [
        .init(id: "survey", title: "Weekly Survey", subtitle: "Check in about your week", schedule: "Every Monday (sample)", symbol: "checklist", details: "Your weekly survey helps the study team learn about your experiences. This is a sample reminder; submissions are not connected yet."),
        .init(id: "cooking", title: "Cooking Class", subtitle: "Practice preparing balanced meals", schedule: "Wednesday · 5:00 PM (sample)", symbol: "fork.knife", details: "Learn practical meal-preparation skills. The schedule and location shown here are placeholders."),
        .init(id: "appointment", title: "Study Appointment", subtitle: "Meet with the study team", schedule: "Friday · 10:00 AM (sample)", symbol: "calendar", details: "This is a sample appointment, not a confirmed time or location."),
        .init(id: "delivery", title: "Meal Delivery", subtitle: "Check an upcoming study meal", schedule: "Saturday · Noon (sample)", symbol: "shippingbox", details: "The delivery timing is illustrative and not an actual scheduled delivery."),
        .init(id: "event", title: "Study Event", subtitle: "Community nutrition activity", schedule: "Sunday · 2:00 PM (sample)", symbol: "person.2", details: "This sample event does not contain an active registration or location.")
    ]

    let articles: [EducationArticle] = [
        .init(id: "recipe", title: "Simple Veggie Pasta", category: "Recipes", summary: "An easy meal with vegetables and whole grains", symbol: "book.closed", body: "Ingredients: whole-grain pasta, zucchini, tomatoes, olive oil, garlic, and your choice of protein.\n\n1. Cook pasta according to the package.\n2. Sauté vegetables.\n3. Add garlic and cooked protein.\n4. Toss together and serve.\n\nIllustrative recipe only."),
        .init(id: "cooking", title: "Make Meal Prep Easier", category: "Cooking Tips", summary: "Small steps to save time", symbol: "frying.pan", body: "Wash and chop produce ahead of time. Prepare one versatile grain or protein for multiple meals. Refrigerate leftovers promptly and reheat thoroughly."),
        .init(id: "grocery", title: "Shopping With a Plan", category: "Grocery Tips", summary: "Build a useful list before shopping", symbol: "basket", body: "Check what you have at home. Plan meals and organize a shopping list by produce, proteins, grains, and pantry staples."),
        .init(id: "education", title: "Building a Balanced Plate", category: "Education", summary: "Explore different food groups", symbol: "leaf", body: "Varied eating patterns can include vegetables, fruits, whole grains, protein foods, and healthy fats. Ask your study team for individualized guidance.")
    ]
}
