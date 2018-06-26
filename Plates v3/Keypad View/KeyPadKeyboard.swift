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
        if app.status.percentageModeActive == false {
        self.weightEntryTextField.alwaysShowFloatingLabel  = false
        }
//        var placeholderValue: Double = 0
//        if textField.text!.count > 0 {
//            placeholderValue = (PublicClasses.numberFormatterDecimal.number(from: textField.text!)?.doubleValue.rounded(toPlaces: app.profile.chosenUnit.decimalPlaces))!
//        }
//        if app.status.percentageModeActive == true {
//            app.calc.percentage = (placeholderValue.rounded(toPlaces: 1))
//            textField.text = PublicClasses.numberFormatterDecimal.string(from: NSNumber(value: app.calc.percentage))
//        }
//        else if textField.text != "" {
//            app.calc.fieldNumber = PublicClasses.numberFormatterDecimal.number(from: textField.text!) as! Double
//        }
//        else {
//            textField.text = ""
//        }
        if app.status.percentageModeActive == false && app.status.manualTextEntry == false && textField.text != "" {
            textField.text = app.calc.weightToLiftString
        }
        else if app.status.percentageModeActive == true && textField.text != "" {
            textField.text = PublicClasses.percentFormatter.string(from: NSNumber(value: app.calc.percentage))
        }
        else if app.status.percentageModeActive == false && app.status.manualTextEntry == true && textField.text != "" {
            textField.text = PublicClasses.numberFormatterDecimal.string(from: NSNumber(value: app.calc.fieldNumber))
        }
        else {
            textField.text = ""
        }
    }
    

func textFieldDidBeginEditing(_ textField: UITextField) {
    self.weightEntryTextField.alwaysShowFloatingLabel  = true
    if app.status.percentageModeActive == false && app.status.manualTextEntry == false && textField.text != "" {
        textField.text = app.calc.weightToLift.clean
    }
    else if app.status.percentageModeActive == true && app.status.manualTextEntry == false && textField.text != "" {
        textField.text = app.calc.percentage.clean
    }
    else if app.status.percentageModeActive == true && app.status.manualTextEntry == true && textField.text != "" && app.calc.percentage != 0  {
        textField.text = String(Int((app.calc.percentage*100.0).rounded(toPlaces: 0)))
    }
    else if app.status.percentageModeActive == false && app.status.manualTextEntry == true && textField.text != "" {
        textField.text = app.calc.fieldNumber.clean
    }
    else {
        textField.text = ""
    }
}

func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    var result: Bool = false
    print(app.status.percentageModeActive)
    if app.status.percentageModeActive == true {
        result = PublicClasses.textFieldDecimalVerification(textField, range: range, string: string, maxDecimalPlaces: 0, maxIntegerPlaces: 3, percentageMode: app.status.percentageModeActive)
        if result == true {
            app.calc.percentage = (PublicClasses.numberFormatterDecimal.number(from: textField.text!+string) as! Double)/100
        }
    }
    else {
        result = PublicClasses.textFieldDecimalVerification(textField, range: range, string: string, maxDecimalPlaces: app.profile.chosenUnit.decimalPlaces, maxIntegerPlaces: 4, percentageMode: app.status.percentageModeActive)
        if result == true  {
            app.calc.currentPlatesInUse.list = []
            app.updateWeightToLift()
            PublicClasses.setPlatesButtonsEnabledStatus(self.platesLabel, FiftyFiveLbsButton: self.FiftyFiveLbsButton, FortyFiveLbsButton: self.FortyFiveLbsButton, ThirtyFiveLbsButton: self.ThirtyFiveLbsButton, TwentyFiveLbsButton: self.TwentyFiveLbsButton, FifteenLbsButton: self.FifteenLbsButton, TenLbsButton: self.TenLbsButton, FiveLbsButton: self.FiveLbsButton, TwoPointFiveLbsButton: self.TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: self.OnePointTwoFiveLbsButton, weightEntryTextField: self.weightEntryTextField, platesView: self.platesView)
            app.status.manualTextEntry = true
            app.status.percentageModeActive = false
            self.weightEntryTextField.floatingLabel.text = NSLocalizedString("Total weight", comment: "")
                app.calc.fieldNumber = PublicClasses.numberFormatterDecimal.number(from: textField.text!+string) as! Double
        }
    }
    if result == true {
        GoButton.isEnabled = true
        UIView.transition(with: GoButton, duration: app.visuals.platesFadeDuration, options: [.transitionCrossDissolve], animations: {
            self.GoButton.setTitle(NSLocalizedString("Calculate", comment: ""), for: .normal)
        }, completion: nil)
    }
    if result == true && self.platesLabel.alpha != 0 {
        UIView.animate(withDuration: app.visuals.platesFadeDuration, delay: 0.0, options: [], animations: {
            self.platesLabel.alpha = 0
            self.platesView.alpha = 0
            self.GoButton.setTitle(NSLocalizedString("Calculate", comment: ""), for: .normal)
        }, completion: {
            (value: Bool) in
            self.platesLabel.text = ""
            PublicClasses.drawPlates(self.platesView)
        })
    }
    print(textField.text!+string)
    print(string)
    return result
}
}

