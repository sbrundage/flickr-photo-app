//
//  ContentView.swift
//  FlickrPhoto
//
//  Created by Stephen Brundage on 11/11/24.
//

import SwiftUI

struct ContentView: View {
	
	@State private var searchText: String = ""
	@State private var gridColumn: Double = 2.0
	
	@ObservedObject var viewModel = FlickrViewModel()
	
	var body: some View {
		NavigationStack {
			VStack(spacing: 0) {
				
				SearchBar(searchText: $searchText, gridColumn: $gridColumn)
					.padding(.vertical, 12)
				
				GalleryGridView(gridColumn: $gridColumn, photos: $viewModel.searchResults)
				
				Spacer()
			}
			.navigationTitle("Flickr")
			.onChange(of: searchText) { _, newValue in
				viewModel.searchForPhotos(withSearchString: newValue)
			}
		} //: NavigationStack
		.padding(.horizontal)
	}
}

#Preview {
	ContentView()
}
