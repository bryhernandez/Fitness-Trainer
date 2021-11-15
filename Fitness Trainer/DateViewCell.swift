//
//  DateViewCell.swift
//  Fitness Trainer
//
//  Created by Oscar on 11/14/21.
//

import UIKit

class DateViewCell: UITableViewCell {
    
    @IBOutlet weak var month: UILabel!
    
    @IBOutlet weak var day: UILabel!
    
    @IBOutlet weak var year: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
