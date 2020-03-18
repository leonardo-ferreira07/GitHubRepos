//
//  RepositoriesBuilder.swift
//  SearchApp
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 18/03/20.
//  Copyright © 2020 Leonardo. All rights reserved.
//

import SwiftUI

enum RepositoriesBuilder {
    static func makeRepositoriesView(repositoriesFetcher: RepositoriesService) -> RepositoriesView {
        let viewModel = RepositoriesViewModel(repositoriesFetcher: repositoriesFetcher)
        return RepositoriesView(viewModel: viewModel)
    }
}
