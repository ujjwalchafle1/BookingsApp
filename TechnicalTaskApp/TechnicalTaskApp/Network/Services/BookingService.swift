//
//  CSViewModel.swift
//  BreakingBadSwiftUI
//
//  Created by Ujjwal on 28/02/2021.
//

import Foundation

/// Protocol to notify Success or Failure of the API call
protocol ServiceDelegate
{
  func didReciveResponse(response: Any)
  func didReciveError(error: String)
}

/// service for handling the data required for view
struct BookingService
{
  var delegate:ServiceDelegate?
  
  /// function to make API call to get the data
  func getBookingData()
  {
    let network = NetworkManager()
    network.getData(method: .GET, endpoint: .bookingListing, dictionary: nil, type: Booking.self) { (result) in
      switch result {
      case .Success(let result):
        delegate?.didReciveResponse(response: result as Booking)
      case .Error(let error):
        delegate?.didReciveError(error: error)
      }
    }
  }
  
  /// function to make API call to get the details
  func getBookingDetails()
  {
    let network = NetworkManager()
    network.getData(method: .GET, endpoint: .bookingDetails, dictionary: nil, type: BookingDetail.self) { (result) in
      switch result {
      case .Success(let result):
        delegate?.didReciveResponse(response: result as BookingDetail)
      case .Error(let error):
        delegate?.didReciveError(error: error)
      }
    }
  }
}
