import SwiftUI

struct player_detail: View { // Note: Renamed to follow Swift naming conventions (PascalCase)
	 @State private var selectedTab: String = "Overview"

	 var body: some View {
			ZStack {
				 Color("Purple")
						.ignoresSafeArea(edges: .top)
				 GeometryReader { geometry in
						VStack(spacing: 0) {
							 Spacer()
							 UnevenRoundedRectangle(cornerRadii: .init(topLeading: 35.0, topTrailing: 35.0))
									.foregroundStyle(.white)
									.frame(height: geometry.size.height * 0.75)
						}
				 }
				 VStack {
						VStack {
							 HStack(spacing: 10) {
										 Image(.djoko)
										 .resizable()
										 .aspectRatio(contentMode: .fill)
										 .frame(width: 80, height: 80)
										 .clipShape(.circle)
										 .padding(.leading, .paddingMidJumbo)
									Spacer()
									VStack {
										 Text("Khanh Nguyen")
												.font(.system(.title, weight: .bold))
												.frame(maxWidth: .infinity, alignment: .leading)
												.foregroundStyle(.white)
										 Text("14 UTR")
												.font(.system(.subheadline, weight: .semibold))
												.frame(maxWidth: .infinity, alignment: .leading)
												.foregroundStyle(.white)
									}

							 }
//							 .padding(.horizontal, .paddingMidJumbo)

						}
						HStack {
							 ForEach(1..<4) { _ in
									HStack {
										 VStack(spacing: 6) {
												Text("Rating:")
//													 .foregroundStyle(.white)
												Text("17")
													 .font(.system(size: 20, weight: .semibold))
//													 .foregroundStyle(.white)
										 }
										 .frame(width: 100, height: 80)
										 .background(
												RoundedRectangle(cornerRadius: 10)
													 .fill(Color.white)
										 )
										 .padding(5) // Optional: space between boxes
									}
							 }
						}
						.padding(.top, 5)

						HStack(spacing: .paddingExtraLarge) {
							 ForEach(["Overview", "Results", "Statistic", "Info"], id: \.self) { tab in
									Button(action: {
										 selectedTab = tab
									}) {
										 Text(tab)
												.foregroundColor(selectedTab == tab ? .blue : .gray)
												.fontWeight(selectedTab == tab ? .bold : .regular)
									}
							 }
						}
						.padding(.top, .paddingExtraLarge)

						Spacer()
						Text("Challenge This Player")
							 .foregroundStyle(.blue)
						Spacer()
				 }
			}
	 }
}

#Preview {
	 player_detail()
}
