//
//  NetworkManager.swift
//  FlickrPhoto
//
//  Created by Stephen Brundage on 11/11/24.
//

import Foundation

class NetworkManager {
	private let flickrUrl = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="
	private weak var dataTask: URLSessionTask?
	
	func fetchPhotosForSearch(searchText: String, completion: @escaping (Result<[FlickrResult], NetworkError>) -> Void) {
		let noSpacesSearchText = searchText.removeSpaces()
		let entireUrl = flickrUrl + noSpacesSearchText
		
		dataTask?.cancel()
		
		guard let request = createUrlRequest(forUrl: entireUrl) else {
			completion(.failure(.invalidUrl))
			return
		}
		
		dataTask = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
			guard
				let data = data,
				error == nil
			else {
				completion(.failure(.networkResponseError(error!)))
				return
			}
			
			do {
				let decodedResponse = try JSONDecoder().decode(SearchResultResponse.self, from: data)
				let flickrResults: [FlickrResult] = decodedResponse.items?.compactMap { FlickrResult(searchResult: $0) } ?? []
				completion(.success(flickrResults))
			} catch {
				completion(.failure(.decodingError))
			}
		})
		
		dataTask?.resume()
	}
	
	private func createUrlRequest(forUrl urlString: String) -> URLRequest? {
		guard let url = URL(string: urlString) else { return nil }
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		return request
	}
}
