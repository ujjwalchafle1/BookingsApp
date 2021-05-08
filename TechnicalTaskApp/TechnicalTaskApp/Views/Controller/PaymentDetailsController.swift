//
//  PaymentDetailsController.swift
//  TechnicalTaskApp
//
//  Created by Ujjwal on 03/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class PaymentDetailsController: UIViewController {


  @IBOutlet weak var cardView: UIView!
  @IBOutlet weak var cardTypeLbl: UILabel!
  @IBOutlet weak var cardNumberLbl: UILabel!
  @IBOutlet weak var ownerNameLbl: UILabel!
  @IBOutlet weak var validityLbl: UILabel!
  
  var paymentDetails:PaymentMethod?
  
  override func viewDidLoad() {
        super.viewDidLoad()

    self.cardTypeLbl.text   = paymentDetails!.cardType
    self.cardNumberLbl.text = "xxxx xxxx xxxx \(paymentDetails!.lastFour)"
    self.ownerNameLbl.text  = paymentDetails?.name
    self.validityLbl.text   = paymentDetails?.formatedExpDate
    Constants().dropShadow(cardView)
  }
    
  @IBAction func closeAction(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
}
