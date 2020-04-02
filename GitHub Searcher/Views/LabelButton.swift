//
//  LabelButton.swift
//  GitHub Searcher
//
//  Created by Mark Kuharich on 4/1/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

import SwiftUI

struct LabelButton: View {
    var title: String
    var titleSize: CGFloat
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: titleSize))
                .fontWeight(.bold)
        }
        .foregroundColor(Color.blue)
    }
}

struct LabelButton_Previews: PreviewProvider {
    static var previews: some View {
        LabelButton(title: "LabelButton", titleSize: 16, action: {})
    }
}
