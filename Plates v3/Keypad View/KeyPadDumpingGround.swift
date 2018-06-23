//
//  KeyPadDumpingGround.swift
//  Plates v3
//
//  Created by Nicholas Talavera on 6/23/18.
//  Copyright © 2018 Nicholas Talavera. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension KeyPadViewController {
    
    @objc(adaptivePresentationStyleForPresentationController:) func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    func setupToScreenShot() {
        UIApplication.shared.isStatusBarHidden = true
    }
    
    func setupToScreenShotLaunchScreen() {
        platesLabel.textColor = UIColor.clear
        FiftyFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        FortyFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        ThirtyFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        TwentyFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        FifteenLbsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        TenLbsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        RemoveButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        FiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        TwoPointFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        OnePointTwoFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        PercentButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        ClearButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        BarbellButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        CollarsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        InventoryButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        UnitsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        GoButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        FiftyFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        FortyFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        ThirtyFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        TwentyFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        FifteenLbsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        TenLbsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        RemoveButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        FiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        TwoPointFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        OnePointTwoFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        PercentButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        ClearButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        BarbellButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        CollarsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        InventoryButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        UnitsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        GoButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        goButtonWidthConstraint.constant = GoButton.frame.height
        self.navigationItem.titleView = UILabel()
        //        weightEntryTextField.textColor = UIColor.clear
        //        weightEntryTextField.titleColor = UIColor.clear
        //        weightEntryTextField.placeholderColor = UIColor.clear
        platesView.backgroundColor = UIColor.clear
        //        titleLabel.textColor = UIUIColor.clear
        //        weightEntryTextField.UIColor = UIColor.clear
        barbuttonitem.tintColor = UIColor.clear
        //        weightEntryTextField.placeholder = ""
        barbuttonitem.title = ""
        UIApplication.shared.isStatusBarHidden = true
    }
    
}

