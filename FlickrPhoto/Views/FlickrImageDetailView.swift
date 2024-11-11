//
//  FlickrImageDetailView.swift
//  FlickrPhoto
//
//  Created by Stephen Brundage on 11/11/24.
//

import SwiftUI

struct FlickrImageDetailView: View {
	
	let flickrImage: FlickrResult
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(spacing: 0) {
				PhotoResultView(
					photoUrl: flickrImage.media?.m,
					width: 300,
					height: 300
				)
				
				Text(flickrImage.title ?? "NA")
					.font(.title)
					.padding(.vertical, 24)
				
				VStack(alignment: .leading, spacing: 24) {
					Text("Description")
						.font(.headline)
						.background(
							Color.accentColor
								.frame(height: 2)
								.offset(y: 16)
						)
					
					Text(flickrImage.description ?? "NA")
						.foregroundStyle(Color.accentColor)
					
					Text("Author")
						.font(.headline)
						.background(
							Color.accentColor
								.frame(height: 2)
								.offset(y: 16)
						)
						.padding(.top, 12)
					
					Text(flickrImage.author ?? "NA")
						.foregroundStyle(Color.accentColor)
					
					Text("Published")
						.font(.headline)
						.background(
							Color.accentColor
								.frame(height: 2)
								.offset(y: 16)
						)
						.padding(.top, 12)
					
					Text(flickrImage.publishedDate ?? "NA")
						.foregroundStyle(Color.accentColor)
				}
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.vertical)
			} //: VStack
		} //: ScrollView
		.padding(.horizontal)
	}
}

#Preview {
	FlickrImageDetailView(flickrImage: FlickrResult.mocked())
}
