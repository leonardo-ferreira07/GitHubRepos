//
//  RepositoriesBuilder.swift
//  SearchApp
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 18/03/20.
//  Copyright © 2020 Leonardo. All rights reserved.
//

import SwiftUI

enum RepositoriesBuilder {
    static func makeRepositoriesView(withText text: String, repositoriesFetcher: RepositoriesService) -> some View {
        let viewModel = RepositoriesViewModel(repositoriesFetcher: repositoriesFetcher)
        return RepositoriesView(viewModel: viewModel)
    }
}
