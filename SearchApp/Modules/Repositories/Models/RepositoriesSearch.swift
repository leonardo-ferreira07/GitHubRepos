//
//  RepositoriesSearch.swift
//  SearchApp
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 18/03/20.
//  Copyright © 2020 Leonardo. All rights reserved.
//

import Foundation

struct Repository: Decodable {
    var id: Int
    let name: String
    let description: String
}

struct SearchResponse: Decodable {
    let items: [Repository]
}
