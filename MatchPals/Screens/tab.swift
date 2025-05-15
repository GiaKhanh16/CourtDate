//
//  tab.swift
//  MatchPals
//
//  Created by Khanh Nguyen on 5/12/25.
//

import SwiftUI

enum tabs_info {
	 case home
	 case profile

	 var title: String {
			switch self {
				 case .home:
						"Home"
				 case .profile:
						"Profile"
			}
	 }

	 var icon_name: String {
			switch self {
				 case .home:
						"tennisball.circle.fill"
				 case .profile:
						"person.crop.circle"
			}
	 }
}


struct tab_view: View {
	 @State var current_tab = tabs_info.home

	 var body: some View {
			
			TabView(selection: $current_tab) {

				 Tab(tabs_info.home.title, systemImage: tabs_info.home.icon_name, value: .home) {
						home()
				 }
				 Tab(tabs_info.profile.title, systemImage: tabs_info.profile.icon_name, value: .profile) {
						Text("out")
				 }
			}
	 }
}

#Preview {
	 tab_view()
}
