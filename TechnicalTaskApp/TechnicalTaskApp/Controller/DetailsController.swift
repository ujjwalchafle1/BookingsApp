//
//  DetailsController.swift
//  TechnicalTaskApp
//
//  Created by Ujjwal on 02/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {

  //vehicle details
  @IBOutlet weak var carMake: UILabel!
  @IBOutlet weak var carModel: UILabel!
  @IBOutlet weak var carRegistration: UILabel!
  @IBOutlet weak var titleLbl: UILabel!
  
  //dates
  @IBOutlet weak var startDateLbl: UILabel!
  @IBOutlet weak var endDateLbl: UILabel!
  @IBOutlet weak var startTimeLbl: UILabel!
  @IBOutlet weak var endTimeLbl: UILabel!
  
  //Address
  @IBOutlet weak var addressLbl: UILabel!
  @IBOutlet weak var amount: UILabel!
  
  var bookingID: String?
  var bookingTitle: String?
  var bookingService: BookingService?

  var paymentDetails: PaymentMethod?

    override func viewDidLoad() {
        super.viewDidLoad()
      dropShadow(addressLbl)
      dropShadow(amount)
      
      bookingService = BookingService()
      bookingService?.delegate = self
      bookingService?.getBookingDetails()
    }
    
  func dropShadow(_ view: UIView){
    view.layer.cornerRadius = 5.0
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOpacity = 1
    view.layer.shadowOffset = .zero
    view.layer.shadowRadius = 5
  }
    
  @IBAction func showOnMap(_ sender: Any) {
  }
  
  @IBAction func showPaymentDetails(_ sender: UIButton) {
  }
  
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let destinationVC = segue.destination as! PaymentDetailsController
      destinationVC.paymentDetails = self.paymentDetails
    }
    

}

extension DetailsController: ServiceDelegate
{
  func didReciveResponse(response: Any)
  {
    let response = response as! BookingDetail
      DispatchQueue.main.async {
        self.titleLbl?.text         = self.bookingTitle
        self.carRegistration?.text  = response.data.vehicle.registration
        self.carMake?.text          = response.data.vehicle.make
        self.carModel?.text         = response.data.vehicle.model
        
        self.startDateLbl?.text     = response.data.formatedStartDate
        self.endDateLbl?.text       = response.data.formatedEndDate
        self.startTimeLbl?.text     = response.data.startTime
        self.endTimeLbl?.text       = response.data.endTime

        self.addressLbl?.text       = "\(response.data.listing.address.houseNo), \(response.data.listing.address.address1), \(response.data.listing.address.city), \(response.data.listing.address.postalCode)"
        
        self.amount?.text           = "Total: \(response.data.driverTotal.formatted)"
        
        self.paymentDetails         = response.data.paymentMethod
      }
  }
  
  func didReciveError(error: String) {
    print(error)
  }
  

}
