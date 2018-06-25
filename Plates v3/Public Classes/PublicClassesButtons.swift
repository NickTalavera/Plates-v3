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
//        app.calc.currentPlatesInUse.sortPlates()
        GoButton.isEnabled = false
        weightEntryTextField.keyboardType = .decimalPad
        weightEntryTextField.resignFirstResponder()
        if app.status.percentageModeActive == true {
            var originalWeight = app.calc.weightToLift
//                        if placeholderText.count == 0 {
//                            placeholderText = "0"
//                        }
//                        let percentageTemp: Double = (PublicClasses.numberFormatterDecimal.number(from: placeholderText)?.doubleValue)!/100
            //            PublicClasses.setToWeightTextField(weightEntryTextField, platesView: platesView)
            //            app.calc.weightToLift = (app.calc.weightToLift * percentageTemp).roundToPlaces(GlobalVariables.sharedInstance.currentDecimalPlaces)
            //            let weightsPreviousOutPut = PublicClasses.labelOutputText(app.calc.weightToLift)
            //            GlobalVariables.sharedInstance.currentPlatesInUse = [String]()
            //            if weightsPreviousOutPut.count > 0 {
            //                let keys = Array(weightsPreviousOutPut.keys).sorted()
            //                for i in 0...keys.count-1 {
            //                    for _ in 1...weightsPreviousOutPut[keys[i]]! {
            //                        GlobalVariables.sharedInstance.currentPlatesInUse += [keys[i]]
            //                    }
            //                }
            //            }
            //            var sum = max(PublicClasses.reduceCurrentPlatesInUse(currentPlatesInUseInput: GlobalVariables.sharedInstance.currentPlatesInUse) + GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight, GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight)
            //            app.calc.weightToLift = app.calc.weightToLift - (app.calc.weightToLift.truncatingRemainder(dividingBy: PublicClasses.findMinCurrentPlates(GlobalVariables.sharedInstance.currentPlates)))
            //            if sum != app.calc.weightToLift {
            //                switch UIDevice.current.userInterfaceIdiom {
            //                case .phone:
            //                    weightEntryTextField.title! = String(format: NSLocalizedString("Rounded from %@", comment: ""), PublicClasses.massFormatter.string(fromValue: app.calc.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter))
            //                case .pad:
            //                    weightEntryTextField.title! = "\(PublicClasses.massFormatter.string(fromValue: originalWeight, unit: GlobalVariables.sharedInstance.unitsFormatter)) × \(PublicClasses.numberFormatterPercent.string(from: percentageTemp as NSNumber)!) (\(String(format: NSLocalizedString("Rounded from %@", comment: ""), PublicClasses.massFormatter.string(fromValue: app.calc.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter))))"
            //                case .unspecified:
            //                    break
            //                default:
            //                    break
            //                    // Uh, oh! What could it be?
            //                }
            //            }
            //            else {
            //                weightEntryTextField.title! = "\(PublicClasses.massFormatter.string(fromValue: sum, unit: GlobalVariables.sharedInstance.unitsFormatter)) × \(PublicClasses.numberFormatterPercent.string(from: percentageTemp as NSNumber)!)"
            //            }
            //            app.calc.weightToLift = sum
            //            #if os(iOS) || os(tvOS)
            //            weightEntryTextField.text! = PublicClasses.massFormatter.string(fromValue: app.calc.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter)
            //            platesLabel.text = PublicClasses.formatLabel(weightsPreviousOutPut)
            //            #elseif os(OSX)
            //            weightEntryTextField.stringValue = PublicClasses.massFormatter.stringFromValue(app.calc.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter)
            //            platesLabel.string = PublicClasses.formatLabel(weightsPreviousOutPut)
            //            #endif
            //            PublicClasses.updateTextViewFont(platesLabel,maxTextSize: GlobalVariables.sharedInstance.currentMaxFont)
            //            if app.calc.weightToLift < (GlobalVariables.sharedInstance.currentBarWeight  + GlobalVariables.sharedInstance.currentCollarWeight) {
            //                GlobalVariables.sharedInstance.currentPlatesInUse = [String]()
            //                weightEntryTextField.errorMessage = NSLocalizedString("Add more weight", comment:"")
            //                PublicClasses.setToWeightTextField(weightEntryTextField, platesView: platesView)
            //                GlobalVariables.sharedInstance.errorState=true
            //            }
            //            PublicClasses.setPlatesButtonsEnabledStatus(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView)
            //            GlobalVariables.sharedInstance.currentPlatesInUse = PublicClasses.sortCurrentPlatesInUse(GlobalVariables.sharedInstance.currentPlatesInUse)
            //            PublicClasses.drawPlates(platesView)
        }
        else {
            //            if weightEntryTextField.text!.count > 0 {
            //                app.calc.weightToLift = PublicClasses.numberFormatterDecimal.number(from: weightEntryTextField.text!)!.doubleValue
            //            }
            //            let weightsPreviousOutPut = PublicClasses.labelOutputText(app.calc.weightToLift)
            //            GlobalVariables.sharedInstance.currentPlatesInUse = PublicClasses.sortCurrentPlatesInUse(GlobalVariables.sharedInstance.currentPlatesInUse)
            //            var currentPlatesInUseTemp: [String] = [String]()
            //            if weightsPreviousOutPut.count > 0 {
            //                let keys = Array(weightsPreviousOutPut.keys)
            //                for i in 0...keys.count-1 {
            //                    for _ in 1...weightsPreviousOutPut[keys[i]]! {
            //                        currentPlatesInUseTemp += [keys[i]]
            //                    }
            //                }
            //            }
            //            let weightTest = PublicClasses.reduceCurrentPlatesInUse(currentPlatesInUseInput: currentPlatesInUseTemp) + GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight
            //            if weightTest == app.calc.weightToLift || GlobalVariables.sharedInstance.keyPadUsedNow == false {
            //                GlobalVariables.sharedInstance.currentPlatesInUse = currentPlatesInUseTemp
            //                PublicClasses.setPlatesButtonsEnabledStatus(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView)
            //                PublicClasses.updateTextViewFont(platesLabel,maxTextSize: GlobalVariables.sharedInstance.currentMaxFont)
            //                #if os(iOS)
            //                weightEntryTextField.errorMessage = NSLocalizedString("", comment: "")
            //                #endif
            //                platesLabel.text = PublicClasses.formatLabel(weightsPreviousOutPut)
            //                weightEntryTextField.text! = PublicClasses.massFormatter.string(fromValue: app.calc.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter)
            //
            //            }
            
        }
        weightEntryTextField.text = app.calc.weightToLiftString
        app.calc.currentPlatesInUse.sortPlates()
        PublicClasses.drawPlates(platesView)
        platesLabel.text = PublicClasses.formatLabel(app.calc.currentPlatesInUse)
    }
    
    
    class func percentButtonAction(_ weightEntryTextField: JVFloatLabeledTextField, FiftyFiveLbsButton: UIButton, FortyFiveLbsButton: UIButton, ThirtyFiveLbsButton: UIButton, TwentyFiveLbsButton: UIButton, FifteenLbsButton: UIButton, TenLbsButton: UIButton, FiveLbsButton: UIButton, TwoPointFiveLbsButton: UIButton, OnePointTwoFiveLbsButton: UIButton, UnitsButton: UIButton, platesLabel: UITextView, platesView: UIView, GoButton: UIButton) {
        app.status.percentageModeActive = true
        app.status.keyPadUsedNow = false
        app.updateWeightToLift()
        weightEntryTextField.becomeFirstResponder()
        weightEntryTextField.keyboardType = .numberPad
        weightEntryTextField.placeholder = NSLocalizedString("Percent", comment: "")
        weightEntryTextField.floatingLabel.text = "\(app.calc.weightToLiftString) ×"
        weightEntryTextField.text = ""
        UIView.transition(with: GoButton, duration: app.visuals.platesFadeDuration, options: [UIViewAnimationOptions.transitionCrossDissolve], animations:  {
            GoButton.setTitle(NSLocalizedString("Calculate", comment: ""), for: .normal)
        }, completion: nil)
        //                            let platesLabelText = platesLabel.text
        //                            let weightEntryTextFieldText = weightEntryTextField.text
        //
        //                        if platesLabelText == "" {
        //                                if weightEntryTextFieldText!.count == 0 {
        //                                    app.updateWeightToLift()
        //                                }
        //                                else {
        //                                    let placeholderText = PublicClasses.removeUnitsFromText(weightEntryTextFieldText!)
        //                                    let numberNow = PublicClasses.numberFormatterDecimal.number(from: placeholderText)!.doubleValue
        //                                    app.calc.weightToLift = numberNow
        //                                }
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
        app.status.keyPadUsedNow = true
        app.status.percentageModeActive = false
        if app.calc.currentPlatesInUse.widthOfPlates + app.profile.currentPlateSet.list[buttonSpot].getDimensions().width <= 406 {
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
