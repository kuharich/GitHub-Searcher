//
//  SearchUserDetailViewModel.swift
//  GitHub Searcher
//
//  Created by Mark Kuharich on 4/2/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

import SwiftUI
import Combine

final class SearchUserDetailViewModel: ObservableObject {

    @Published var name = ""

    @Published private(set) var userDetails = [UserDetail]()

    private var searchCancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }

    deinit {
        searchCancellable?.cancel()
    }

    func search() {
        guard !name.isEmpty else {
            return userDetails = []
        }

        let urlComponents = URLComponents(string: "https://api.github.com/users/\(name)")!

        var request = URLRequest(url: urlComponents.url!)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        searchCancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: SearchUserDetailResponse.self, decoder: JSONDecoder())
            .map { $0.items }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.userDetails, on: self)
    }
}
