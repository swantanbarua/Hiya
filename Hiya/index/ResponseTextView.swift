//
//  ResponseTextView.swift
//  Hiya
//
//  Created by Swantan Barua on 26/02/26.
//

import SwiftUI

struct ResponseTextView<S: ShapeStyle>: View {
    
    // MARK: - PROPERTIES
    var text: String
    var foregroundStyle: S
    
    // MARK: - BODY
    var body: some View {
        Text(text)
            .foregroundStyle(foregroundStyle)
            .multilineTextAlignment(.center)
            .font(.title)
            .bold()
    }
}

#Preview {
    ResponseTextView(
        text: "Response",
        foregroundStyle: .tertiary
    )
}
