//
//  SearchUserResponse.swift
//  GitHub Searcher
//
//  Created by Mark Kuharich on 4/1/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

struct SearchUserResponse: Decodable {
    var items: [User]
}
