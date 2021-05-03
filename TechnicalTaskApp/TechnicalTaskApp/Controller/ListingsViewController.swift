//
//  ListingsViewController.swift
//  TechnicalTaskApp
//
//  Created by Jack Warris on 15/09/2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

class ListingsViewController: UITableViewController {
  var bookings:[Datum] = []
  var bookingService: BookingService?
  @IBOutlet weak var loader: UIActivityIndicatorView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    self.title      = "My Bookings"
    bookingService  = BookingService()
    bookingService?.delegate = self
    bookingService?.getBookingData()
  }
    
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return bookings.count
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell              = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookingsCell
    cell.selectionStyle   = .none
    cell.title?.text      = bookings[indexPath.row].title
    cell.type?.text       = "\(bookings[indexPath.row].id)"
    cell.price?.text      = bookings[indexPath.row].driverPrice.data.formatted
    cell.startDate?.text  = bookings[indexPath.row].formatedStartDate
    cell.time?.text       = "\(bookings[indexPath.row].startTime) - \(bookings[indexPath.row].endTime)"
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(bookings[indexPath.row].title)
    let details           =  storyboard?.instantiateViewController(withIdentifier: "DetailsController") as! DetailsController
    details.bookingID     = "4611"//"\(bookings[indexPath.row].id)"
    details.bookingTitle  = "\(bookings[indexPath.row].title)"

    self.present(details, animated:true, completion:nil)
  }
}

extension ListingsViewController: ServiceDelegate  {
  
  func didReciveResponse(response: Any) {
    let response  = response as! Booking
    self.bookings = response.data
    print(response)
    DispatchQueue.main.async {
      self.loader.stopAnimating()
      self.tableView.reloadData()
    }
  }
  
  func didReciveError(error: String) {
    print(error)
  }
}
