//
//  RepoRow.swift
//  SearchApp
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 04/07/19.
//  Copyright © 2019 Leonardo. All rights reserved.
//

import SwiftUI

struct RepositoryRow: View {
    private let viewModel: RepositoryRowViewModel
    
    init(viewModel: RepositoryRowViewModel) {
      self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.name)
                .font(.headline)
            Text(viewModel.description)
                .font(.subheadline)
                .foregroundColor(viewModel.descriptionColor)
        }
    }
}
#if DEBUG
struct RepoRow_Previews : PreviewProvider {
    static var previews: some View {
        RepositoryRow(viewModel: RepositoryRowViewModel(item: Repository(id: 1, name: "test", description: "test description")))
    }
}
#endif
