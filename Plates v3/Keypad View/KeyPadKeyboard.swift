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
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        PublicClasses.keyboardWillShow(notification: notification, textFieldFrame: weightEntryTextField.frame, pageView: self.view)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        PublicClasses.keyboardWillHide(notification: notification, textFieldFrame: weightEntryTextField.frame, pageView: self.view)
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.weightEntryTextField.alwaysShowFloatingLabel  = false
        var placeholderValue: Double = 0
        if textField.text!.count > 0 {
            placeholderValue = (PublicClasses.numberFormatterDecimal.number(from: textField.text!)?.doubleValue.rounded(toPlaces: app.profile.chosenUnit.decimalPlaces))!
        }
        if app.status.percentageModeActive == true {
            app.calc.percentage = (placeholderValue.rounded(toPlaces: 1))
            textField.text = PublicClasses.numberFormatterDecimal.string(from: NSNumber(value: app.calc.percentage))
        }
        else {
            app.calc.weightToLift = placeholderValue
            if placeholderValue != 0 {
            weightEntryTextField.text = PublicClasses.massFormatter.string(fromValue: placeholderValue, unit: app.profile.chosenUnit.formatter)
            }
            else {
                weightEntryTextField.text = ""
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.weightEntryTextField.alwaysShowFloatingLabel  = true
        if app.calc.weightToLift != 0 {
            textField.text = app.calc.weightToLift.clean
        }
        else {
            textField.text = ""
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var result: Bool = false
        if app.status.percentageModeActive == true {
            result = PublicClasses.textFieldDecimalVerification(textField, range: range, string: string, maxDecimalPlaces: 0, maxIntegerPlaces: 3, percentageMode: app.status.percentageModeActive)
            if result == true {
                GoButton.isEnabled = true
                UIView.transition(with: GoButton, duration: app.visuals.platesFadeDuration, options: [.transitionCrossDissolve], animations: {
                    self.GoButton.setTitle(NSLocalizedString("Calculate", comment: ""), for: .normal)
                }, completion: nil)
            }
        }
        else {
            result = PublicClasses.textFieldDecimalVerification(textField, range: range, string: string, maxDecimalPlaces: app.profile.chosenUnit.decimalPlaces, maxIntegerPlaces: 4, percentageMode: app.status.percentageModeActive)
            if result == true {
                GoButton.isEnabled = true
                UIView.transition(with: GoButton, duration: app.visuals.platesFadeDuration, options: [.transitionCrossDissolve], animations: {
                    self.GoButton.setTitle(NSLocalizedString("Calculate", comment: ""), for: .normal)
                }, completion: nil)
            }
            //            //            self.weightEntryTextField.title = NSLocalizedString("Total weight", comment: "")
            //            //            GlobalVariables.sharedInstance.weightToLift = GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight
            //            //            GlobalVariables.sharedInstance.currentPlatesInUse = [Double]()
            //            //            PublicClasses.drawPlates(self.platesView)
        }
        if result == true && self.platesLabel.alpha != 0 {
            //            self.platesLabel.alpha = 1
            //            self.platesView.alpha = 1
            //            UIView.animate(withDuration: app.visuals.platesFadeDuration, delay: 0.0, options: [], animations: {
            //                self.platesLabel.alpha = 0
            //                self.platesView.alpha = 0
            //            }, completion: {
            //                (value: Bool) in
            //                self.platesLabel.text = ""
            //            })
            //
            //            app.status.errorState = false
            //            //            self.weightEntryTextField.errorMessage = ""
            //            PublicClasses.setPlatesButtonsEnabledStatus(self.platesLabel, FiftyFiveLbsButton: self.FiftyFiveLbsButton, FortyFiveLbsButton: self.FortyFiveLbsButton, ThirtyFiveLbsButton: self.ThirtyFiveLbsButton, TwentyFiveLbsButton: self.TwentyFiveLbsButton, FifteenLbsButton: self.FifteenLbsButton, TenLbsButton: self.TenLbsButton, FiveLbsButton: self.FiveLbsButton, TwoPointFiveLbsButton: self.TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: self.OnePointTwoFiveLbsButton, weightEntryTextField: self.weightEntryTextField, platesView: self.platesView)
        }
        return result
    }
    
    func weightEntryTextFinder() {
        //        let weightEntryTextFieldButtonTemp = UIButton(frame: weightEntryTextField.frame)
        //        weightEntryTextFieldButtonTemp.setTitle(NSLocalizedString("Weight to lift", comment: ""), for: .normal)
        //        weightEntryTextFieldButtonTemp.titleLabel?.font = Font.systemFont(ofSize: GlobalVariables.sharedInstance.currentMaxFont, weight: UIFont.Weight.thin)
        //        let pointSizeWeightEntryTextField = PublicClasses.getFontSizeToFitFrameOfLabel(weightEntryTextFieldButtonTemp, maxTextSize: GlobalVariables.sharedInstance.currentMaxFont, frameToFit: weightEntryTextField.frame)
        //        if pointSizeWeightEntryTextField < GlobalVariables.sharedInstance.currentMaxFont {
        //            GlobalVariables.sharedInstance.weightToLiftString = NSLocalizedString("Weight", comment: "")
        //        }
        //        else {
        //            GlobalVariables.sharedInstance.weightToLiftString = NSLocalizedString("Weight to lift", comment: "")
        //        }
        //        weightEntryTextField.placeholder = GlobalVariables.sharedInstance.weightToLiftString
    }
}

