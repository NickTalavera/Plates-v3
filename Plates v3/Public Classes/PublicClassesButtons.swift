//
//  PublicClasses.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 5/29/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import JVFloatLabeledText

extension PublicClasses {
    class func goButtonAction(_ weightEntryTextField: JVFloatLabeledTextField, FiftyFiveLbsButton: UIButton, FortyFiveLbsButton: UIButton, ThirtyFiveLbsButton: UIButton, TwentyFiveLbsButton: UIButton, FifteenLbsButton: UIButton, TenLbsButton: UIButton, FiveLbsButton: UIButton, TwoPointFiveLbsButton: UIButton, OnePointTwoFiveLbsButton: UIButton, UnitsButton: UIButton, platesLabel: UITextView, platesView: UIView, GoButton: UIButton) {
        
        print("percentageModeActive: \(app.status.percentageModeActive)  manualTextEntry: \(app.status.manualTextEntry)")
        weightEntryTextField.alwaysShowFloatingLabel  = false
        app.calc.currentPlatesInUse.sortPlates()
        app.updateWeightToLift()
        GoButton.isEnabled = false
        weightEntryTextField.keyboardType = .decimalPad
        weightEntryTextField.resignFirstResponder()
        print(app.calc.fieldNumber)
        print(app.calc.percentage)
        var newWeight: Double = 0
        if app.status.percentageModeActive == true {
            let newWeight: Double = {
                switch (app.status.manualTextEntry) {
                case true:
                    print(app.calc.fieldNumber)
                    return app.calc.percentage*app.calc.fieldNumber
                case false:
                    print(app.calc.weightToLift)
                    return app.calc.percentage*app.calc.weightToLift
                }}()
            print(newWeight)
        }
        else if app.status.manualTextEntry ==  true {
            newWeight = app.calc.fieldNumber
        }
        else  {
            newWeight = app.calc.weightToLift
        }
        app.calc.currentPlatesInUse.list = self.weightReducer(weightToReduce: newWeight)
        app.updateWeightToLift()
        
        weightEntryTextField.floatingLabel.text = NSLocalizedString("Total weight", comment: "")
        PublicClasses.setPlatesButtonsEnabledStatus(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView)
        platesLabel.textInputView.fadeTransition(app.visuals.platesFadeDuration)
        platesLabel.text = PublicClasses.formatLabel(app.calc.currentPlatesInUse)
        PublicClasses.drawPlates(platesView)
        PublicClasses.updateTextViewFont(platesLabel, maxTextSize: app.visuals.currentMaxFont)
        weightEntryTextField.text = app.calc.weightToLiftString
        
        app.calc.percentage = 0
        app.calc.fieldNumber = 0
        app.status.manualTextEntry = false
    }
    
    class func weightReducer(weightToReduce: Double) -> [AppData.Plate] {
        var newPlates: [AppData.Plate] = []
        return newPlates
    }
    
    class func percentButtonAction(_ weightEntryTextField: JVFloatLabeledTextField, FiftyFiveLbsButton: UIButton, FortyFiveLbsButton: UIButton, ThirtyFiveLbsButton: UIButton, TwentyFiveLbsButton: UIButton, FifteenLbsButton: UIButton, TenLbsButton: UIButton, FiveLbsButton: UIButton, TwoPointFiveLbsButton: UIButton, OnePointTwoFiveLbsButton: UIButton, UnitsButton: UIButton, platesLabel: UITextView, platesView: UIView, GoButton: UIButton) {
        app.status.percentageModeActive = true
        app.updateWeightToLift()
        print(app.status.manualTextEntry)
        print(app.calc.fieldNumber)
        print(app.calc.weightToLiftString)
        weightEntryTextField.resignFirstResponder()
        weightEntryTextField.becomeFirstResponder()
        weightEntryTextField.keyboardType = .numberPad
        weightEntryTextField.placeholder = NSLocalizedString("Percent", comment: "")
        UIView.transition(with: GoButton, duration: app.visuals.platesFadeDuration, options: [UIViewAnimationOptions.transitionCrossDissolve], animations:  {
            GoButton.setTitle(NSLocalizedString("Calculate", comment: ""), for: .normal)
            switch (app.status.manualTextEntry) {
            case true:
                weightEntryTextField.floatingLabel.text = "\(app.calc.fieldNumber) ×"
            case false:
                weightEntryTextField.floatingLabel.text = "\(app.calc.weightToLift) ×"
            }
            weightEntryTextField.text = ""
        }, completion: nil)
    }
    
    class func removeButtonAction(_ weightEntryTextField: JVFloatLabeledTextField, FiftyFiveLbsButton: UIButton, FortyFiveLbsButton: UIButton, ThirtyFiveLbsButton: UIButton, TwentyFiveLbsButton: UIButton, FifteenLbsButton: UIButton, TenLbsButton: UIButton, FiveLbsButton: UIButton, TwoPointFiveLbsButton: UIButton, OnePointTwoFiveLbsButton: UIButton, UnitsButton: UIButton?=nil, platesLabel: UITextView, platesView: UIView, GoButton: UIButton) {
        weightEntryTextField.keyboardType = .decimalPad
        if app.calc.currentPlatesInUse.countPlates() > 0 {
            weightEntryTextField.resignFirstResponder()
            app.calc.currentPlatesInUse.removeOuterPlate()
            app.updateWeightToLift()
            if app.calc.currentPlatesInUse.countPlates() > 0 {
                GoButton.isEnabled = true
                weightEntryTextField.text = app.calc.weightToLiftString
                PublicClasses.setPlatesButtonsEnabledStatus(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView)
                platesLabel.text = PublicClasses.formatLabel(app.calc.currentPlatesInUse)
                PublicClasses.updateTextViewFont(platesLabel, maxTextSize: app.visuals.currentMaxFont)
                PublicClasses.drawPlates(platesView)
            }
            else {
                PublicClasses.resetEverything(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton)
            }
        }
        else {
            PublicClasses.resetEverything(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton)
        }
    }
    
    
    class func unitsButtonAction(_ weightEntryTextField: JVFloatLabeledTextField, FiftyFiveLbsButton: UIButton, FortyFiveLbsButton: UIButton, ThirtyFiveLbsButton: UIButton, TwentyFiveLbsButton: UIButton, FifteenLbsButton: UIButton, TenLbsButton: UIButton, FiveLbsButton: UIButton, TwoPointFiveLbsButton: UIButton, OnePointTwoFiveLbsButton: UIButton, UnitsButton: UIButton, platesLabel: UITextView, platesView: UIView, GoButton: UIButton) {
        PublicClasses.switchUnitsTo(app.profile.chosenUnit.opposite, weightEntryTextField: weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton, overwriteValues: true)
    }
    
    
    class func plateButtonPressed( buttonSpot: Int, platesLabel: UITextView, FiftyFiveLbsButton: UIButton, FortyFiveLbsButton: UIButton, ThirtyFiveLbsButton: UIButton, TwentyFiveLbsButton: UIButton, FifteenLbsButton: UIButton, TenLbsButton: UIButton, FiveLbsButton: UIButton, TwoPointFiveLbsButton: UIButton, OnePointTwoFiveLbsButton: UIButton, weightEntryTextField: JVFloatLabeledTextField, platesView: UIView, GoButton: UIButton) {
        var buttonSpot = buttonSpot
        if app.profile.chosenUnit.unit == UnitOfWeight.unitType.lb {
            buttonSpot += 9
        }
        weightEntryTextField.isHighlighted = true
        weightEntryTextField.resignFirstResponder()
        GoButton.isEnabled = true
        UIView.transition(with: GoButton, duration: app.visuals.platesFadeDuration, options: [.transitionCrossDissolve], animations: {
            GoButton.setTitle(NSLocalizedString("Optimize", comment: ""), for: .normal)
        }, completion: nil)
        if weightEntryTextField.text!.count == 0 && app.calc.currentPlatesInUse.countPlates() == 0 {
            platesLabel.alpha = 0
            platesView.alpha = 0
            weightEntryTextField.alpha = 0
        }
        UIView.animate(withDuration: app.visuals.platesFadeDuration, delay: 0.0,
                       options: [],
                       animations: {
                        platesLabel.alpha = 1
                        platesView.alpha = 1
                        weightEntryTextField.alpha = 1
        }, completion: nil)
        app.status.manualTextEntry = false
        app.status.percentageModeActive = false
        if app.calc.currentPlatesInUse.widthOfPlates + app.profile.currentPlateSet.list[buttonSpot].getDimensions().width < 406 {
            app.appendCurrentPlate(weight: app.profile.currentPlateSet.list[buttonSpot].weight)
            app.updateWeightToLift()
            PublicClasses.setPlatesButtonsEnabledStatus(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView)
            platesLabel.textInputView.fadeTransition(app.visuals.platesFadeDuration)
            platesLabel.text = PublicClasses.formatLabel(app.calc.currentPlatesInUse)
            PublicClasses.drawPlates(platesView)
            PublicClasses.updateTextViewFont(platesLabel, maxTextSize: app.visuals.currentMaxFont)
            weightEntryTextField.text = app.calc.weightToLiftString
        }
        else {
            for (index,_) in app.profile.currentPlateSet.list.enumerated() {
                PublicClasses.enableCertainPlateButtons(index, TF: false, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton)
            }
        }
        weightEntryTextField.floatingLabel.text = NSLocalizedString("Total weight", comment: "")
    }
    
}
