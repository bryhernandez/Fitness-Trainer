//
//  ViewScheduleCell.swift
//  Fitness Trainer
//
//  Created by Oscar on 11/14/21.
//

import UIKit

class ViewScheduleCell: UITableViewCell {
    
    @IBOutlet weak var Date: UILabel!
    
    @IBOutlet weak var workout: UILabel!
    
    @IBOutlet weak var sets: UILabel!
    
    @IBOutlet weak var reps: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
