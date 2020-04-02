//
//  UserImageStore.swift
//  GitHub Searcher
//
//  Created by Mark Kuharich on 4/1/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

import SwiftUI
import Combine

class UserImageStore: ObservableObject {

    var didChange = PassthroughSubject<Void, Never>()
    var image: Image? {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send(())
            }
        }
    }

    func load(image url: String) -> Self {
        if image == nil {
            GithubUsersSearchAPI.fetchImage(at: URL(string: url)!) { image, error in
                if let image = image {
                    self.image = image
                }
            }
        }

        return self
    }

}

class ImageCache {

    static let shared = ImageCache()
    private var cache = [String: Image]()

    private init() { }
    
    func image(for url: URL) -> Image? {
        cache[url.absoluteString]
    }

    func store(image: Image, url: URL) {
        cache[url.absoluteString] = image
    }

}
