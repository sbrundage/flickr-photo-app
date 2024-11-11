//
//  PhotoResultView.swift
//  FlickrPhoto
//
//  Created by Stephen Brundage on 11/11/24.
//

import SwiftUI

struct PhotoResultView: View {
	let photoUrl: String?
	let width: CGFloat
	let height: CGFloat
	
	init(photoUrl: String?, width: CGFloat, height: CGFloat) {
		self.photoUrl = photoUrl
		self.width = width
		self.height = height
	}
	
	var body: some View {
		
		AsyncImage(url: URL(string: photoUrl ?? "")) { phase in
			if let image = phase.image {
				image
					.resizable()
					.scaledToFit()
					.clipShape(RoundedRectangle(cornerRadius: 8))
					.overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 2))
			} else if phase.error != nil { // Error
				Image(systemName: "photo")
					.resizable()
					.scaledToFit()
					.clipShape(RoundedRectangle(cornerRadius: 8))
					.overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 2))
			} else { // Placeholder
				ProgressView()
					.tint(.accentColor)
			}
		}
	}
}

#Preview {
	PhotoResultView(photoUrl: FlickrResult.mocked().media?.m, width: 150, height: 150)
}
