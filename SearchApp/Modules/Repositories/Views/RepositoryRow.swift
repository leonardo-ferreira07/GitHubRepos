//
//  RepoRow.swift
//  SearchApp
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 04/07/19.
//  Copyright © 2019 Leonardo. All rights reserved.
//

import SwiftUI

struct RepositoryRow: View {
    let repo: Repository
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(repo.name)
                .font(.headline)
            Text(repo.description)
                .font(.subheadline)
        }
    }
}
#if DEBUG
struct RepoRow_Previews : PreviewProvider {
    static var previews: some View {
        RepositoryRow(repo: Repository(id: 1, name: "test", description: "test description"))
    }
}
#endif
