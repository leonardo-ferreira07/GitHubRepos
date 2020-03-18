//
//  RepoStore.swift
//  SearchApp
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 04/07/19.
//  Copyright © 2019 Leonardo. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ReposStore: ObservableObject {
    var repos: [Repository] = [] {
        didSet {
            didChange.send(self)
        }
    }
    
    var didChange = PassthroughSubject<ReposStore, Never>()
    
    let service: GithubService
    init(service: GithubService) {
        self.service = service
    }
    
    func fetch(matching query: String) {
        service.search(matching: query) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let repos): self?.repos = repos
                case .failure: self?.repos = []
                }
            }
        }
    }
}
