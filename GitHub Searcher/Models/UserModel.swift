//
//  UserModel.swift
//  GitHub Searcher
//
//  Created by Mark Kuharich on 4/1/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

import Combine

class UserModel: ObservableObject {
    // base
    var email: String = ""
    var password: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var userName: String?
    var idToken: String?
    var accessToken: String?
    // published
    @Published var isLogin: Bool?
    @Published var isAskedFaceID: Bool = false
    @Published var isUsingFaceID: Bool = false
    @Published var isPassFaceID: Bool = false

    init() {
    }

    func setLogout() {
        // base
        self.email = ""
        self.password = ""
        self.firstName = ""
        self.lastName = ""
        self.userName = nil
        self.idToken = nil
        self.accessToken = nil
        // published
        self.isLogin = false
        self.isPassFaceID = false
    }
}
