//
//  SearchScreen.swift
//  GitHub Searcher
//
//  Created by Mark Kuharich on 4/1/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

import SwiftUI

struct SearchScreen: View {
    @ObservedObject var viewModel = SearchUserViewModel()
    @ObservedObject var detailViewModel = SearchUserDetailViewModel()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Helvetica", size: 30)!]
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("GitHub Searcher")
                    .font(.system(size: 30))
                SearchUserBar(text: $viewModel.name) {
                    self.viewModel.search()
                }
                List(viewModel.users) { user in
                    SearchUserRow(viewModel: self.viewModel, user: user)
                        .onAppear { self.viewModel.fetchImage(for: user) }
                }
            }
        }.navigationBarTitle("GitHub Searcher", displayMode: .inline)
    }
}

struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
