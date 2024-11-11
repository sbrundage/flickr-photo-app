//
//  NetworkStatus.swift
//  FlickrPhoto
//
//  Created by Stephen Brundage on 11/11/24.
//

import Foundation

enum NetworkStatus {
	case loading
	case loaded
	case error(_ description: String)
}
