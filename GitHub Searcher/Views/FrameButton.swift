//
//  FrameButton.swift
//  GitHub Searcher
//
//  Created by Mark Kuharich on 4/1/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

import SwiftUI

struct FrameButton: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Spacer()
            Text(title)
                .font(.system(size: 16))
                .fontWeight(.bold)
            Spacer()
        }
        .frame(height: 56.0)
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
        .cornerRadius(8)
    }
}

struct FrameButton_Previews: PreviewProvider {
    static var previews: some View {
        FrameButton(title: "FrameButton", action: {})
    }
}
