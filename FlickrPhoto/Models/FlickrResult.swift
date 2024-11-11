//
//  FlickrResult.swift
//  FlickrPhoto
//
//  Created by Stephen Brundage on 11/11/24.
//

import Foundation

struct FlickrResult: Identifiable {
	let id: String
	let title: String
	let link: String?
	let media: ResultMedia?
	let dateTaken: String?
	let description: String?
	let author: String?
	let publishedDate: String?
	
	init?(searchResult: SearchResult) {
		guard
			let title = searchResult.title
		else { return nil }
		
		self.id = title
		self.title = title
		self.link = searchResult.link
		self.media = searchResult.media
		self.dateTaken = searchResult.dateTaken
		self.description = searchResult.description
		self.author = searchResult.author
		self.publishedDate = searchResult.published?.formatDateString()
	}
	
	init(title: String, link: String, media: ResultMedia, dateTaken: String?, description: String?, author: String?, publishedDate: String?) {
		self.id = link
		self.title = title
		self.link = link
		self.media = media
		self.dateTaken = dateTaken
		self.description = description
		self.author = author
		self.publishedDate = publishedDate
	}
}

extension FlickrResult {
	static func mocked() -> FlickrResult {
		FlickrResult(
			title: "Porcupine",
			link: "https://www.flickr.com/photos/photosbyblackwolf/54122829041/",
			media: ResultMedia(m: "https://live.staticflickr.com/65535/54122829041_7216a3af5b_m.jpg"),
			dateTaken: "2024-05-12T20:03:51-08:00",
			description: "One of my favorite small creatures to photgraph is the porcupine. They are a gentle animal with a face that is soft and cute. This porcupine was spotted near the Wrangell-St. Elias National Park. \n\nWas able to get the ground level compostion by kneeling down on my knee, the porcupine was elevated just a bit from where I was at.\n\nContrary to popular belief, the porcupine does not throw quills. They are non aggressive and will gladly waddle away from danger.",
			author: "nobody@flickr.com (\"Dan King Alaskan Photography\")",
			publishedDate: "2024-11-06T05:06:53Z"
		)
	}
}
