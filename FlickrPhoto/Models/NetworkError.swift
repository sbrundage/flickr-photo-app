//
//  NetworkError.swift
//  FlickrPhoto
//
//  Created by Stephen Brundage on 11/11/24.
//

import Foundation

enum NetworkError: Error {
	case invalidUrl(String)
	case networkResponseError(Error?, Int?)
	case decodingError
	case unknownError(Error)
}
