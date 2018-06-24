//
//  advancedSettingTableViewCellAddSubtract.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 7/10/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import UIKit

class DoneTableViewCell: UITableViewCell {

    var doneButton: UIButton = UIButton(type: .system)
    var removeButton: UIButton = UIButton(type: .system)


        override func awakeFromNib() {
            super.awakeFromNib()
            self.selectionStyle = UITableViewCellSelectionStyle.none    
            self.doneButton.titleLabel?.font = GlobalVariables.sharedInstance.fontStandard
            self.removeButton.titleLabel?.font = GlobalVariables.sharedInstance.fontStandard
            doneButton.setTitle(NSLocalizedString("Done", comment: ""), for: .normal)
            removeButton.setTitle(NSLocalizedString("Remove", comment: ""), for: .normal)
            self.contentView.addSubview(doneButton)
            self.contentView.addSubview(removeButton)
            let leadingnameTextField = NSLayoutConstraint(item: self.doneButton, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 10)
            let leadingvalueTextField = NSLayoutConstraint(item: self.removeButton, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 10)
            let spaceBetweenTextFields = NSLayoutConstraint(item: self.doneButton, attribute: .trailing, relatedBy: .equal, toItem: self.removeButton, attribute: .leading, multiplier: 1.0, constant: -60)
            let centerYnameTextField = NSLayoutConstraint(item: self.doneButton, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1, constant: 0)
            let centerYvalueTextField = NSLayoutConstraint(item: self.removeButton, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1, constant: 0)
            let widthsEqualizer = NSLayoutConstraint(item: self.doneButton, attribute: .width, relatedBy: .equal, toItem: self.removeButton, attribute: .width, multiplier: 1.0, constant: 0)
            self.doneButton.translatesAutoresizingMaskIntoConstraints = false
            self.removeButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([widthsEqualizer, leadingnameTextField,leadingvalueTextField,centerYnameTextField,spaceBetweenTextFields,centerYvalueTextField])
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
}
