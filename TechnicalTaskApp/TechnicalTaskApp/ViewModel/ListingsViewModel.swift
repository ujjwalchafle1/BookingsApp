//
//  ListingsViewModel.swift
//  TechnicalTaskApp
//
//  Created by Ujjwal on 08/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation


class ListingViewModel : NSObject{
  
  var apiService = ListingService()
 
  var bookings:[Datum]! {
    didSet{
      self.bindingListVMToController()
    }
  }
  
  var bindingListVMToController : (() -> ()) = {}
  
  override init() {
    super.init()
    self.apiService = ListingService()
    self.getLisitngs()
  }
  
  func getLisitngs()
  {
    self.apiService.getLisitngs { response in
      switch response {
      case .success(let data):
        self.bookings = data
      case .failure(let error):
        print(error)
      }
    }
  }
}
