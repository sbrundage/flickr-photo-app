//
//  SearchBar.swift
//  FlickrPhoto
//
//  Created by Stephen Brundage on 11/11/24.
//

import SwiftUI

struct SearchBar: View {
	@State private var isEditing = false
	
	@Binding var searchText: String
	@Binding var gridColumn: Double
	
	var body: some View {
		HStack {
			
			// MARK: - Search Bar
			
			TextField("Search for photos", text: $searchText)
				.padding(.horizontal, 40)
				.padding(.vertical, 4)
				.background(Color(.lightGray.withAlphaComponent(0.25)))
				.clipShape(RoundedRectangle(cornerRadius: 8))
				.overlay(
					HStack {
						Image(systemName: "magnifyingglass")
							.foregroundStyle(Color.gray)
							.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
							.padding(.leading, 8)
						
						if isEditing {
							Button {
								self.isEditing = false
								self.searchText = ""
								UIApplication.shared.endEditing()
							} label: {
								Image(systemName: "multiply.circle.fill")
									.foregroundStyle(Color.gray)
									.padding(.trailing, 8)
							}
							
						}
					} //: HStack
				) //: Overlay
				.onTapGesture {
					self.isEditing = true
				}
			
			// MARK: - Display Toggle
			
			GridDisplayToggleButton(gridColumn: $gridColumn)
				.frame(width: 35, height: 35)
			
		} //: HStack
	}
}

#Preview {
	SearchBar(searchText: .constant(""), gridColumn: .constant(3.0))
}
