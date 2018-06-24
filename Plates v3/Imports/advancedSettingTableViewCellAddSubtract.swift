//
//  advancedSettingTableViewCellAddSubtract.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 7/10/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import UIKit

class advancedSettingTableViewCellAddSubtract: UITableViewCell {

    var addButton: UIButton = UIButton(type: .system)
    var removeButton: UIButton = UIButton(type: .system)
    var label = UILabel()

        override func awakeFromNib() {
            super.awakeFromNib()
//            self.selectionStyle = UITableViewCellSelectionStyle.None    
//            self.addButton.titleLabel?.font = GlobalVariables.sharedInstance.fontStandard
//            self.removeButton.titleLabel?.font = GlobalVariables.sharedInstance.fontStandard
//            addButton.setTitle(NSLocalizedString("Add", comment: ""), forState: .Normal)
//            removeButton.setTitle(NSLocalizedString("Remove", comment: ""), forState: .Normal)
//            let image = UIImage(named: "SecondaryColorImage")
//            removeButton.setBackgroundImage(image, forState: .Normal)
//            removeButton.backgroundColor = Color.clearColor()
//            self.contentView.addSubview(addButton)
////            addButton.hidden = true
//            self.contentView.addSubview(removeButton)
//            let leadingnameTextField = NSLayoutConstraint(item: self.addButton, attribute: .Leading, relatedBy: .Equal, toItem: self.contentView, attribute: .LeadingMargin, multiplier: 1.0, constant: 10)
//            let leadingvalueTextField = NSLayoutConstraint(item: self.removeButton, attribute: .Trailing, relatedBy: .Equal, toItem: self.contentView, attribute: .TrailingMargin, multiplier: 1.0, constant: 10)
//            let spaceBetweenTextFields = NSLayoutConstraint(item: self.addButton, attribute: .Trailing, relatedBy: .Equal, toItem: self.removeButton, attribute: .Leading, multiplier: 1.0, constant: -10)
//            let centerYnameTextField = NSLayoutConstraint(item: self.addButton, attribute: .CenterY, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterY, multiplier: 1, constant: 0)
//            let centerYvalueTextField = NSLayoutConstraint(item: self.removeButton, attribute: .CenterY, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterY, multiplier: 1, constant: 0)
//            let widthsEqualizer = NSLayoutConstraint(item: self.addButton, attribute: .Width, relatedBy: .Equal, toItem: self.removeButton, attribute: .Width, multiplier: 1.0, constant: 0)
//
//            let heightButtons = NSLayoutConstraint(item: self.removeButton, attribute: .Height, relatedBy: .Equal, toItem: self.contentView, attribute: .Height, multiplier: 1, constant: 0)
//            let heightsEqualizer = NSLayoutConstraint(item: self.addButton, attribute: .Height, relatedBy: .Equal, toItem: self.removeButton, attribute: .Height, multiplier: 1.0, constant: 0)
//            self.addButton.translatesAutoresizingMaskIntoConstraints = false
//            self.removeButton.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activateConstraints([heightsEqualizer,heightButtons,widthsEqualizer, leadingnameTextField,leadingvalueTextField,centerYnameTextField,spaceBetweenTextFields,centerYvalueTextField])
            label.textColor = GlobalVariables.sharedInstance.defaultTextColor
            label.textAlignment = NSTextAlignment.center
            self.label.font = GlobalVariables.sharedInstance.fontStandard
                        label.text = NSLocalizedString("Add", comment: "")
            self.contentView.addSubview(label)
            let centerYnameTextField = NSLayoutConstraint(item: self.label, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1, constant: 0)
            let centerYvalueTextField = NSLayoutConstraint(item: self.label, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1, constant: 0)
            let widthsEqualizer = NSLayoutConstraint(item: self.label, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 1.0, constant: 0)
            let heightButtons = NSLayoutConstraint(item: self.label, attribute: .height, relatedBy: .equal, toItem: self.contentView, attribute: .height, multiplier: 1, constant: 0)
            self.label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([heightButtons,widthsEqualizer,centerYnameTextField,centerYvalueTextField])
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
}
