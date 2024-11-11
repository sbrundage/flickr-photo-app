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
}
