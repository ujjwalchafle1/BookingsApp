//
//  WebServiceHelper.swift
//  TechnicalTaskApp
//
//  Created by Ujjwal on 08/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case incorrectData(Data)
    case incorrectURL
    case unknown
}

typealias webServiceCompletionBlock = (Result<Data, Error>) -> Void

struct WebServiceHelper {
  
  func requestAPI(apiModel : APIModelType, completion: @escaping webServiceCompletionBlock)
  {
    //create complete url string
    guard let url = (apiModel.api.basePath() + apiModel.api.endPath()).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {
      return completion(.failure(NetworkError.incorrectURL))
    }
    
    //careet url from url string
    guard let url = URL(string: url) else {
      return completion(.failure(NetworkError.incorrectURL))
    }
    
    //create url request
    var request = URLRequest(url: url)
    request.httpMethod = apiModel.api.httpMethodType().rawValue
    request.allHTTPHeaderFields = WebServiceHeader().generateHeader()
    
    if let param = apiModel.parameters {
      do {
          request.httpBody = try JSONSerialization.data(withJSONObject: param as Any, options: .prettyPrinted)
      } catch let error {
          print(error.localizedDescription)
      }
    }
    
    let sessionTask = URLSession.shared.dataTask(with: request) { data, response, error in
      
      guard let data = data, error == nil else {
        return completion(.failure(NetworkError.unknown))
      }
      
      if let httpStatus = response as? HTTPURLResponse,  ![200, 201].contains(httpStatus.statusCode) {
          completion(.failure(NetworkError.incorrectData(data)))
      }
      
      completion(.success(data))
    }
    sessionTask.resume()
  }
}
