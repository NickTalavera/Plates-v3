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
class GymAdvancedSettingTableViewCell: UITableViewCell {

    var segmentedControl: UISegmentedControl = UISegmentedControl()
    var leftLabel = UILabel()
    var plateCountLabel = UILabel.init()
    #if os(iOS)
    var stepperControl = UIStepper()
    var titleTextField = SkyFloatingLabelTextField()
    #elseif os(tvOS)
    var titleTextField = UITextField()
    #endif
    var removeButton = UIButton()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
