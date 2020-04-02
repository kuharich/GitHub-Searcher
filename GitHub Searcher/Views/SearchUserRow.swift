//
//  SearchUserRow.swift
//  GitHub Searcher
//
//  Created by Mark Kuharich on 4/1/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

import SwiftUI

struct SearchUserRow: View {
    @ObservedObject var viewModel: SearchUserViewModel
    @State var user: User

    var body: some View {
        HStack {
            AsyncImage(
                url: user.avatar_url,
                placeholder: Text("Loading ...")
            ).aspectRatio(contentMode: .fit)
                .frame(width: 44, height: 44)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.black, lineWidth: 1))
                .padding(.trailing, 50)
            Text(user.login)
                .font(Font.system(size: 18).bold())
            Spacer()
            Text("Repo: ")
                .font(Font.system(size: 18).bold())
            // Text(String(userDetail.public_repos))
            //    .font(Font.system(size: 18).bold())
            }
            .frame(height: 60)
    }
}
