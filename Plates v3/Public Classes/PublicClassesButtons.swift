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
        //                GlobalVariables.sharedInstance.currentPlatesInUse = PublicClasses.sortCurrentPlatesInUse(GlobalVariables.sharedInstance.currentPlatesInUse)
        //                #if os(iOS) || os(tvOS)
        //                    var placeholderText = PublicClasses.removeUnitsFromText(weightEntryTextField.text!)
        //                    weightEntryTextField.keyboardType = .decimalPad
        //                    weightEntryTextField.resignFirstResponder()
        //                    weightEntryTextField.text = placeholderText
        //                    if weightEntryTextField.text!.characters.count == 0 {
        //                        platesLabel.alpha = 0
        //                        platesView.alpha = 0
        //                        weightEntryTextField.alpha = 0
        //                    }
        //                    UIView.animate(withDuration: GlobalVariables.sharedInstance.platesFadeDuration, delay: 0.0, options: [], animations: {
        //                        platesLabel.alpha = 1
        //                        platesView.alpha = 1
        //                        weightEntryTextField.alpha = 1
        //                        }, completion: nil)
        //                    GoButton.isEnabled = false
        //                #elseif os(OSX)
        //                    var placeholderText = PublicClasses.removeUnitsFromText(weightEntryTextField.stringValue)
        //                    weightEntryTextField.resignFirstResponder()
        //                    weightEntryTextField.stringValue = removeUnitsFromText(placeholderText)
        //                    if weightEntryTextField.stringValue.characters.count == 0 {
        //                        platesLabel.alphaValue = 0
        //                        platesView.alphaValue = 0
        //                        weightEntryTextField.alphaValue = 0
        //                    }
        //                    NSAnimationContext.runAnimationGroup({ (context) -> Void in
        //                        context.duration = GlobalVariables.sharedInstance.animationTime
        //                        platesLabel.animator().alphaValue = 1
        //                        platesView.animator().alphaValue = 1
        //                        weightEntryTextField.animator().alphaValue = 1
        //                        GoButton.animator().enabled = false
        //                        }, completionHandler: { () -> Void in
        //                    })
        //                #elseif os(watchOS)
        //                    GoButton.setEnabled(false)
        //                #endif
        //                if GlobalVariables.sharedInstance.percentageModeActive == true {
        //                    var originalWeight = GlobalVariables.sharedInstance.weightToLift
        //                    if placeholderText.characters.count == 0 {
        //                        placeholderText = "0"
        //                    }
        //                    let percentageTemp: Double = (PublicClasses.numberFormatterDecimal.number(from: placeholderText)?.doubleValue)!/100
        //                    PublicClasses.setToWeightTextField(weightEntryTextField, platesView: platesView)
        //                    GlobalVariables.sharedInstance.weightToLift = (GlobalVariables.sharedInstance.weightToLift * percentageTemp).roundToPlaces(GlobalVariables.sharedInstance.currentDecimalPlaces)
        //                    let weightsPreviousOutPut = PublicClasses.labelOutputText(GlobalVariables.sharedInstance.weightToLift)
        //                    GlobalVariables.sharedInstance.currentPlatesInUse = [String]()
        //                    if weightsPreviousOutPut.count > 0 {
        //                        let keys = Array(weightsPreviousOutPut.keys).sorted()
        //                        for i in 0...keys.count-1 {
        //                            for _ in 1...weightsPreviousOutPut[keys[i]]! {
        //                                GlobalVariables.sharedInstance.currentPlatesInUse += [keys[i]]
        //                            }
        //                        }
        //                    }
        //                    var sum = max(PublicClasses.reduceCurrentPlatesInUse(currentPlatesInUseInput: GlobalVariables.sharedInstance.currentPlatesInUse) + GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight, GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight)
        //                    GlobalVariables.sharedInstance.weightToLift = GlobalVariables.sharedInstance.weightToLift - (GlobalVariables.sharedInstance.weightToLift.truncatingRemainder(dividingBy: PublicClasses.findMinCurrentPlates(GlobalVariables.sharedInstance.currentPlates)))
        //                    if sum != GlobalVariables.sharedInstance.weightToLift {
        //                        #if os(iOS)
        //                            switch UIDevice.current.userInterfaceIdiom {
        //                            case .phone:
        //                                weightEntryTextField.title! = String(format: NSLocalizedString("Rounded from %@", comment: ""), PublicClasses.massFormatter.string(fromValue: GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter))
        //                            case .pad:
        //                                weightEntryTextField.title! = "\(PublicClasses.massFormatter.string(fromValue: originalWeight, unit: GlobalVariables.sharedInstance.unitsFormatter)) × \(PublicClasses.numberFormatterPercent.string(from: percentageTemp as NSNumber)!) (\(String(format: NSLocalizedString("Rounded from %@", comment: ""), PublicClasses.massFormatter.string(fromValue: GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter))))"
        //                            case .unspecified:
        //                                break
        //                            default:
        //                                break
        //                                // Uh, oh! What could it be?
        //                            }
        //                        #elseif os(tvOS)
        //                            //FIX THIS
        ////                            titleLabel?.text = "\(PublicClasses.massFormatter.stringFromValue(originalWeight, unit: GlobalVariables.sharedInstance.unitsFormatter)) × \(PublicClasses.numberFormatterPercent.stringFromNumber(NSNumber(percentageTemp))!) (\(String(format: NSLocalizedString("Rounded from %@", comment: ""), PublicClasses.massFormatter.stringFromValue(GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter))))"
        //                        #elseif os(OSX)
        //                            titleLabel?.stringValue = "\(PublicClasses.massFormatter.stringFromValue(originalWeight, unit: GlobalVariables.sharedInstance.unitsFormatter)) × \(PublicClasses.numberFormatterPercent.stringFromNumber(percentageTemp)!) (\(String(format: NSLocalizedString("Rounded from %@", comment: ""), PublicClasses.massFormatter.stringFromValue(GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter))))"
        //                            titleLabel?.textColor = GlobalVariables.sharedInstance.secondaryColor
        //                        #endif
        //                    }
        //                    else {
        //                        #if os(iOS)
        //                            weightEntryTextField.title! = "\(PublicClasses.massFormatter.string(fromValue: sum, unit: GlobalVariables.sharedInstance.unitsFormatter)) × \(PublicClasses.numberFormatterPercent.string(from: percentageTemp as NSNumber)!)"
        //                        #elseif os(tvOS)
        //                            //FIX THIS
        ////                            titleLabel?.text = "\(PublicClasses.massFormatter.stringFromValue(sum, unit: GlobalVariables.sharedInstance.unitsFormatter)) × \(PublicClasses.numberFormatterPercent.stringFromNumber(NSNumber(percentageTemp))!)"
        //                        #elseif os(OSX)
        //                            titleLabel?.stringValue = "\(PublicClasses.massFormatter.stringFromValue(sum, unit: GlobalVariables.sharedInstance.unitsFormatter)) × \(PublicClasses.numberFormatterPercent.stringFromNumber(percentageTemp)!)"
        //                            titleLabel?.textColor = GlobalVariables.sharedInstance.secondaryColor
        //                        #endif
        //                    }
        //                    GlobalVariables.sharedInstance.weightToLift = sum
        //                    #if os(iOS) || os(tvOS)
        //                        weightEntryTextField.text! = PublicClasses.massFormatter.string(fromValue: GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter)
        //                        platesLabel.text = PublicClasses.formatLabel(weightsPreviousOutPut)
        //                    #elseif os(OSX)
        //                        weightEntryTextField.stringValue = PublicClasses.massFormatter.stringFromValue(GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter)
        //                        platesLabel.string = PublicClasses.formatLabel(weightsPreviousOutPut)
        //                    #endif
        //                    PublicClasses.updateTextViewFont(platesLabel,maxTextSize: GlobalVariables.sharedInstance.currentMaxFont)
        //                    if GlobalVariables.sharedInstance.weightToLift < (GlobalVariables.sharedInstance.currentBarWeight  + GlobalVariables.sharedInstance.currentCollarWeight) {
        //                        GlobalVariables.sharedInstance.currentPlatesInUse = [String]()
        //                        #if os(iOS)
        //                            weightEntryTextField.errorMessage = NSLocalizedString("Add more weight", comment:"")
        //                        #elseif os(tvOS)
        //                            titleLabel?.text = NSLocalizedString("Add more weight", comment:"")
        //                            //                    titleLabel?.textColor = GlobalVariables.sharedInstance.errorColor
        //                        #elseif os(OSX)
        //                            titleLabel?.stringValue = NSLocalizedString("Add more weight", comment:"")
        //                            titleLabel?.textColor = GlobalVariables.sharedInstance.errorColor
        //                        #endif
        //                        #if os(iOS) || os(OSX) || os(tvOS)
        //                            PublicClasses.setToWeightTextField(weightEntryTextField, platesView: platesView)
        //                        #endif
        //                        GlobalVariables.sharedInstance.errorState=true
        //                    }
        //                    PublicClasses.setPlatesButtonsEnabledStatus(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView)
        //                    GlobalVariables.sharedInstance.currentPlatesInUse = PublicClasses.sortCurrentPlatesInUse(GlobalVariables.sharedInstance.currentPlatesInUse)
        //                    #if os(iOS) || os(OSX) || os(tvOS)
        //                        PublicClasses.drawPlates(platesView)
        //                    #endif
        //                }
        //                else {
        //                    #if os(iOS) || os(tvOS)
        //                        if weightEntryTextField.text!.characters.count > 0 {
        //                            GlobalVariables.sharedInstance.weightToLift = PublicClasses.numberFormatterDecimal.number(from: weightEntryTextField.text!)!.doubleValue
        //                        }
        //                    #elseif os(OSX)
        //                        if weightEntryTextField.stringValue.characters.count > 0 {
        //                            GlobalVariables.sharedInstance.weightToLift = (PublicClasses.numberFormatterDecimal.numberFromString(weightEntryTextField.stringValue)?.doubleValue)!
        //                        }
        //                    #endif
        //                    let weightsPreviousOutPut = PublicClasses.labelOutputText(GlobalVariables.sharedInstance.weightToLift)
        //                    GlobalVariables.sharedInstance.currentPlatesInUse = PublicClasses.sortCurrentPlatesInUse(GlobalVariables.sharedInstance.currentPlatesInUse)
        //                    var currentPlatesInUseTemp: [String] = [String]()
        //                    if weightsPreviousOutPut.count > 0 {
        //                        let keys = Array(weightsPreviousOutPut.keys)
        //                        for i in 0...keys.count-1 {
        //                            for _ in 1...weightsPreviousOutPut[keys[i]]! {
        //                                currentPlatesInUseTemp += [keys[i]]
        //                            }
        //                        }
        //                    }
        //                    let weightTest = PublicClasses.reduceCurrentPlatesInUse(currentPlatesInUseInput: currentPlatesInUseTemp) + GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight
        //                    if weightTest == GlobalVariables.sharedInstance.weightToLift || GlobalVariables.sharedInstance.keyPadUsedNow == false {
        //                        GlobalVariables.sharedInstance.currentPlatesInUse = currentPlatesInUseTemp
        //                        PublicClasses.setPlatesButtonsEnabledStatus(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView)
        //                        PublicClasses.updateTextViewFont(platesLabel,maxTextSize: GlobalVariables.sharedInstance.currentMaxFont)
        //                            #if os(iOS)
        //                                weightEntryTextField.errorMessage = NSLocalizedString("", comment: "")
        //                            #endif
        //                            platesLabel.text = PublicClasses.formatLabel(weightsPreviousOutPut)
        //                            weightEntryTextField.text! = PublicClasses.massFormatter.string(fromValue: GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter)
        
        //                    }
        //
        //                    if weightTest.roundToPlaces(GlobalVariables.sharedInstance.currentDecimalPlaces) != GlobalVariables.sharedInstance.weightToLift.roundToPlaces(GlobalVariables.sharedInstance.currentDecimalPlaces) {
        
        //                    }
        //                }
        //                if weightEntryTextField.text!.characters.count > 0 {
        //                    placeholderText = PublicClasses.removeUnitsFromText(weightEntryTextField.text!)
        //                    let placeholderDouble = PublicClasses.numberFormatterDecimal.number(from: placeholderText)?.doubleValue
        //                    weightEntryTextField.text = PublicClasses.massFormatter.string(fromValue: placeholderDouble!, unit: GlobalVariables.sharedInstance.unitsFormatter)
        //                }
        //                GlobalVariables.sharedInstance.currentPlatesInUse = PublicClasses.sortCurrentPlatesInUse(GlobalVariables.sharedInstance.currentPlatesInUse)
        //                PublicClasses.drawPlates(platesView)
        //            #if os(iOS)
        //            PublicClasses.wcSendAllImportantGlobals()
        //            #endif
        //    }
        //        #endif
        //
        //        #if os(iOS) || os(OSX) || os(tvOS)
        //    class func percentButtonAction(_ weightEntryTextField: PlatesTextField, FiftyFiveLbsButton: UIButton, FortyFiveLbsButton: UIButton, ThirtyFiveLbsButton: UIButton, TwentyFiveLbsButton: UIButton, FifteenLbsButton: UIButton, TenLbsButton: UIButton, FiveLbsButton: UIButton, TwoPointFiveLbsButton: UIButton, OnePointTwoFiveLbsButton: UIButton, UnitsButton: UIButton, platesLabel: UITextView, platesView: View, GoButton: UIButton) {
        //                    let platesLabelText = platesLabel.text
        //                    let weightEntryTextFieldText = weightEntryTextField.text
        
        //                if platesLabelText == "" {
        //                    #if os(iOS) || os(watchOS) || os(tvOS)
        //                        if weightEntryTextFieldText!.characters.count == 0 {
        //                            GlobalVariables.sharedInstance.weightToLift = GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight
        //                        }
        //                        else {
        //                            let placeholderText = PublicClasses.removeUnitsFromText(weightEntryTextFieldText!)
        //                            let numberNow = PublicClasses.numberFormatterDecimal.number(from: placeholderText)!.doubleValue
        //                            GlobalVariables.sharedInstance.weightToLift = numberNow
        //                        }
        //                    #elseif os(OSX)
        //                        if weightEntryTextFieldText.characters.count == 0 {
        //                            GlobalVariables.sharedInstance.weightToLift = GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight
        //                        }
        //                        else {
        //                            let placeholderText = PublicClasses.removeUnitsFromText(weightEntryTextFieldText)
        //                            let numberNow = PublicClasses.numberFormatterDecimal.numberFromString(placeholderText)!.doubleValue
        //                            GlobalVariables.sharedInstance.weightToLift = numberNow
        //                        }
        //                    #endif
        //
        //                }
        //
        //                #if os(iOS) || os(tvOS)
        //                    weightEntryTextField.keyboardType = .numberPad
        //                     #if os(iOS)
        //                        weightEntryTextField.placeholder = NSLocalizedString("Percent", comment: "")
        //                    weightEntryTextField.title = "\(PublicClasses.massFormatter.string(fromValue: GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter)) ×"
        //                    weightEntryTextField.setTitleVisible(true, animated: true)
        //                        #elseif os(tvOS)
        //                        weightEntryTextField.placeholder = "\(PublicClasses.massFormatter.string(fromValue: GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter)) × %"
        //                        titleLabel?.text = "\(PublicClasses.massFormatter.string(fromValue: GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter)) ×"
        //                        #endif
        //                    weightEntryTextField.text = ""
        //                    View.transition(with: GoButton, duration: GlobalVariables.sharedInstance.platesFadeDuration, options: [UIViewAnimationOptions.transitionCrossDissolve], animations:  {
        //                                        GoButton.setTitle(NSLocalizedString("Calculate", comment: ""), for: .normal)
        //                                        }, completion: nil)
        //                #elseif os(OSX)
        //                    weightEntryTextField.placeholderString = NSLocalizedString("Percent", comment: "")
        //                    titleLabel?.stringValue = "\(PublicClasses.massFormatter.stringFromValue(GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter)) ×"
        //                    titleLabel?.textColor = GlobalVariables.sharedInstance.secondaryColor
        //                    weightEntryTextField.stringValue = ""
        //                    //            View.transitionWithView(GoButton, duration: GlobalVariables.sharedInstance.platesFadeDuration, options: [.TransitionCrossDissolve], animations: {
        //                    let  paragraph: NSMutableParagraphStyle = NSMutableParagraphStyle()
        //                    paragraph.alignment = NSTextAlignment.Center
        //                    let currentAttributeGo = [NSParagraphStyleAttributeName: paragraph, NSFontAttributeName: Font(name: (GlobalVariables.sharedInstance.fontStandard.fontName), size: GlobalVariables.sharedInstance.currentMaxFont)!, NSForegroundColorAttributeName : GlobalVariables.sharedInstance.secondaryTextColor]
        //                    GoButton.attributedTitle = NSAttributedString(string: NSLocalizedString("Calculate", comment: ""), attributes: currentAttributeGo)
        //                    //                }, completion: nil)
        //                #endif
        //                weightEntryTextField.becomeFirstResponder()
        //                GlobalVariables.sharedInstance.percentageModeActive = true
        //                GlobalVariables.sharedInstance.keyPadUsedNow = false
        //        PublicClasses.setPlatesButtonsEnabledStatus(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView)
    }
    
    class func removeButtonAction(_ weightEntryTextField: JVFloatLabeledTextField, FiftyFiveLbsButton: UIButton, FortyFiveLbsButton: UIButton, ThirtyFiveLbsButton: UIButton, TwentyFiveLbsButton: UIButton, FifteenLbsButton: UIButton, TenLbsButton: UIButton, FiveLbsButton: UIButton, TwoPointFiveLbsButton: UIButton, OnePointTwoFiveLbsButton: UIButton, UnitsButton: UIButton?=nil, platesLabel: UITextView, platesView: UIView, GoButton: UIButton) {
        weightEntryTextField.keyboardType = .decimalPad
        //                if GlobalVariables.sharedInstance.currentPlatesInUse.count > 0 {
        //                        weightEntryTextField.resignFirstResponder()
        //                        weightEntryTextField.text = removeUnitsFromText(weightEntryTextField.text!)
        //                    GlobalVariables.sharedInstance.currentPlatesInUse.removeLast()
        if app.calc.currentPlatesInUse.countPlates() > 0 {
            GoButton.isEnabled = true
            //                        GlobalVariables.sharedInstance.weightToLift = PublicClasses.reduceCurrentPlatesInUse(currentPlatesInUseInput: GlobalVariables.sharedInstance.currentPlatesInUse) + GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight
            //                            weightEntryTextField.text! = PublicClasses.massFormatter.string(fromValue: GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter)
            //                            platesLabel.text = PublicClasses.labelPlateOutputFromCurrentPlatesInUse(GlobalVariables.sharedInstance.currentPlatesInUse)
            //                            PublicClasses.updateTextViewFont(platesLabel,maxTextSize: GlobalVariables.sharedInstance.currentMaxFont)
            
        }
        else {
            //                        PublicClasses.resetEverything(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: titleLabel)
        }
        //                        weightEntryTextField.errorMessage = ""
//        PublicClasses.setPlatesButtonsEnabledStatus(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView)
        //                    #if os(iOS) || os(OSX) || os(tvOS)
        //                        PublicClasses.setToWeightTextField(weightEntryTextField, platesView: platesView!)
        //                    #endif
        //                    #if os(iOS) || os(tvOS)
        //                        weightEntryTextField.text! = PublicClasses.massFormatter.string(fromValue: GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter)
        //                        PublicClasses.updateTextViewFont(platesLabel,maxTextSize: GlobalVariables.sharedInstance.currentMaxFont)
        //                    #elseif os(OSX)
        //                        weightEntryTextField.stringValue = PublicClasses.massFormatter.stringFromValue(GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter)
        //                        PublicClasses.updateTextViewFont(platesLabel,maxTextSize: GlobalVariables.sharedInstance.currentMaxFont)
        //                    #elseif os(watchOS)
        //                        weightEntryTextField.setText(PublicClasses.massFormatter.string(fromValue: GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter))
        //                    #endif
        //                }
        //                else {
        //                    #if os(iOS) || os(OSX) || os(tvOS)
        //                        PublicClasses.resetEverything(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: titleLabel)
        //                    #elseif os(watchOS)
        //                        PublicClasses.resetEverything(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: nil, GoButton: nil, titleLabel: titleLabel, animate: true, onEachSideGroup: onEachSideGroup)
        //                    #endif
        //                }
        //                #if os(iOS)
        //                    PublicClasses.wcSendAllImportantGlobals()
        //                #endif
    }
    
    
    class func unitsButtonAction(_ weightEntryTextField: JVFloatLabeledTextField, FiftyFiveLbsButton: UIButton, FortyFiveLbsButton: UIButton, ThirtyFiveLbsButton: UIButton, TwentyFiveLbsButton: UIButton, FifteenLbsButton: UIButton, TenLbsButton: UIButton, FiveLbsButton: UIButton, TwoPointFiveLbsButton: UIButton, OnePointTwoFiveLbsButton: UIButton, UnitsButton: UIButton, platesLabel: UITextView, platesView: UIView, GoButton: UIButton) {
        PublicClasses.switchUnitsTo(app.profile.chosenUnit.opposite, weightEntryTextField: weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton, overwriteValues: true)
    }
    
    
    class func plateButtonPressed( buttonSpot: Int, platesLabel: UITextView, FiftyFiveLbsButton: UIButton, FortyFiveLbsButton: UIButton, ThirtyFiveLbsButton: UIButton, TwentyFiveLbsButton: UIButton, FifteenLbsButton: UIButton, TenLbsButton: UIButton, FiveLbsButton: UIButton, TwoPointFiveLbsButton: UIButton, OnePointTwoFiveLbsButton: UIButton, weightEntryTextField: JVFloatLabeledTextField, platesView: UIView, GoButton: UIButton) {
        var buttonSpot = buttonSpot
        if app.profile.chosenUnit.unit == UnitOfWeight.unitType.lb {
            buttonSpot += 9
        }
        GoButton.isEnabled = true
        if weightEntryTextField.text!.characters.count == 0 || app.calc.weightToLift == app.profile.currentBarbell.weight + app.profile.currentCollar.weight {
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
        var placeholderText = weightEntryTextField.text
        if (placeholderText?.characters.count)! > 0 {
            placeholderText = PublicClasses.removeUnitsFromText(placeholderText!)
            weightEntryTextField.text = placeholderText
        }
        app.status.keyPadUsedNow = true
        app.appendCurrentPlate(weight: app.profile.currentPlateSet.list[buttonSpot].weight)
        app.updateWeightToLift()
        //                    platesLabel.text = PublicClasses.labelPlateOutputFromCurrentPlatesInUse(GlobalVariables.sharedInstance.currentPlatesInUse)
        PublicClasses.setPlatesButtonsEnabledStatus(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView)
        app.status.percentageModeActive = false
        //        PublicClasses.setToWeightTextField(weightEntryTextField, platesView: platesView!)
        PublicClasses.updateTextViewFont(platesLabel, maxTextSize: app.visuals.currentMaxFont)
        PublicClasses.drawPlates(platesView)
        weightEntryTextField.text = PublicClasses.massFormatter.string(fromValue:  app.calc.weightToLift, unit: app.profile.chosenUnit.formatter)
        //                        weightEntryTextField.errorMessage = ""
        weightEntryTextField.isHighlighted = true
        weightEntryTextField.resignFirstResponder()
        UIView.transition(with: GoButton, duration: app.visuals.platesFadeDuration, options: [.transitionCrossDissolve], animations: {
            GoButton.setTitle(NSLocalizedString("Optimize", comment: ""), for: .normal)
        }, completion: nil)
    }
    
}
