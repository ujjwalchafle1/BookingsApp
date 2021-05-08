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

  var paymentDetails: PaymentMethod?

    override func viewDidLoad() {
        super.viewDidLoad()
      dropShadow(addressLbl)
      dropShadow(amount)
//
//      bookingService = BookingService()
//      bookingService?.delegate = self
//      bookingService?.getBookingDetails()
      
      ListingService().getDetails { response in
        switch response {
        case .success(let data) :
            DispatchQueue.main.async {
              self.titleLbl?.text         = self.bookingTitle
              self.carRegistration?.text  = data.vehicle.registration
              self.carMake?.text          = data.vehicle.make
              self.carModel?.text         = data.vehicle.model
              
              self.startDateLbl?.text     = data.formatedStartDate
              self.endDateLbl?.text       = data.formatedEndDate
              self.startTimeLbl?.text     = data.startTime
              self.endTimeLbl?.text       = data.endTime

              self.addressLbl?.text       = "\(data.listing.address.houseNo), \(data.listing.address.address1), \(data.listing.address.city), \(data.listing.address.postalCode)"
              
              self.amount?.text           = "Total: \(data.driverTotal.formatted)"
              
              self.paymentDetails         = data.paymentMethod
            }
        case .failure(let error):
          print(error)
        }
      }
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
