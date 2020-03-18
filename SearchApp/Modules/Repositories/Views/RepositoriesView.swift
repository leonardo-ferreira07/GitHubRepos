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
            }
            .gesture(DragGesture().onChanged({ (_) in
                self.dismissKeyboard()
            }))
            .onTapGesture {
                self.dismissKeyboard()
            }
        #endif
    }
}

private extension RepositoriesView {
    
    var list: some View {
        List {
            SearchView(viewModel: viewModel)
            
            if viewModel.dataSource.isEmpty {
                emptySection
            } else {
                searchingForSection
                forecastSection
            }
        }
    }
    
    var forecastSection: some View {
        Section {
            ForEach(viewModel.dataSource, content: RepositoryRow.init(viewModel:))
        }
    }
    
    var searchingForSection: some View {
        Section {
            //      NavigationLink(destination: viewModel.currentRepository) {
            VStack(alignment: .leading) {
                Text("Searching for:")
                Text(viewModel.searchText)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            //      }
        }
    }
    
    var emptySection: some View {
        Section {
            if viewModel.isLoading {
                Text("Loading some results for you... 🤔")
                    .foregroundColor(.gray)
            } else {
                Text("No results")
                    .foregroundColor(.gray)
            }
        }
    }
}
