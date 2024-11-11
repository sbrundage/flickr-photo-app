//
//  String+removeSpaces.swift
//  FlickrPhoto
//
//  Created by Stephen Brundage on 11/11/24.
//

import Foundation

extension String {
	func removeSpaces() -> String {
		// Search tags will be formatted as: porcupine, lion, horse
		// We can remove all spaces and send this into the API call
		self.replacingOccurrences(of: " ", with: "")
	}
}
