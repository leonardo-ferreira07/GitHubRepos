//
//  RepositoriesView.swift
//  SearchApp
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 18/03/20.
//  Copyright © 2020 Leonardo. All rights reserved.
//

import SwiftUI

struct RepositoriesView: View {
    @ObservedObject var viewModel: RepositoriesViewModel
    
    init(viewModel: RepositoriesViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        #if os(watchOS)
            return list
        #else
            return NavigationView {
                list
                .listStyle(GroupedListStyle())
                .navigationBarTitle("GitHub Search 👨🏻‍💻")
                .gesture(DragGesture().onChanged({ (_) in
                    self.dismissKeyboard()
                }))
//                .onTapGesture {
//                    self.dismissKeyboard()
//                }
            }
        #endif
    }
}

private extension RepositoriesView {
    
    var list: some View {
        List {
            SearchView(viewModel: viewModel)
            
            if viewModel.dataSource.isEmpty {
                LoadingView(viewModel: viewModel)
            } else {
                searchingForSection
                repositoriesSection
            }
        }
    }
    
    var repositoriesSection: some View {
        Section {
            ForEach(viewModel.dataSource) { repo in
                NavigationLink(destination: PullRequestsView(viewModel: PullRequestViewModel(pullRequestsFetcher: PullRequestsService(), owner: repo.ownerName, repository: repo.name))) {
                    RepositoryRow.init(viewModel: repo)
                }
            }
        }
    }
    
    var searchingForSection: some View {
        Section {
            VStack(alignment: .leading) {
                Text("Searching for:")
                Text(viewModel.searchText)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
    
}
