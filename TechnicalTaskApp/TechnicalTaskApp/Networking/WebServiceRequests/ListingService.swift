//
//  ListingService.swift
//  TechnicalTaskApp
//
//  Created by Ujjwal on 08/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation

typealias getListingResponse = (Result<[Datum],Error>) -> Void
typealias getListingDetailResponse = (Result<Details,Error>) -> Void

protocol ListingServiceDelegate {
  func getLisitngs(completion: @escaping getListingResponse)
  func getDetails(completion: @escaping getListingDetailResponse)
}

struct ListingService: ListingServiceDelegate
{
  func getLisitngs(completion: @escaping getListingResponse) {
    let api = APIRequestModel(api: BookingAPI.getlistingsService)
    WebServiceHelper().requestAPI(apiModel: api) { response in
      switch response {
      case .success(let data):
        let response = ResponseDecoder()
        do {
          let decodedData = try response.decode(Booking.self, data: data)
          completion(.success(decodedData!.data))
        } catch let error {
          print(error.localizedDescription)
        }
      case .failure( let error):
        print(error)
      }
    }
  }
  
  func getDetails(completion: @escaping getListingDetailResponse) {
    let api = APIRequestModel(api: BookingAPI.getdetailsSerice)
    WebServiceHelper().requestAPI(apiModel: api) { response in
      switch response {
      case .success(let data):
        let response = ResponseDecoder()
        do {
          let decodedData = try response.decode(BookingDetail.self, data: data)
          completion(.success(decodedData!.data))
        } catch let error {
          print(error.localizedDescription)
        }
      case .failure( let error):
        print(error)
      }
    }
  }
}
