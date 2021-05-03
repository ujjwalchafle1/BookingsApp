// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let bookingDetail = try? newJSONDecoder().decode(BookingDetail.self, from: jsonData)

import Foundation

// MARK: - BookingDetail
struct BookingDetail: Codable {
  let data: Details
}

// MARK: - DataClass
struct Details: Codable {
  let id: Int
  let createdAt: String
  let driverTotal: DriverTotal
  let endDate: String
  let paymentMethod: PaymentMethod
  let status, startDate: String
  let vehicle: Vehicle
  let listing: Listing
  
  enum CodingKeys: String, CodingKey {
    case id
    case createdAt = "created_at"
    case driverTotal = "driver_total"
    case endDate = "end_date"
    case paymentMethod = "payment_method"
    case status
    case startDate = "start_date"
    case vehicle, listing
  }
  
  var formatedStartDate: String {
    get {
      Constants.formatDate(startDate, "MMM dd yyyy", "yyyy-MM-dd HH:mm:ss" )
    }
  }
  
  var startTime: String {
    get {
      Constants.formatDate(startDate, "HH:mm", "yyyy-MM-dd HH:mm:ss")
    }
  }
  
  var formatedEndDate: String {
    get {
      Constants.formatDate(endDate, "MMM dd yyyy", "yyyy-MM-dd HH:mm:ss")
    }
  }
  
  var endTime: String {
    get {
      Constants.formatDate(endDate, "HH:mm", "yyyy-MM-dd HH:mm:ss")
    }
  }
}

// MARK: - DriverTotal
struct DriverTotal: Codable {
  let formatted: String
}

// MARK: - Listing
struct Listing: Codable {
  let id: Int
  let title, lng, type: String
  let address: Address
}

// MARK: - Address
struct Address: Codable {
    let location: Location
    let city, address1: String
    let id: Int
    let country, houseNo, postalCode: String
    let address3, state, address2: JSONNull?

    enum CodingKeys: String, CodingKey {
        case location, city, address1, id, country
        case houseNo = "house_no"
        case postalCode = "postal_code"
        case address3, state, address2
    }
}

// MARK: - Location
struct Location: Codable {
    let lat, lng: Double
}
// MARK: - PaymentMethod
struct PaymentMethod: Codable {
  let id: Int
  let authority: JSONNull?
  let expiryDate, source, cardType, lastFour: String
  let name: String
  
  enum CodingKeys: String, CodingKey {
    case id, authority
    case expiryDate = "expiry_date"
    case source
    case cardType = "card_type"
    case lastFour = "last_four"
    case name
  }
  
  var formatedExpDate: String {
    get {
      Constants.formatDate(expiryDate, "MM yy", "yyyy-MM-dd HH:mm:ss")
    }
  }
}

// MARK: - Vehicle
struct Vehicle: Codable {
  let id: Int
  let registration, modelID, make, model: String
  
  enum CodingKeys: String, CodingKey {
    case id, registration
    case modelID = "model_id"
    case make, model
  }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
  
  public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
    return true
  }
  
  public var hashValue: Int {
    return 0
  }
  
  public init() {}
  
  public required init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if !container.decodeNil() {
      throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
    }
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encodeNil()
  }
}
