//
//  GriidDisplayToggleButton.swift
//  FlickrPhoto
//
//  Created by Stephen Brundage on 11/11/24.
//

import SwiftUI

struct GridDisplayToggleButton: View {
	@Binding var gridColumn: Double
	
	private let vm = ViewModel()
	
	var body: some View {
		Button {
			gridColumn = gridColumn.truncatingRemainder(dividingBy: 3.0) + 1
		} label: {
			Image(systemName: vm.getSystemNameForGridLayout(gridColumn))
				.resizable()
				.aspectRatio(contentMode: .fit)
				.foregroundColor(.accentColor)
		}
	}
}

extension GridDisplayToggleButton {
	class ViewModel {
		func getSystemNameForGridLayout(_ gridColumn: Double) -> String {
			switch gridColumn {
			case 1.0:
				return "square.grid.2x2"
			case 2.0:
				return "square.grid.3x2"
			case 3.0:
				return "rectangle.grid.1x2"
			default:
				return ""
			}
		}
	}
}

#Preview {
	@Previewable @State var gridColumn: Double = 3.0
	GridDisplayToggleButton(gridColumn: $gridColumn)
}
