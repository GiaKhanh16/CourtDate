import SwiftUI

struct clubs: View {
	 var body: some View {
			ScrollView { // Move ScrollView to the parent view
				 VStack(spacing: 0) { // Set spacing to 0 for tight stacking
						ForEach(1..<20) { _ in
							 club_row()
							 Divider()
						}
				 }
			}
	 }
}

#Preview {
	home()
}

struct club_row: View {
	 var body: some View {
			HStack {
				 Image(.pickle)
						.resizable()
						.aspectRatio(contentMode: .fill)
						.scaledToFill()
						.frame(width: 50, height: 50)
						.cornerRadius(10)
						.clipped()
				 VStack(alignment: .leading, spacing: 10) {
						Text("The Club of Can Tho")
							 .font(.system(size: 15, weight: .bold))
						Text("Can Tho, Viet Nam.")
							 .foregroundStyle(.gray)
				 }
//				 .padding(.bottom, 40)
				 Spacer()
			}
			.frame(width: .infinity)
			.padding()
			.background(Color.white)
	 }
}
