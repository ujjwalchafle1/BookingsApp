//
//  BookingsCell.swift
//  TechnicalTaskApp
//
//  Created by Ujjwal on 02/05/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import UIKit

class BookingsCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var holderView: UIView!

  
    override func awakeFromNib() {
        super.awakeFromNib()
      Constants().dropShadow(holderView)
    }

  override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
