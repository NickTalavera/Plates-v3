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
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if keyboardSize.height >= weightEntryTextField.frame.minY {
                app.status.keypadMovedUp = true
                self.view.frame.origin.y -= keyboardSize.height - weightEntryTextField.frame.minY
            }
            app.status.keyboardHeight = keyboardSize.height
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            print("HELP2")
            print(app.status.keypadMovedUp)
            if app.status.keypadMovedUp == true {
                print("HELP")
                var keyBoardHeightT: CGFloat = keyboardSize.height
                if keyboardSize.height == 0 {
                    keyBoardHeightT = app.status.keyboardHeight
                }
                self.view.frame.origin.y += keyBoardHeightT - weightEntryTextField.frame.minY
                app.status.keypadMovedUp = false
            }
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let placeholderValue = PublicClasses.numberFormatterDecimal.number(from: textField.text!)?.doubleValue.rounded(toPlaces: app.profile.chosenUnit.decimalPlaces)
        if textField.text!.count > 0 {
            if app.status.percentageModeActive == true {
                app.calc.percentage = (placeholderValue?.rounded(toPlaces: 1))!
                textField.text = PublicClasses.numberFormatterDecimal.string(from: NSNumber(value: app.calc.percentage))
            }
            else {
                weightEntryTextField.text = PublicClasses.massFormatter.string(fromValue: placeholderValue!, unit: app.profile.chosenUnit.formatter)
            }
        }
        else {
            textField.text = ""
        }
        self.weightEntryTextField.alwaysShowFloatingLabel  = false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.weightEntryTextField.alwaysShowFloatingLabel  = true
        if app.calc.weightToLift != 0 {
            textField.text = PublicClasses.numberFormatterDecimal.string(from: app.calc.weightToLift as NSNumber)
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

