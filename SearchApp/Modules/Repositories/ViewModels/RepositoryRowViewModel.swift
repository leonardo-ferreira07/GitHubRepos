//
//  RepositoryRowViewModel.swift
//  SearchApp
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 18/03/20.
//  Copyright © 2020 Leonardo. All rights reserved.
//

import Combine

struct RepositoryRowViewModel: Identifiable {
    private let repository: Repository
    
    init(item: Repository) {
      self.repository = item
    }
    
    // MARK: - Computed properties
    var id: String {
        return "\(repository.id)"
    }
    
    var name: String {
        return repository.name
    }
    
    var description: String {
        repository.description
    }
}

extension RepositoryRowViewModel: Hashable {
  static func == (lhs: RepositoryRowViewModel, rhs: RepositoryRowViewModel) -> Bool {
    return lhs.id == rhs.id
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(self.id)
  }
}
