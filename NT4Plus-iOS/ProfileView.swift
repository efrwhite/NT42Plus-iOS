import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 32) {
            VStack(spacing: 32) {
                Text("Profile")
                    .font(.largeTitle).bold()
                    .foregroundStyle(Color("DarkBrown"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)
                
                HStack(alignment: .top) {
                    
                    VStack(alignment: .leading, spacing: 14) {
                        Text("John Doe")
                            .font(.title).bold()
                            .foregroundStyle(Color("DarkBrown"))
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
                    
                    Spacer()
                    
                    Image(systemName: "person.crop.circle.fill") // Replace with Image("your_asset_name") for a custom photo
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .foregroundStyle(Color("DarkBrown")) // Only needed if using a systemImage icon
                        .clipShape(Circle())
                }
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("Surface"))
                .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            
            
            VStack(spacing: 16) {
                optionButton(title: "Study Week", icon: "calendar")
                optionButton(title: "Community Guidelines", icon: "book.closed")
                optionButton(title: "Contact Study Team", icon: "envelope")
                optionButton(title: "Settings", icon: "gearshape")
            }
            
            Spacer()
        }
        .padding(.horizontal, 24)
        .background(AppTheme.background.ignoresSafeArea())
    }
    
    private func optionButton(title: String, icon: String) -> some View {
        Button {
            // Add Action
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
