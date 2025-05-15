import SwiftUI

struct players: View {
	 var body: some View {
			ScrollView { // Move ScrollView to the parent view
				 VStack(spacing: 0) { // Set spacing to 0 for tight stacking
						ForEach(1..<20) { _ in
							 item_row()
							 Divider()
						}
				 }
			}
	 }
}

#Preview {
	 home() // Updated to preview the correct view
}

struct item_row: View {
	 var body: some View {
			HStack(spacing: 15) {
				 Text("1")
				 Divider()
				 AsyncImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEemtElzzSWMUdCeQqkbphaZc3bQIPabLZ57lPcg4oGXBJGms6PrcAHpaumKZeu2w011Y&usqp=CAU")) { image in
						image
							 .resizable()
							 .scaledToFill()
							 .frame(width: 50, height: 50)
							 .clipShape(Circle())
				 } placeholder: {
						ProgressView()
				 }

				 VStack(alignment: .leading, spacing: 5) {
						Text("Novak Djokovic")
							 .font(.system(size: 16, weight: .medium))
						Text("M · Serbia")
							 .font(.system(size: 14))
							 .foregroundColor(.gray)
				 }

				 Spacer()

				 Text("UDPR 16:25")
						.font(.system(size: 14))
						.foregroundColor(Color("Purple"))
			}
			.padding(.horizontal, 10)
			.padding(.vertical)
			.background(.white)
			.cornerRadius(5)
			.frame(maxWidth: .infinity, alignment: .leading)
	 }
}
