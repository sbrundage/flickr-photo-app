//
//  String+DateFormatter.swift
//  FlickrPhoto
//
//  Created by Stephen Brundage on 11/11/24.
//

import Foundation

extension String {
	func formatDateString() -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // 2024-11-06T05:06:53Z

		guard let formattedDate = dateFormatter.date(from: self) else { return self }
		
		dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
		return dateFormatter.string(from: formattedDate)
	}
}
