//
//  SearchView.swift
//  SearchApp
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 04/07/19.
//  Copyright © 2019 Leonardo. All rights reserved.
//

import SwiftUI

struct SearchView : View {
    @State private var query: String = "swift"
    @EnvironmentObject var repoStore: ReposStore
    
    var body: some View {
        NavigationView {
            List {
                TextField("", text: $query, onEditingChanged: {_ in 
                    self.fetch()
                    
                }) {
                    self.fetch()
                }
                ForEach(repoStore.repos) { repo in
                    RepositoryRow(repo: repo)
                }
                }.navigationBarTitle(Text("Search"))
            }.onAppear(perform: fetch)
    }
    
    private func fetch() {
        repoStore.fetch(matching: query)
        print(repoStore.repos)
    }
}

#if DEBUG
struct SearchView_Previews : PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
#endif
