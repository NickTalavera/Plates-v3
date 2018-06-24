//
//  BarbellQuickSelectTableViewCell.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 4/28/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import UIKit

class BarbellQuickSelectTableViewCell: UITableViewCell {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        leftLabel.font = GlobalVariables.sharedInstance.fontStandard
        detailLabel.font = GlobalVariables.sharedInstance.fontStandard
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

