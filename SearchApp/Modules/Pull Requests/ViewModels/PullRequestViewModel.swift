//
//  PullRequestViewModel.swift
//  SearchApp
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 20/03/20.
//  Copyright © 2020 Leonardo. All rights reserved.
//

import Foundation
import Combine

class PullRequestViewModel: ObservableObject {
    @Published var dataSource: [PullRequestDetailViewModel] = []
    @Published var isLoading: Bool = false

    private var disposables = Set<AnyCancellable>()
    private let owner: String
    private let repository: String
    private let pullRequestsFetcher: PullRequestsService
    
    init(pullRequestsFetcher: PullRequestsService, owner: String, repository: String) {
        self.pullRequestsFetcher = pullRequestsFetcher
        self.owner = owner
        self.repository = repository
        
        fetchPullRequests()
    }
    
    private func fetchPullRequests() {
        DispatchQueue.main.async { [weak self] in self?.isLoading = true }
        
        pullRequestsFetcher.fetchPullRequests(withOwner: owner, repository: repository)
        .map { response in
            response.map(PullRequestDetailViewModel.init)
        }
        .map(Array.removeDuplicates)
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { [weak self] value in
            guard let self = self else { return }
            switch value {
            case .failure( let error):
                print("## \(error)")
                self.isLoading = false
                self.dataSource = []
            case .finished:
                break
            }
        },
        receiveValue: { [weak self] pullRequests in
            guard let self = self else { return }
            self.isLoading = false
            self.dataSource = pullRequests
        })
        .store(in: &disposables)
    }
}
