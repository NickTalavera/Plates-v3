//
//  CollarsQuickSelectTableViewCell.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 4/28/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//


    import UIKit
import SkyFloatingLabelTextField

class advancedSettingTableViewCell: UITableViewCell {
    var nameTextField: SkyFloatingLabelTextField = SkyFloatingLabelTextField()
    var valueTextField: SkyFloatingLabelTextField = SkyFloatingLabelTextField()
    var segmentedControl: UISegmentedControl = UISegmentedControl()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.segmentedControl = UISegmentedControl(items: [PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.kilogram), PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.pound)])
        let segmentedAttributes: [AnyHashable: Any] = [
            NSAttributedStringKey.font: app.visuals.fontStandard.withSize((app.visuals.fontStandard.pointSize)*0.75)]
        self.segmentedControl.setTitleTextAttributes(segmentedAttributes, for: UIControlState())
        self.selectionStyle = UITableViewCellSelectionStyle.none
        self.nameTextField.font = app.visuals.fontStandard
        self.valueTextField.font = app.visuals.fontStandard
        self.nameTextField.lineColor = app.visuals.secondaryColor
        self.valueTextField.lineColor = app.visuals.secondaryColor
        self.segmentedControl.tintColor = app.visuals.secondaryColor
        self.nameTextField.textColor = app.visuals.defaultTextColor
        self.valueTextField.textColor = app.visuals.defaultTextColor
        self.valueTextField.adjustsFontSizeToFitWidth = true
        self.nameTextField.adjustsFontSizeToFitWidth = true
        self.valueTextField.keyboardType = UIKeyboardType.decimalPad
        self.nameTextField.keyboardType = UIKeyboardType.alphabet
        self.valueTextField.layer.zPosition=1
        self.nameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.valueTextField.translatesAutoresizingMaskIntoConstraints = false
        self.segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(nameTextField)
        self.contentView.addSubview(valueTextField)
        self.contentView.addSubview(segmentedControl)
        
        
        let trailingrightTextField = NSLayoutConstraint(item: self.nameTextField, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0)
        let trailingsegmentedControl = NSLayoutConstraint(item: self.segmentedControl, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0)
        let leadingnameTextField = NSLayoutConstraint(item: self.nameTextField, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 10)
        let leadingvalueTextField = NSLayoutConstraint(item: self.valueTextField, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 10)
        let spaceBetweenTextFields = NSLayoutConstraint(item: self.valueTextField, attribute: .trailing, relatedBy: .equal, toItem: self.segmentedControl, attribute: .leading, multiplier: 1.0, constant: -10)
        let centerYnameTextField = NSLayoutConstraint(item: self.nameTextField, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 0.5, constant: -10)
        let centerYvalueTextField = NSLayoutConstraint(item: self.valueTextField, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1.5, constant: -10)
        let centerYsegmentedControl = NSLayoutConstraint(item: self.segmentedControl, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1.5, constant: 0)
        let widthsegmentedControl = NSLayoutConstraint(item: self.segmentedControl, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.33, constant: 0)
        NSLayoutConstraint.activate([trailingrightTextField,trailingsegmentedControl,leadingnameTextField,leadingvalueTextField,centerYnameTextField,spaceBetweenTextFields,centerYvalueTextField,centerYsegmentedControl,widthsegmentedControl])
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
