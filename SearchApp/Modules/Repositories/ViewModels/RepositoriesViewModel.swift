//
//  RepositoriesViewModel.swift
//  SearchApp
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 18/03/20.
//  Copyright © 2020 Leonardo. All rights reserved.
//

import Foundation
import Combine

class RepositoriesViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var dataSource: [RepositoryRowViewModel] = []

    private let repositoriesFetcher: RepositoriesService
    private var disposables = Set<AnyCancellable>()

    init(repositoriesFetcher: RepositoriesService, scheduler: DispatchQueue = DispatchQueue(label: "RepositoriesViewModel")
    ) {
      self.repositoriesFetcher = repositoriesFetcher
      $searchText
        .dropFirst(1)
        .debounce(for: .seconds(0.5), scheduler: scheduler)
        .sink(receiveValue: fetchWeather(forsearchText:))
        .store(in: &disposables)
    }

    func fetchWeather(forsearchText searchText: String) {
        repositoriesFetcher.fetchRepositories(forText: searchText)
        .map { response in
            response.items.map(RepositoryRowViewModel.init)
        }
        .map(Array.removeDuplicates)
        .receive(on: DispatchQueue.main)
        .sink(
          receiveCompletion: { [weak self] value in
            guard let self = self else { return }
            switch value {
            case .failure:
              self.dataSource = []
            case .finished:
              break
            }
          },
          receiveValue: { [weak self] forecast in
            guard let self = self else { return }
            self.dataSource = forecast
        })
        .store(in: &disposables)
    }

}
