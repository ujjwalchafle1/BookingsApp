//
//  CreditScoreAPI.swift
//  BreakingBadSwiftUI
//
//  Created by Ujjwal on 28/02/2021.
//

import Foundation

/// Use this enum to create base url and endpoint path
/// Add additional cases for future API services
enum BookingAPI {
  case bookingListing
  case bookingDetails
}

/// Create base url and path components based on the enum case.
extension BookingAPI: EndpointType
{
  var baseURL: URL {
    switch self {
    case .bookingListing, .bookingDetails :
      return URL(string: "https://justpark-hiring-json-api.herokuapp.com/api")!
    }
  }
  
  var path: String {
    switch self {
    case .bookingListing :
      return "/bookings"
    case .bookingDetails :
      return "/booking/4611"
    }
  }
}
