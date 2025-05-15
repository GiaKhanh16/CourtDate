import SwiftUI

extension Color {
	 static let color130e31 = Color(red: 19/255, green: 14/255, blue: 49/255)
	 static let color1a1353 = Color(red: 26/255, green: 19/255, blue: 83/255)
	 static let color1e1765 = Color(red: 30/255, green: 23/255, blue: 101/255)
}

struct GradientView: View {
	 var body: some View {
			LinearGradient(
				 gradient: Gradient(colors: [.color130e31, .color1a1353, .color1e1765]),
				 startPoint: .leading,
				 endPoint: .trailing
			)
			.frame(width: 300, height: 200)
			.cornerRadius(10)
	 }
}

#Preview {
	 GradientView()
}
