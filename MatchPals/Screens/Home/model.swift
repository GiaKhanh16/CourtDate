
	 // Define the categories enum
enum categories: String, CaseIterable, Identifiable {
	 case players = "Players"
	 case tourneys = "Tournaments"
	 case clubs = "Clubs"
	 case matches = "Matches"

	 var id: String { rawValue }
	 var tabID: String { "TAB_\(rawValue)" }
}
