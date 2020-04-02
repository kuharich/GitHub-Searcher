//
//  User.swift
//  GitHub Searcher
//
//  Created by Mark Kuharich on 4/1/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

import Foundation
import SwiftUI

struct User: Hashable, Identifiable, Decodable {
    var id: Int64
    var login: String
    var avatar_url: URL
}

struct UserDetail: Hashable, Identifiable, Decodable {
    var id: Int64
    var login: String
    var avatar_url: URL
    var public_repos: Int
}
