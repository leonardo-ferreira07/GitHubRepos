//
//  NetworkService.swift
//  SearchApp
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 18/03/20.
//  Copyright © 2020 Leonardo. All rights reserved.
//

import Foundation
import Combine

class NetworkService {
  private let session: URLSession
  
  init(session: URLSession = .shared) {
    self.session = session
  }
}

// MARK: - NetworkService Request

extension NetworkService {
  
    func request<T>(with components: URLComponents) -> AnyPublisher<T, GenericError> where T: Decodable {
        guard let url = components.url else {
          let error = GenericError.network(description: "Couldn't create URL")
          return Fail(error: error).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: URLRequest(url: url))
          .mapError { error in
            .network(description: error.localizedDescription)
          }
          .flatMap(maxPublishers: .max(1)) { pair in
            decode(pair.data)
          }
          .eraseToAnyPublisher()
      }
    }

