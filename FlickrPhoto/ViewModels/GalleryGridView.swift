//
//  GalleryGridView.swift
//  FlickrPhoto
//
//  Created by Stephen Brundage on 11/11/24.
//

import SwiftUI

struct GalleryGridView: View {
	
	// MARK: - Properties
	
	@State private var selectedPhoto: FlickrResult?
	@State private var gridLayout: [GridItem]
	
	@Binding var photos: [FlickrResult]
	
	@Binding var gridColumn: Double
	
	init(gridColumn: Binding<Double>, photos: Binding<[FlickrResult]>) {
		self._gridColumn = gridColumn
		self._gridLayout = State(initialValue: Array(repeating: GridItem(.flexible()), count: Int(gridColumn.wrappedValue)))
		self._photos = photos
	}
	
	// MARK: - Functions
	
	func gridSwitch() {
		withAnimation(.easeIn) {
			gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
		}
	}
	
	// MARK: - Body
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			
			// MARK: - Dynamic Photo Grid
			
			LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
				ForEach(photos) { photo in
					NavigationLink(destination: FlickrImageDetailView(flickrImage: photo)) {
						PhotoResultView(
							photoUrl: photo.media?.m,
							width: 150,
							height: 150
						)
					}
					
				} //: ForEach
			} //: LazyVGrid
			.onChange(of: gridColumn) { _, _ in
				gridSwitch()
			}
		} //: ScrollView
	}
}

#Preview {
	let searchResults: SearchResultResponse = try! Bundle.main.decode("SampleResponse.json")
	let flickrResults: [FlickrResult] = searchResults.items?.compactMap { FlickrResult(searchResult: $0) } ?? []
	
	GalleryGridView(gridColumn: .constant(2.0), photos: .constant(flickrResults))
}
