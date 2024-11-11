//
//  StringManipulationTests.swift
//  FlickrPhotoTests
//
//  Created by Stephen Brundage on 11/11/24.
//

@testable import FlickrPhoto

import XCTest

final class StringManipulationTests: XCTestCase {

	func testWhenRemovingSpacesFromSearchText_AllSpacesRemovedAndTagsAreSeparatedByCommas() {
		let searchText = "porcupine, lion, horse, dog"
		let expectedNoSpacesSearchText = "porcupine,lion,horse,dog"
		XCTAssertEqual(searchText.removeSpaces(), expectedNoSpacesSearchText, "Strings do not match.")
	}
	
	func testConvertingDateString_WhenReceivedUnformattedStringFromServer_FormatSuccessfully() {
		let unformattedDate = "2024-11-06T05:06:53Z"
		let formattedDate = unformattedDate.formatDateString()
		let expectedFormattedDate = "Wednesday, Nov 6, 2024"
		
		XCTAssertEqual(formattedDate, expectedFormattedDate, "Formatted date doesn't match expected format.")
	}
}
