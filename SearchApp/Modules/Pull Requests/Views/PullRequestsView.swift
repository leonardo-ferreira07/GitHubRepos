//
//  PullRequestsView.swift
//  SearchApp
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 20/03/20.
//  Copyright © 2020 Leonardo. All rights reserved.
//

import SwiftUI

struct PullRequestsView: View {
    @ObservedObject var viewModel: PullRequestViewModel

    init(viewModel: PullRequestViewModel) {
      self.viewModel = viewModel
    }
    
    var body: some View {
        
        List {
            if viewModel.dataSource.isEmpty {
                LoadingView(viewModel: viewModel)
            } else {
                Section {
                    ForEach(viewModel.dataSource, content: PullRequestView.init(viewModel:))
                }
            }
        }
        .onAppear(perform: viewModel.fetchPullRequests)
        
    }
}

struct PullRequestsView_Previews: PreviewProvider {
    static var previews: some View {
        PullRequestsView(viewModel: PullRequestViewModel(pullRequestsFetcher: PullRequestsService(), owner: "", repository: ""))
    }
}
