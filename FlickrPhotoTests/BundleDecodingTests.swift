//
//  BundleDecodingTests.swift
//  FlickrPhotoTests
//
//  Created by Stephen Brundage on 11/11/24.
//

@testable import FlickrPhoto

import XCTest

final class BundleDecodingTests: XCTestCase {

	let sut = Bundle.main
	
	// Testing valid file path
	func testDecodingLocalJsonFile_WhenUsingValidFilePath_ShouldDecodeSuccessfully() {
		do {
			let _: SearchResultResponse = try sut.decode("SampleResponse.json")
		} catch {
			XCTFail("Decoding should not fail for valid file path.")
		}
	}
	
	// Testing invalid File Path
	func testDecodingLocalJsonFile_WhenUsingInvalidFilePath_ShouldThrowInvalidPathError() {
		do {
			let _: SearchResultResponse = try sut.decode("ThisIsNotPresent.json")
			XCTFail("File path is not present, should not succeed.")
		} catch DecodingError.invalidFilePath(_) {
			// This is what should be thrown
		} catch {
			XCTFail("Error thrown should be of type DecodingError.")
		}
	}
	
	// Test mapping search results to FlickrResult models
	func testDecodingLocalJsonFile_WhenMappingSearchResultResponseToFlickrResults_ShouldMapSuccessfully() {
		do {
			let searchResults: SearchResultResponse = try sut.decode("SampleResponse.json")
			let flickrResults: [FlickrResult] = searchResults.items?.compactMap { FlickrResult(searchResult: $0) } ?? []
			
			XCTAssertTrue(!flickrResults.isEmpty, "Flickr results array should not be empty.")
			XCTAssertEqual(flickrResults[0].title, "Dikobrazové")
		} catch {
			XCTFail("Error should not be thrown.")
		}
	}

}
