// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let booking = try? newJSONDecoder().decode(Booking.self, from: jsonData)

import Foundation

// MARK: - Booking
struct Booking: Codable {
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let startDate: String
    let driverID: Int
    let endDate: String
    let type, title: String
    let ownerID: Int
    let driverPrice: DriverPrice
    let timezone: String
    let photos: [String]
    let autoPay: Bool
    let status: String
    let infinite: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case startDate = "start_date"
        case driverID = "driver_id"
        case endDate = "end_date"
        case type, title
        case ownerID = "owner_id"
        case driverPrice = "driver_price"
        case timezone, photos
        case autoPay = "auto_pay"
        case status, infinite
    }
  
  var formatedStartDate: String {
    get {
      Constants.formatDate(startDate, "MMM dd yyyy")
    }
  }
  
  var startTime: String {
    get {
      Constants.formatDate(startDate, "HH:mm")
    }
  }
  
  var formatedEndDate: String {
    get {
      Constants.formatDate(endDate, "MMM dd yyyy")
    }
  }
  
  var endTime: String {
    get {
      Constants.formatDate(endDate, "HH:mm")
    }
  }
}

// MARK: - DriverPrice
struct DriverPrice: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let formatted: String
}
