//
//  SearchUserDetailResponse.swift
//  GitHub Searcher
//
//  Created by Mark Kuharich on 4/2/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

struct SearchUserDetailResponse: Decodable {
    var items: [UserDetail]
}
