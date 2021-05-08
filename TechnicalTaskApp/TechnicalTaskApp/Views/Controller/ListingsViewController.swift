//
//  ListingsViewController.swift
//  TechnicalTaskApp
//
//  Created by Jack Warris on 15/09/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

class ListingsViewController: UITableViewController {

  @IBOutlet weak var loader: UIActivityIndicatorView!

  var listingVM: ListingViewModel!
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    self.title      = "My Bookings"
    callToViewModelForUIUpdate()
  }
  
  func callToViewModelForUIUpdate()
  {
    self.listingVM = ListingViewModel()
    self.listingVM.bindingListVMToController = {
      DispatchQueue.main.async {
        self.loader.stopAnimating()
        self.tableView.reloadData()
      }
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.listingVM.bookings != nil ? self.listingVM.bookings!.count: 0
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell              = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookingsCell
    cell.selectionStyle   = .none
    cell.title?.text      = listingVM.bookings[indexPath.row].title
    cell.type?.text       = "\(listingVM.bookings[indexPath.row].id)"
    cell.price?.text      = listingVM.bookings[indexPath.row].driverPrice.data.formatted
    cell.startDate?.text  = listingVM.bookings[indexPath.row].formatedStartDate
    cell.time?.text       = "\(listingVM.bookings[indexPath.row].startTime) - \(listingVM.bookings[indexPath.row].endTime)"
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(listingVM.bookings[indexPath.row].title)
    let details           =  storyboard?.instantiateViewController(withIdentifier: "DetailsController") as! DetailsController
    details.bookingID     = "4611"//"\(bookings[indexPath.row].id)"
    details.bookingTitle  = "\(listingVM.bookings[indexPath.row].title)"

    self.present(details, animated:true, completion:nil)
  }
}
