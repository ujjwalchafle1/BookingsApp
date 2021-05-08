//
//  BookingAPI.swift
//  TechnicalTaskApp
//
//  Created by Ujjwal on 08/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation

enum BookingAPI {
  case getlistingsService
  case getdetailsSerice
}

extension BookingAPI: APIProtocol {
  
  func httpMethodType() -> HTTPMethodType {
    var method = HTTPMethodType.get
    switch self {
    case .getlistingsService, .getdetailsSerice:
      method = .get
    }
    return method
  }
  
  func endPath() -> String {
    var endPath = ""
    switch self {
    case .getlistingsService:
      endPath += WebserviceConstants.bookingsAPI
    case .getdetailsSerice:
      endPath += WebserviceConstants.bookingDetailAPI
    }
    return endPath
  }
  
  func basePath() -> String {
    switch self {
    case .getlistingsService, .getdetailsSerice:
      return WebserviceConstants.baseURL
    }
  }
  
  
}
