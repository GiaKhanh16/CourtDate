//
//  tourney.swift
//  MatchPals
//
//  Created by Khanh Nguyen on 5/13/25.
//


import SwiftUI

struct tourneys: View {
	 var body: some View {
			ScrollView {
				 ForEach(1..<20) { _ in
						tourney_row()
							 .padding(.vertical, 5)
							 .padding(.horizontal, 5)
				 }
			}
	 }
}


struct tourney_row: View {
	 var body: some View {

			VStack(alignment: .leading) {
						// Title and Duration
				 HStack {
						Text("Tennis Cần Thơ Mở Rộng")
							 .font(.system(size: 22, weight: .semibold))
							 .foregroundColor(.black)
						Spacer()
						Image(systemName: "person.fill")
							 .font(.subheadline)
							 .foregroundColor(.gray)
						Text("60")
							 .font(.subheadline)
							 .foregroundColor(.gray)
				 }

				 Divider()

				 VStack {
							 // Event Details
						HStack(spacing: 16) {
									// Date
							 VStack(spacing: 7) {
									Text("Jan")
										 .font(.system(size: 15, weight: .regular))
										 .foregroundColor(Color("deep"))
									Text("28")
										 .font(.title2)
										 .foregroundColor(Color("deep"))
							 }


							 Rectangle()
									.fill(Color.gray)
									.frame(width: 1)
									.frame(maxHeight: 40)

									// Location and Time
							 VStack(alignment: .leading, spacing: 8) {
									HStack {
										 Image(systemName: "mappin.and.ellipse")
												.foregroundColor(.gray)
										 Text("Sân Bãi Cát")
												.font(.subheadline)
												.foregroundColor(.black)
									}

									HStack {
										 Image(systemName: "clock")
												.foregroundColor(.gray)
										 Text("10:30 AM")
												.font(.subheadline)
												.foregroundColor(.black)
									}
							 }

							 Rectangle()
									.fill(Color.gray)
									.frame(width: 1)
									.frame(maxHeight: 40)

									// Assignees
							 VStack(alignment: .leading, spacing: 8) {
									HStack {
										 Image(systemName: "dollarsign.square.fill")
												.foregroundColor(.gray)
										 Text("$10,000")
												.font(.subheadline)
												.foregroundColor(.black)
									}

									HStack {
										 Image(systemName: "person.2.fill")
												.foregroundColor(.gray)
										 Text("64 Players")
												.font(.subheadline)
												.foregroundColor(.black)
									}
							 }
						}
				 }
				 HStack(alignment: .firstTextBaseline) {
						Text("More Detail")
							 .foregroundStyle(.white)
						Image(systemName: "chevron.right.circle.fill")
							 .imageScale(.medium)
							 .foregroundStyle(.white)
				 }
				 .font(.system(.body, weight: .medium))
				 .padding(.vertical, 14)
				 .frame(maxWidth: .infinity)
				 .foregroundStyle(.gray)
				 .background {
						RoundedRectangle(cornerRadius: 10, style: .continuous)
							 .stroke(.clear.opacity(0.25), lineWidth: 0)
							 .background(
									RoundedRectangle(cornerRadius: 10, style: .continuous)
										 .fill(Color(#colorLiteral(red: 0.329, green: 0.569, blue: 0.992, alpha: 1)).opacity(1.2) )
							 )
				 }
			}
			.padding()
			.background(Color.white)
			.cornerRadius(10)
	 }
}

#Preview {
	 home()
}
