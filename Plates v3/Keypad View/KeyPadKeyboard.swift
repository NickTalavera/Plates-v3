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
            if textField.text != "" {
                app.calc.fieldNumber = PublicClasses.numberFormatterDecimal.number(from: textField.text!) as! Double
            }
            else {
                weightEntryTextField.text = ""
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.weightEntryTextField.alwaysShowFloatingLabel  = true
        if app.calc.weightToLift != 0 && textField.text != "" {
            textField.text = app.calc.weightToLift.clean
        }
        else {
            textField.text = ""
        }
        print(app.calc.weightToLift)
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
            if result == true  {
                GoButton.isEnabled = true
                app.status.keyPadUsedNow = false
                app.calc.currentPlatesInUse.list = []
                self.weightEntryTextField.floatingLabel.text = NSLocalizedString("Total weight", comment: "")
                if textField.text != "" {
                    app.calc.fieldNumber = PublicClasses.numberFormatterDecimal.number(from: textField.text!) as! Double
                }
            }
        }
        if result == true && self.platesLabel.alpha != 0 {
            UIView.animate(withDuration: app.visuals.platesFadeDuration, delay: 0.0, options: [], animations: {
                self.platesLabel.alpha = 0
                self.platesView.alpha = 0
                self.GoButton.setTitle(NSLocalizedString("Calculate", comment: ""), for: .normal)
            }, completion: {
                (value: Bool) in
                PublicClasses.setPlatesButtonsEnabledStatus(self.platesLabel, FiftyFiveLbsButton: self.FiftyFiveLbsButton, FortyFiveLbsButton: self.FortyFiveLbsButton, ThirtyFiveLbsButton: self.ThirtyFiveLbsButton, TwentyFiveLbsButton: self.TwentyFiveLbsButton, FifteenLbsButton: self.FifteenLbsButton, TenLbsButton: self.TenLbsButton, FiveLbsButton: self.FiveLbsButton, TwoPointFiveLbsButton: self.TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: self.OnePointTwoFiveLbsButton, weightEntryTextField: self.weightEntryTextField, platesView: self.platesView)
                self.platesLabel.text = ""
                PublicClasses.drawPlates(self.platesView)
            })
        }
        return result
    }
}

