//
//  Bundle+decode.swift
//  FlickrPhoto
//
//  Created by Stephen Brundage on 11/11/24.
//

import Foundation

enum DecodingError: Error {
	case invalidFilePath(String)
	case failedLoadingFile(String)
	case failedToDecode(String)
}

extension Bundle {
	func decode<T: Codable>(_ file: String) throws -> T {
		// Locate file
		guard let url = self.url(forResource: file, withExtension: nil) else {
			throw DecodingError.invalidFilePath("Could not load file named: \(file).")
		}
		
		// Grab data of file
		guard let data = try? Data(contentsOf: url) else {
			throw DecodingError.failedLoadingFile("Failed to load \(file) from bundle.")
		}
		
		// Attempt to decode contents of the file to Codable object
		guard let loaded = try? JSONDecoder().decode(T.self, from: data) else {
			throw DecodingError.failedToDecode("Failed to decode file: \(file) for type: \(T.self).")
		}
		
		return loaded
	}
}
