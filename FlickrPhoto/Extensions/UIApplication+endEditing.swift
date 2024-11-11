//
//  UIApplication+endEditing.swift
//  FlickrPhoto
//
//  Created by Stephen Brundage on 11/11/24.
//

import SwiftUI

extension UIApplication {
	func endEditing() {
		sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
