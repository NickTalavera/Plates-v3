//
//  RemoveButtonTableViewCell.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 7/10/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import UIKit

class RemoveButtonTableViewCell: UITableViewCell {

    var leftLabel: UILabel = UILabel()


        override func awakeFromNib() {
            super.awakeFromNib()
            self.leftLabel.font = GlobalVariables.sharedInstance.fontStandard
            self.contentView.addSubview(leftLabel)
            self.leftLabel.adjustsFontSizeToFitWidth = true
            self.leftLabel.allowsDefaultTighteningForTruncation = true
            let leadingnameTextField = NSLayoutConstraint(item: self.leftLabel, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 10)
            let leadingvalueTextField = NSLayoutConstraint(item: self.leftLabel, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 10)
            let centerYnameTextField = NSLayoutConstraint(item: self.leftLabel, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1, constant: 0)
            self.leftLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([leadingnameTextField,leadingvalueTextField,centerYnameTextField])
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
}
