//
//  ListingRequest.swift
//  TechnicalTaskApp
//
//  Created by Jack Warris on 15/09/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

class RequestProvider {

    let kListingsServerUrl = "https://justpark-hiring-json-api.herokuapp.com/api/bookings"

  let kDetailsServerUrl = "https://justpark-hiring-json-api.herokuapp.com/api/booking/"

    func listingsRequest() -> URLRequest {
        return URLRequest.init(url: URL.init(string: kListingsServerUrl)!)
    }
  
  func detailsRequest(_ id: String) -> URLRequest {
      return URLRequest.init(url: URL.init(string: kDetailsServerUrl+id)!)
  }
}
