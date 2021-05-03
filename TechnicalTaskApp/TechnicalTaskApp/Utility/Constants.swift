//
//  Constants.swift
//  TechnicalTaskApp
//
//  Created by Ujjwal on 03/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
import UIKit

class Constants
{
  // MARK: Error Messages
  let kInvalidURLError  = "Invalid URL"
  let kInvalidPostData  = "Invalid post data"
  let KEmptyData        = "There is no data"
  
  public static func formatDate(_ date: String , _ outputFormat: String, _ inputFormat: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> String
  {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
    dateFormatter.dateFormat = inputFormat//"yyyy-MM-dd HH:mm:ss"
    
    let dateFormatterPrint = DateFormatter()
    
    dateFormatterPrint.dateFormat = outputFormat
    
    if let date = dateFormatter.date(from: date) {
      return dateFormatterPrint.string(from: date)
    }
    return ""
  }
  
  public func dropShadow(_ view: UIView)
  {
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOpacity = 1
    view.layer.shadowOffset = .zero
    view.layer.shadowRadius = 10
  }
}
