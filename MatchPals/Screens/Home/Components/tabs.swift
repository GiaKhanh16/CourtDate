//
//  tabs.swift
//  MatchPals
//
//  Created by Khanh Nguyen on 5/13/25.
//
import SwiftUI

struct tabs: View {
	 @Binding var tab: categories
	 let animation: Namespace.ID
	 let proxy: ScrollViewProxy

	 var body: some View {
			ScrollView(.horizontal, showsIndicators: false) {
				 HStack(spacing: 18) {
						ForEach(categories.allCases) { category in
							 Text(category.rawValue)
									.foregroundStyle(.white)
									.fontWeight(.semibold)
									.background(alignment: .bottom) {
										 if tab == category {
												Capsule()
													 .fill(.white)
													 .frame(height: 5)
													 .padding(.horizontal, 5)
													 .offset(y: 15)
													 .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
										 }
									}
									.padding(.horizontal, 15)
									.contentShape(Rectangle())
									.id(category.tabID)
									.onTapGesture {
										 withAnimation(.easeInOut(duration: 0.2)) {
												tab = category
												proxy.scrollTo(category.tabID, anchor: .topLeading)
										 }
									}
						}
				 }
				 .padding(.vertical, 15)
				 .onChange(of: tab) { _, newValue in
						withAnimation(.easeInOut(duration: 0.1)) {
							 proxy.scrollTo(newValue.tabID, anchor: .center)
						}
				 }
			}
			.background {
				 Rectangle()
						.fill(Color("Purple"))
						.padding(.top, -100)
						.shadow(color: .black.opacity(0.2), radius: 5, x: 5, y: 5)
			}
	 }
}
