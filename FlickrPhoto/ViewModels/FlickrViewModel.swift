//
//  FlickrViewModel.swift
//  FlickrPhoto
//
//  Created by Stephen Brundage on 11/11/24.
//

import Foundation

final class FlickrViewModel: ObservableObject {
	
	@Published var searchResults: [FlickrResult] = []
		
	func mockSearchTextUpdated(searchText: String) {
		DispatchQueue.main.async {
			self.searchResults = []
		}
		
		DispatchQueue.global(qos: .background).async { [weak self] in
			guard
				let self,
				let decodedResponse: SearchResultResponse = try? Bundle.main.decode("SampleResponse.json")
			else { return }
			
			let flickrResults: [FlickrResult] = decodedResponse.items?.compactMap { FlickrResult(searchResult: $0) } ?? []
			
			DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
				guard let self else { return }
				searchResults = flickrResults
			}
		}
	}
	
	func searchForPhotos(withSearchString searchString: String) {
		
	}
}
