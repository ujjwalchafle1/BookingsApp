//
//  WebServiceConfig.swift
//  TechnicalTaskApp
//
//  Created by Ujjwal on 08/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation

enum HTTPMethodType: String {
  case get  = "GET"
  case post = "POST"
  case put  = "PUT"
}

protocol APIProtocol {
  func httpMethodType() -> HTTPMethodType
  func endPath() -> String
  func basePath() -> String
}

protocol APIModelType {
  var api: APIProtocol { get set }
  var parameters: [String:Any]? { get set }
}

struct APIRequestModel: APIModelType {
  var api: APIProtocol
  var parameters: [String : Any]?
  
  init(api: APIProtocol, param: [String : Any]? = nil) {
    self.api = api
    self.parameters = param
  }
}

struct WebServiceHeader
{
  func generateHeader() -> [String: String] {
    var headers:[String: String] = [:]
    headers["Content-Type"] = "application/json"
    return headers
  }
}
