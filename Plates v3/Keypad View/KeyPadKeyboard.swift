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
        //        if self.view.isTopViewInWindow() == true {
        //            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
        //                //            self.view.frame.origin.y -= keyboardSize.height
        //                if keyboardSize.height >= weightEntryTextField.frame.minY {
        //                    app.status.keypadMovedUp = true
        //                    self.view.frame.origin.y -= keyboardSize.height - weightEntryTextField.frame.minY
        //                }
        //                self.keyboardHeight = keyboardSize.height
        //            }
        //        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if app.status.keypadMovedUp == true {
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
        var placeholderText: String = textField.text!
        placeholderText = PublicClasses.removeUnitsFromText(placeholderText)
        if placeholderText.characters.count > 0 {
            if app.status.percentageModeActive == true {
                //                textField.text = PublicClasses.numberFormatterDecimal.string(from: (PublicClasses.numberFormatterDecimal.number(from: placeholderText)!.doubleValue/100).roundToPlaces(2) as NSNumber)
            }
            else {
                //                textField.text = PublicClasses.massFormatter.string(fromValue: PublicClasses.numberFormatterDecimal.number(from: placeholderText)!.doubleValue.roundToPlaces(GlobalVariables.sharedInstance.currentDecimalPlaces), unit: GlobalVariables.sharedInstance.unitsFormatter)
            }
        }
        else {
            weightEntryTextField.placeholder = PublicClasses.massFormatter.string(fromValue: app.calc.weightToLift, unit: app.profile.chosenUnit.formatter)
            //            weightEntryTextField.setTitleVisible(false, animated: true, animationCompletion: { (Bool) in
            //                PublicClasses.setToWeightTextField(self.weightEntryTextField, platesView: self.platesView)
            //            })
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //        weightEntryTextField.setTitleVisible(true, animated: true)
        textField.text = PublicClasses.numberFormatterDecimal.string(from: app.calc.weightToLift as NSNumber)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { // return NO to not change
        var result: Bool = false
        if app.status.percentageModeActive == true {
            //            result = PublicClasses.textFieldDecimalVerification(textField, range: range, string: string, GoButton: GoButton, maxDecimalPlaces: 0, maxIntegerPlaces: 3, percentageMode: GlobalVariables.sharedInstance.percentageModeActive)
        }
        else {
            //            result = PublicClasses.textFieldDecimalVerification(textField, range: range, string: string, GoButton: GoButton, maxDecimalPlaces: GlobalVariables.sharedInstance.currentDecimalPlaces, maxIntegerPlaces: 4, percentageMode: GlobalVariables.sharedInstance.percentageModeActive)
            //            self.weightEntryTextField.title = NSLocalizedString("Total weight", comment: "")
            //            GlobalVariables.sharedInstance.weightToLift = GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight
            //            GlobalVariables.sharedInstance.currentPlatesInUse = [Double]()
            //            PublicClasses.drawPlates(self.platesView)
        }
        if result == true && self.platesLabel.alpha != 0 {
            self.platesLabel.alpha = 1
            self.platesView.alpha = 1
            UIView.animate(withDuration: app.visuals.platesFadeDuration, delay: 0.0, options: [], animations: {
                self.platesLabel.alpha = 0
                self.platesView.alpha = 0
            }, completion: {
                (value: Bool) in
                self.platesLabel.text = ""
            })
            
            app.status.errorState = false
            //            self.weightEntryTextField.errorMessage = ""
            PublicClasses.setPlatesButtonsEnabledStatus(self.platesLabel, FiftyFiveLbsButton: self.FiftyFiveLbsButton, FortyFiveLbsButton: self.FortyFiveLbsButton, ThirtyFiveLbsButton: self.ThirtyFiveLbsButton, TwentyFiveLbsButton: self.TwentyFiveLbsButton, FifteenLbsButton: self.FifteenLbsButton, TenLbsButton: self.TenLbsButton, FiveLbsButton: self.FiveLbsButton, TwoPointFiveLbsButton: self.TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: self.OnePointTwoFiveLbsButton, weightEntryTextField: self.weightEntryTextField, platesView: self.platesView)
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

