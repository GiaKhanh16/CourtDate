import SwiftUI



struct home: View {
	 @Namespace private var animation
	 @State private var activeTab: categories = .clubs
	 @State private var sheet: Bool = false
	 @State private var searchText = ""

	 var body: some View {
			NavigationStack {
				 ScrollViewReader { proxy in
						ScrollView(.vertical, showsIndicators: false) {
							 LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders]) {
									Section {
										 switch activeTab {
												case .players:
													 players()
												case .tourneys:
													 tourneys()
												case .clubs:
													 clubs()
												case .matches:
													 Text("Hey Matches")
										 }

									} header: {
										 tabs(
												tab: $activeTab,
												animation: animation,
												proxy: proxy
										 )
									}
							 }
						}
						.navigationTitle("Khanh Nguyen")
						.searchable(text: $searchText)
						.toolbarBackground(.visible, for: .navigationBar)
						.toolbarBackground(Color("Purple"), for: .navigationBar)
						.toolbarColorScheme(.dark, for: .navigationBar)
						.toolbar {
							 ToolbarItem(placement: .topBarTrailing) {
									Button {
										 sheet.toggle()
									} label: {
										 Image(systemName: "slider.horizontal.2.square")
												.resizable()
												.frame(width: 22, height: 25)
												.padding(.horizontal, 20)
									}
							 }
						}
						.background {
							 Rectangle()
									.fill(Color("BG").mix(with: .gray, by: 0.12))
									.ignoresSafeArea()
						}
						.sheet(isPresented: $sheet) {
							 empty_sheet()
						}
				 }
			}
	 }
}

struct empty_sheet: View {
	 var body: some View {
			Text("Filter location, skill, age,...")
	 }
}


#Preview {
	 tab_view()
}
