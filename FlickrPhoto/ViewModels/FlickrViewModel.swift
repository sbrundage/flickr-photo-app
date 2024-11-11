//
//  FlickrViewModel.swift
//  FlickrPhoto
//
//  Created by Stephen Brundage on 11/11/24.
//

import Foundation

final class FlickrViewModel: ObservableObject {
	
	@Published var searchResults: [FlickrResult] = []
	@Published var networkStatus: NetworkStatus = .loaded
	
	private let networkManager = NetworkManager()
		
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
		networkStatus = .loading
		
		networkManager.fetchPhotosForSearch(searchText: searchString) { [weak self] result in
			guard let self else { return }
			
			switch result {
				case .success(let photoResults):
					DispatchQueue.main.async { [weak self] in
						guard let self else { return }
						searchResults = photoResults
						networkStatus = .loaded
					}
				case .failure(let error):
					DispatchQueue.main.async { [weak self] in
						guard let self else { return }
						switch error {
							case .invalidUrl(let url):
								networkStatus = .error("Invalid API URL: \(url)")
							case .networkResponseError(let error, let statusCode):
								// Ignore -999 error codes as we invalid outstanding request on text field edit
								guard
									let statusCode = statusCode,
									statusCode != -999
								else {
									networkStatus = .loaded
									return
								}
								networkStatus = .error(error?.localizedDescription ?? "NetworkError with no returned description.")
							case .decodingError:
								networkStatus = .error("Trouble decoding response JSON.")
							case .unknownError(let error):
								networkStatus = .error("Unknown NetworkError: \(error.localizedDescription)")
						}
					}
			}
		}
	}
}
