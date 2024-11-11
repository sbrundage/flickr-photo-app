//
//  SearchResult.swift
//  FlickrPhoto
//
//  Created by Stephen Brundage on 11/11/24.
//

/*
 
 {
	 "title": "Uploads from everyone",
	 "link": "https:\/\/www.flickr.com\/photos\/",
	 "description": "",
	 "modified": "2024-11-09T11:32:11Z",
	 "generator": "https:\/\/www.flickr.com",
	 "items": [
	{
		 "title": "Esposizione",
		 "link": "https:\/\/www.flickr.com\/photos\/48390522@N07\/54126272012\/",
		 "media": {"m":"https:\/\/live.staticflickr.com\/65535\/54126272012_62ffa61e20_m.jpg"},
		 "date_taken": "2024-11-09T12:32:11-08:00",
		 "description": " <p><a href=\"https:\/\/www.flickr.com\/people\/48390522@N07\/\">Silvia Pantieri<\/a> posted a photo:<\/p> <p><a href=\"https:\/\/www.flickr.com\/photos\/48390522@N07\/54126272012\/\" title=\"Esposizione\"><img src=\"https:\/\/live.staticflickr.com\/65535\/54126272012_62ffa61e20_m.jpg\" width=\"240\" height=\"240\" alt=\"Esposizione\" \/><\/a><\/p> <p>#darkphoto #monochromatic #monochrom #darkaesthetic #blackwhitephoto #bnwphoto #blackandwhitephoto #blackandwhites #blackandwhitepics #bnw #vintagephotoboot #sombreexplore #blackandwhiteportrait #bnwportraits #blackandwhiteportraits #bnwportraiture <br \/> #blackandwhiteportraitphotography #bnwportrait #blackandwhiteportraitshot #blackwhiteportrait<br \/> #blackandwhiteportraiture #blacknwhiteportraits<\/p> ",
		 "published": "2024-11-09T11:32:11Z",
		 "author": "nobody@flickr.com (\"Silvia Pantieri\")",
		 "author_id": "48390522@N07",
		 "tags": "sombre solitude sofferenza solitudine blackwhite blackandwhite bn bw bnw biancoenero portrait ritratto people persona persone"
	},
	....
 
 */

import Foundation

struct SearchResultResponse: Codable {
	let title: String?
	let items: [SearchResult]?
}

struct SearchResult: Codable {
	let title: String?
	let link: String?
	let media: ResultMedia?
	let dateTaken: String?
	let description: String?
	let author: String?
	let published: String?
	
	enum CodingKeys: String, CodingKey {
		case title, link, media, description, author, published
		case dateTaken = "date_taken"
	}
}

struct ResultMedia: Codable {
	let m: String?
}
