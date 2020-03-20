//
//  LoadingView.swift
//  SearchApp
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 20/03/20.
//  Copyright © 2020 Leonardo. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        emptySection
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

//struct LoadingView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoadingView(isLo)
//    }
//}
