//
//  CollarsQuickSelectTableViewCell.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 4/28/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import UIKit
#elseif os(OSX)
    import AppKit
#endif
#if os(iOS)
    import SkyFloatingLabelTextField
#endif
class CollarAdvancedSettingTableViewCell: TableViewCell {
    
    #if os(iOS)
    var nameTextField: SkyFloatingLabelTextField = SkyFloatingLabelTextField()
    var valueTextField: SkyFloatingLabelTextField = SkyFloatingLabelTextField()
    #elseif os(tvOS) || os(OSX)
    var nameTextField: TextField = TextField()
    var valueTextField: TextField = TextField()
    #endif
    var segmentedControl: SegmentedControl = SegmentedControl()
    
    #if os(iOS) || os(tvOS)
    override func awakeFromNib() {
        super.awakeFromNib()
        segmentedControl = SegmentedControl(items: [PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.kilogram), PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.pound)])
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
        let segmentedAttributes: [AnyHashable: Any] = [
            NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard.withSize((GlobalVariables.sharedInstance.fontStandard.pointSize)*0.75)]
        self.segmentedControl.setTitleTextAttributes(segmentedAttributes, for: .normal)
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
        #if os(tvOS)
            centerYnameTextField.constant = 0
            centerYvalueTextField.constant = 0
        #endif
        self.nameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.valueTextField.translatesAutoresizingMaskIntoConstraints = false
        self.segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        #if os(iOS)
            self.nameTextField.lineColor = GlobalVariables.sharedInstance.secondaryColor
            self.valueTextField.lineColor = GlobalVariables.sharedInstance.secondaryColor
        #endif
        NSLayoutConstraint.activate([trailingrightTextField,trailingsegmentedControl,leadingnameTextField,leadingvalueTextField,centerYnameTextField,spaceBetweenTextFields,centerYvalueTextField,centerYsegmentedControl,widthsegmentedControl])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
        #elseif os(OSX)
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        segmentedControl.segmentCount = 2
        segmentedControl.setLabel(PublicClasses.massFormatter.unitStringFromValue(0, unit: NSMassFormatterUnit.Kilogram), forSegment: 0)
        segmentedControl.setLabel(PublicClasses.massFormatter.unitStringFromValue(0, unit: NSMassFormatterUnit.Pound), forSegment: 1)
//        segmentedControl.font = GlobalVariables.sharedInstance.fontStandard
//        self.nameTextField.font = GlobalVariables.sharedInstance.fontStandard
//        self.valueTextField.font = GlobalVariables.sharedInstance.fontStandard
        self.nameTextField.textColor = GlobalVariables.sharedInstance.defaultTextColor
        self.valueTextField.textColor = GlobalVariables.sharedInstance.defaultTextColor
//        let segmentedAttributes: [NSObject: AnyObject] = [NSFontAttributeName: GlobalVariables.sharedInstance.fontStandard.fontWithSize((GlobalVariables.sharedInstance.fontStandard.pointSize)*0.75)]
//        self.segmentedControl.setTitleTextAttributes(segmentedAttributes, forState: .Normal)
        self.addSubview(nameTextField)
        self.addSubview(valueTextField)
        self.addSubview(segmentedControl)
        let trailingrightTextField = NSLayoutConstraint(item: self.nameTextField, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1.0, constant: -10)
        let trailingsegmentedControl = NSLayoutConstraint(item: self.segmentedControl, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1.0, constant: -10)
        let leadingnameTextField = NSLayoutConstraint(item: self.nameTextField, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1.0, constant: 10)
        let leadingvalueTextField = NSLayoutConstraint(item: self.valueTextField, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1.0, constant: 10)
        let spaceBetweenTextFields = NSLayoutConstraint(item: self.valueTextField, attribute: .Trailing, relatedBy: .Equal, toItem: self.segmentedControl, attribute: .Leading, multiplier: 1.0, constant: -10)
        let centerYnameTextField = NSLayoutConstraint(item: self.nameTextField, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 0.5, constant: 0)
        let centerYvalueTextField = NSLayoutConstraint(item: self.valueTextField, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.5, constant: 0)
        let centerYsegmentedControl = NSLayoutConstraint(item: self.segmentedControl, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.5, constant: 0)
//        let widthsegmentedControl = NSLayoutConstraint(item: self.segmentedControl, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 0.33, constant: 0)
//         let heightsegmentedControl = NSLayoutConstraint(item: self.segmentedControl, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 1, constant: 0)
        self.nameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.valueTextField.translatesAutoresizingMaskIntoConstraints = false
        self.segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([trailingrightTextField,trailingsegmentedControl,leadingnameTextField,leadingvalueTextField,centerYnameTextField,spaceBetweenTextFields,centerYvalueTextField,centerYsegmentedControl])
    }
        #endif
}
