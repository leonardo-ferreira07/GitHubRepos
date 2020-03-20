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
    @Published var dataSource: PullRequest?
    @Published var isLoading: Bool = false

    private var disposables = Set<AnyCancellable>()
}
