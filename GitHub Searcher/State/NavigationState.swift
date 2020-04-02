//
//  NavigationState.swift
//  GitHub Searcher
//
//  Created by Mark Kuharich on 4/1/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

import SwiftUI

protocol Flow {
    mutating func pop()
}

struct ApplicationFlow: Flow {
    enum Tab {
        case search
        case login
        case settings
        case more
    }
    
    var tab: Tab = .search

    func isTab(_ tab: Tab) -> Bool {
        self.tab == tab
    }

    enum Step {
        case tabs
        case estimator
        case recommendation
        case experts
        case budget
        case homeValue
        case trueCost
        case loanClock
    }
    
    var alert: Bool = false
    var importPhoto: Bool = false

    var stack: [Step] = [ .tabs ]

    var current: Step? {
        stack.last
    }
    
    mutating func push(_ step: Step) {
        stack.append(step)
    }

    mutating func pop() {
        let _ = stack.popLast()
    }
}

struct EstimatorFlow: Flow {
    enum Step {
        case beforeImage
        case beforeCapture
        case beforeMarkup
        case afterImage
        case afterCapture
        case afterMarkup
        case review
    }
    
    var stack: [Step] = []

    var current: Step? {
        stack.last
    }

    mutating func push(_ step: Step) {
        stack.append(step)
    }

    mutating func pop() {
        let _ = stack.popLast()
    }
    
    mutating func reset() {
        beforeImage = nil
        afterImage = nil
        comment = nil
        stack = [ .beforeImage ]
    }
    
    var beforeRawImage: UIImage?
    var beforeImage: Image?
    var afterRawImage: UIImage?
    var afterImage: Image?
    var comment: String?
}

struct BudgetFlow: Flow {
    enum Step {
        case form
        case result
    }
    
    var stack: [Step] = [ .form ]

    var current: Step? {
        stack.last
    }

    mutating func push(_ step: Step) {
        stack.append(step)
    }

    mutating func pop() {
        let _ = stack.popLast()
    }
    
    mutating func reset() {
        amount = nil
        stack = [ .form ]
    }

    var amount: String?
}

struct ReportFlow: Flow {
    enum Step {
        case start
    }
    
    var stack: [Step] = [ .start ]

    var current: Step? {
        stack.last
    }

    mutating func push(_ step: Step) {
        stack.append(step)
    }

    mutating func pop() {
        let _ = stack.popLast()
    }
    
    mutating func reset() {
        ready = false
        stack = [ .start ]
    }

    var ready: Bool = false
}


class NavigationState: ObservableObject {
    @Published var application = ApplicationFlow()
    @Published var estimator = EstimatorFlow()
    @Published var budget = BudgetFlow()
    @Published var report = ReportFlow()
}
