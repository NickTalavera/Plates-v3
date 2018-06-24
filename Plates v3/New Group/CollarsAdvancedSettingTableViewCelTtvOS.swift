//
//  CollarsQuickSelectTableViewCell.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 4/28/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import UIKit
#if os(iOS)
import SkyFloatingLabelTextField
    #endif
class CollarAdvancedSettingTableViewCell: UITableViewCell {

#if os(iOS)
    var nameTextField: SkyFloatingLabelTextField = SkyFloatingLabelTextField()
    var valueTextField: SkyFloatingLabelTextField = SkyFloatingLabelTextField()
    #elseif os(tvOS)
    var nameTextField: UITextField = UITextField()
    var valueTextField: UITextField = UITextField()
    #endif
    var segmentedControl: UISegmentedControl = UISegmentedControl()


    override func awakeFromNib() {
        super.awakeFromNib()
        segmentedControl = UISegmentedControl(items: [PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.kilogram), PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.pound)])
        self.selectionStyle = UITableViewCellSelectionStyle.none
        self.nameTextField.font = GlobalVariables.sharedInstance.fontStandard
        self.valueTextField.font = GlobalVariables.sharedInstance.fontStandard
        self.nameTextField.textColor = GlobalVariables.sharedInstance.defaultTextColor
        //        self.valueTextField.adjustsFontSizeToFitWidth = true
        //        self.nameTextField.adjustsFontSizeToFitWidth = true
        self.valueTextField.textColor = GlobalVariables.sharedInstance.defaultTextColor
        self.valueTextField.keyboardType = UIKeyboardType.decimalPad
        self.nameTextField.keyboardType = UIKeyboardType.alphabet
        self.valueTextField.layer.zPosition=1
        let segmentedAttributes: [NSObject: AnyObject] = [
            NSFontAttributeName as NSObject: GlobalVariables.sharedInstance.fontStandard.withSize((GlobalVariables.sharedInstance.fontStandard.pointSize)*0.75)]
        self.segmentedControl.setTitleTextAttributes(segmentedAttributes, for: .normal)
        self.contentView.addSubview(nameTextField)
        self.contentView.addSubview(valueTextField)
        self.contentView.addSubview(segmentedControl)
        self.nameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.valueTextField.translatesAutoresizingMaskIntoConstraints = false
        self.segmentedControl.translatesAutoresizingMaskIntoConstraints = false



        let centerYnameTextField = NSLayoutConstraint(item: self.nameTextField, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 2/6*1, constant: 0)
        let centerYvalueTextField = NSLayoutConstraint(item: self.valueTextField, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 2/6*3, constant: 0)
        let centerYsegmentedControl = NSLayoutConstraint(item: self.segmentedControl, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 2/6*5, constant: 0)
        let widthNameTextField = NSLayoutConstraint(item: self.nameTextField, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 1, constant: 0)
        let widthValueTextField = NSLayoutConstraint(item: self.valueTextField, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 1, constant: 0)
        let centerXsegmentedControl = NSLayoutConstraint(item: self.segmentedControl, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1, constant: 0)
        let centerXValueTextField = NSLayoutConstraint(item: self.valueTextField, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1, constant: 0)
        let centerXNameTextField = NSLayoutConstraint(item: self.nameTextField, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1, constant: 0)
        let widthsegmentedControl = NSLayoutConstraint(item: self.segmentedControl, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([centerXValueTextField,centerXNameTextField,widthsegmentedControl,centerXsegmentedControl,widthValueTextField,widthNameTextField,centerYnameTextField,centerYvalueTextField,centerYsegmentedControl])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
