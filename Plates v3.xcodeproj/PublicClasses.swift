//
//  PublicClasses.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 5/29/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import Foundation
import CoreData
#if os(iOS) || os(tvOS) || os(watchOS)
    typealias Color = UIColor
    typealias Font = UIFont
#endif
#if os(iOS) || os(OSX)
    import Armchair
#endif
#if os(iOS)
    import UIKit
    import SkyFloatingLabelTextField
    typealias View = UIView
    typealias ImageView = UIImageView
    typealias TextView = UITextView
    typealias TableView = UITableView
    typealias TableViewCell = UITableViewCell
    typealias TextField = UITextField
    typealias Button = UIButton
    typealias SegmentedControl = UISegmentedControl
    typealias Label = UILabel
    typealias Switch = UISwitch
    typealias ViewController = UIViewController
    typealias AdvancedSettingViewController = UITableViewController
    typealias TextFieldDelegate = UITextFieldDelegate
    typealias PlatesLabelVar = UITextView
    typealias PlatesTextField = SkyFloatingLabelTextField
    typealias TitleLabelVar = UILabel
    typealias Separator = NSNull
    typealias Group = NSNull
#elseif os(watchOS)
    import WatchKit
    typealias View = WKInterfaceObject
    typealias ImageView = WKInterfaceImage
    typealias TextView = WKInterfaceLabel
    typealias TableView = WKInterfaceTable
    typealias TextField = WKInterfaceLabel
    typealias Button = WKInterfaceButton
    typealias Label = WKInterfaceLabel
    typealias Switch = WKInterfaceSwitch
    typealias PlatesLabelVar = WKInterfaceTable
    typealias PlatesTextField = WKInterfaceLabel
    typealias TitleLabelVar = WKInterfaceLabel
    typealias Separator = WKInterfaceSeparator
    typealias Group = WKInterfaceGroup
#elseif os(tvOS)
    import UIKit
    //    typealias CGFloat = Float
    typealias View = UIView
    typealias ImageView = UIImageView
    typealias TextView = UITextView
    typealias TableView = UITableView
    typealias TextField = UITextField
    typealias TableViewCell = UITableViewCell
    typealias Button = UIButton
    typealias SegmentedControl = UISegmentedControl
    typealias Label = UILabel
    typealias ViewController = UIViewController
    typealias AdvancedSettingViewController = UITableViewController
    typealias TextFieldDelegate = UITextFieldDelegate
    //    typealias Switch = UISwitch
    typealias PlatesLabelVar = UITextView
    typealias PlatesTextField = UITextField
    typealias TitleLabelVar = UILabel
    typealias Separator = NSNull
    typealias Group = NSNull
#elseif os(OSX)
    import AppKit
    typealias View = NSView
    typealias Color = NSColor
    typealias Font = NSFont
    typealias ImageView = NSImageView
    typealias TextView = NSTextView
    typealias TableView = NSTableView
    typealias TableViewCell = NSTableCellView
    typealias TextField = NSTextField
    typealias Button = NSButton
    typealias SegmentedControl = NSSegmentedControl
    typealias ViewController = NSViewController
    typealias AdvancedSettingViewController = NSViewController
    typealias TextFieldDelegate = NSTextFieldDelegate
    typealias Label = NSTextView
    //    typealias Switch = NSSwitch
    typealias PlatesLabelVar = NSTextView
    typealias PlatesTextField = NSTextField
    typealias TitleLabelVar = NSTextField
    typealias Separator = NSNull
    typealias Group = NSNull
#endif

class PublicClasses {
    weak var delegate:MainDelegate?

    #if os(watchOS)
    class func setupTable(platesInUse: [String: Int], table: WKInterfaceTable) {
    table.setNumberOfRows(platesInUse.count, withRowType: "TableCell")
    if platesInUse.count > 0 {
    var currentInventoryNames = [String]()
    var currentInventoryValues = [Int]()
    for (keys, values) in Array(platesInUse.sorted { $0.0 > $1.0 }) {
    let value = Double(keys.components(separatedBy: " ")[0])!
    let unit = keys.components(separatedBy: " ")[1]
    let unitFormatter = PublicClasses.unitToFormatter(unit)
    currentInventoryNames += [PublicClasses.massFormatter.string(fromValue: value, unit: unitFormatter)]
    currentInventoryValues += [values]
    }
    for i in 0...currentInventoryValues.count-1 {
    if let row: calculatorCell = table.rowController(at: i) as? calculatorCell {
    row.plateWeightLabel.setText(currentInventoryNames[i])
    row.plateCountLabel.setText("\(PublicClasses.numberFormatterDecimal.string(from: currentInventoryValues[i] as NSNumber)!)×")
    }
    }
    }
    }
    #endif

    class func switchUnitsToWrap(_ unit: String, weightEntryTextField: PlatesTextField, FiftyFiveLbsButton: Button, FortyFiveLbsButton: Button, ThirtyFiveLbsButton: Button, TwentyFiveLbsButton: Button, FifteenLbsButton: Button, TenLbsButton: Button, FiveLbsButton: Button, TwoPointFiveLbsButton: Button, OnePointTwoFiveLbsButton: Button, UnitsButton: Button?, platesLabel: PlatesLabelVar, platesView: View?, GoButton: Button?, titleLabel: TitleLabelVar?, overwriteValues: Bool? = true) {
        PublicClasses.switchUnitsTo(unit, overwriteValues: overwriteValues)
        GlobalVariables.sharedInstance.convertedUnitsOn = false
        GlobalVariables.sharedInstance.percentageModeActive = false
        #if os(iOS) || os(tvOS)
            PublicClasses.setToWeightTextField(weightEntryTextField, platesView: platesView!)
            if GlobalVariables.sharedInstance.currentPlatesInUse.count > 0 || (weightEntryTextField.text?.characters.count)! > 0 {
                weightEntryTextField.text = PublicClasses.massFormatter.string(fromValue: GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter)
            }
            weightEntryTextField.backgroundColor = Color.clear
            if GlobalVariables.sharedInstance.units == "Kg" {
                UnitsButton!.setTitle(PublicClasses.massFormatter.unitString(fromValue: 0, unit: GlobalVariables.sharedInstance.unitsFormatter), for: .normal)
                FiftyFiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[0] as NSNumber), for: .normal)
                FortyFiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[1] as NSNumber), for: .normal)
                ThirtyFiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[2] as NSNumber), for: .normal)
                TwentyFiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[3] as NSNumber), for: .normal)
                FifteenLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[4] as NSNumber), for: .normal)
                TenLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[5] as NSNumber), for: .normal)
                FiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[6] as NSNumber), for: .normal)
                TwoPointFiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[7] as NSNumber), for: .normal)
                OnePointTwoFiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[8] as NSNumber), for: .normal)
            }
            else {
                UnitsButton!.setTitle(PublicClasses.massFormatter.unitString(fromValue: 0, unit: GlobalVariables.sharedInstance.unitsFormatter), for: .normal)
                FiftyFiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[9] as NSNumber), for: .normal)
                FortyFiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[10] as NSNumber), for: .normal)
                ThirtyFiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[11] as NSNumber), for: .normal)
                TwentyFiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[12] as NSNumber), for: .normal)
                FifteenLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[13] as NSNumber), for: .normal)
                TenLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[14] as NSNumber), for: .normal)
                FiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[15] as NSNumber), for: .normal)
                TwoPointFiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[16] as NSNumber), for: .normal)
                OnePointTwoFiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[17] as NSNumber), for: .normal)
            }
//            GoButton!.setTitle(NSLocalizedString("Calculate", comment: ""), for: .normal)
        #elseif os(OSX)
            weightEntryTextField.stringValue = ""
            weightEntryTextField.backgroundColor = Color.clear
            platesLabel.string = ""
            if GlobalVariables.sharedInstance.units == "Kg" {
                FiftyFiveLbsButton.title = PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[0] as NSNumber)!
                FortyFiveLbsButton.title = PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[1] as NSNumber)!
                ThirtyFiveLbsButton.title = PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[2] as NSNumber)!
                TwentyFiveLbsButton.title = PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[3] as NSNumber)!
                FifteenLbsButton.title = PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[4] as NSNumber)!
                TenLbsButton.title = PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[5] as NSNumber)!
                FiveLbsButton.title = PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[6] as NSNumber)!
                TwoPointFiveLbsButton.title = PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[7] as NSNumber)!
                OnePointTwoFiveLbsButton.title = PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[8] as NSNumber)!
            }
            else{
                FiftyFiveLbsButton.title = PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[9] as NSNumber)!
                FortyFiveLbsButton.title = PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[10] as NSNumber)!
                ThirtyFiveLbsButton.title = PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[11] as NSNumber)!
                TwentyFiveLbsButton.title = PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[12] as NSNumber)!
                FifteenLbsButton.title = PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[13] as NSNumber)!
                TenLbsButton.title = PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[14] as NSNumber)!
                FiveLbsButton.title = PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[15] as NSNumber)!
                TwoPointFiveLbsButton.title = PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[16] as NSNumber)!
                OnePointTwoFiveLbsButton.title = PublicClasses.numberFormatterDecimal.string(from: GlobalVariables.sharedInstance.currentPlates[17] as NSNumber)!
            }
            UnitsButton!.title = PublicClasses.massFormatter.unitString(fromValue: 0, unit: GlobalVariables.sharedInstance.unitsFormatter)
            let  paragraph: NSMutableParagraphStyle = NSMutableParagraphStyle()
            paragraph.alignment = NSTextAlignment.center
            let currentAttributeGo = [NSParagraphStyleAttributeName: paragraph, NSFontAttributeName: Font(name: (GlobalVariables.sharedInstance.fontStandard.fontName), size: GlobalVariables.sharedInstance.currentMaxFont)!, NSForegroundColorAttributeName : GlobalVariables.sharedInstance.secondaryTextColor]
            GoButton?.attributedTitle = NSAttributedString(string: NSLocalizedString("Calculate", comment: ""), attributes: currentAttributeGo)
        #endif
        #if os(iOS) || os(OSX) || os(tvOS)
            PublicClasses.setPlatesButtonsEnabledStatus(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView)
        #endif
        //        if overwriteValues == true || GlobalVariables.sharedInstance.currentPlatesInUse.count == 0  {
        //            PublicClasses.resetEverything(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: titleLabel)
        //        }
    }

    class func switchUnitsTo(_ unit: String, overwriteValues: Bool? = true) {
        let previousUnitsBool: Bool = GlobalVariables.sharedInstance.units == unit
        var barbellsNew: [String: Double] = [String: Double]()
        var collarsNew: [String: Double] = [String: Double]()
        GlobalVariables.sharedInstance.currentPlates = GlobalVariables.sharedInstance.platesList
        if unit == "Kg" {
            GlobalVariables.sharedInstance.units = "Kg"
            GlobalVariables.sharedInstance.unitsFormatter = MassFormatter.Unit.kilogram
            for (key,value) in GlobalVariables.sharedInstance.barbellsList {
                if GlobalVariables.sharedInstance.barbellsListUnits[key] == "Kg" {
                    barbellsNew[key] = value.roundToPlaces(GlobalVariables.sharedInstance.kgDecimalPlaces)
                }
                else {
                    barbellsNew[key] = (value * 0.453592).roundToPlaces(GlobalVariables.sharedInstance.kgDecimalPlaces)
                }
            }
            GlobalVariables.sharedInstance.currentDecimalPlaces = GlobalVariables.sharedInstance.kgDecimalPlaces
            for (key,value) in GlobalVariables.sharedInstance.collarsSetValues {
                if GlobalVariables.sharedInstance.collarsSetUnits[key] == "Kg" {
                    collarsNew[key] = value.roundToPlaces(GlobalVariables.sharedInstance.kgDecimalPlaces)
                }
                else {
                    collarsNew[key] = (value * 0.453592).roundToPlaces(GlobalVariables.sharedInstance.kgDecimalPlaces)
                }
            }
            GlobalVariables.sharedInstance.currentDecimalPlaces = GlobalVariables.sharedInstance.kgDecimalPlaces
        }
        else {
            GlobalVariables.sharedInstance.units = "lbs"
            GlobalVariables.sharedInstance.unitsFormatter = MassFormatter.Unit.pound
            for (key,value) in GlobalVariables.sharedInstance.barbellsList {
                if GlobalVariables.sharedInstance.barbellsListUnits[key] == "Kg" {
                    barbellsNew[key] = (value / 0.453592).roundToPlaces(GlobalVariables.sharedInstance.lbDecimalPlaces)
                }
                else {
                    barbellsNew[key] = value.roundToPlaces(GlobalVariables.sharedInstance.lbDecimalPlaces)
                }
            }
            GlobalVariables.sharedInstance.currentDecimalPlaces = GlobalVariables.sharedInstance.lbDecimalPlaces
            for (key,value) in GlobalVariables.sharedInstance.collarsSetValues {
                if GlobalVariables.sharedInstance.collarsSetUnits[key] == "Kg" {
                    collarsNew[key] = (value / 0.453592).roundToPlaces(GlobalVariables.sharedInstance.lbDecimalPlaces)
                }
                else {
                    collarsNew[key] = value.roundToPlaces(GlobalVariables.sharedInstance.lbDecimalPlaces)
                }
            }
            GlobalVariables.sharedInstance.currentDecimalPlaces = GlobalVariables.sharedInstance.lbDecimalPlaces
        }
        GlobalVariables.sharedInstance.currentBarbellSet = barbellsNew
        GlobalVariables.sharedInstance.currentCollarSet = collarsNew
        
        if GlobalVariables.sharedInstance.weightStep <= PublicClasses.findMinCurrentPlates(GlobalVariables.sharedInstance.currentPlates) {
            GlobalVariables.sharedInstance.weightStep = GlobalVariables.sharedInstance.currentPlates[1]
        }
        GlobalVariables.sharedInstance.currentBarWeight = GlobalVariables.sharedInstance.currentBarbellSet[GlobalVariables.sharedInstance.currentBarName]!
        GlobalVariables.sharedInstance.currentCollarWeight = GlobalVariables.sharedInstance.currentCollarSet[GlobalVariables.sharedInstance.currentCollarName]!
        GlobalVariables.sharedInstance.weightToLift = max(PublicClasses.reduceCurrentPlatesInUse(currentPlatesInUseInput: GlobalVariables.sharedInstance.currentPlatesInUse) + GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight, GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight)
        GlobalVariables.sharedInstance.currentInventorySet = GlobalVariables.sharedInstance.currentInventoryList[GlobalVariables.sharedInstance.currentInventoryName]!
    }

    #if os(iOS) || os(OSX)
    class func setupArmchair() {
        #if os(iOS) || os(tvOS)
            Armchair.appID("1133812505")
        #elseif os(OSX)
            Armchair.appID("1133812505")
        #endif
        //    Armchair.debugEnabled(true)
        Armchair.appName(NSLocalizedString("Plates", comment: ""))
        Armchair.daysUntilPrompt(20)
        Armchair.usesUntilPrompt(7)
        Armchair.daysBeforeReminding(1)
        Armchair.shouldPromptIfRated(false)
        Armchair.significantEventsUntilPrompt(350)
        Armchair.tracksNewVersions(true)
        Armchair.useMainAppBundleForLocalizations(false)
        #if os(iOS)
            Armchair.opensInStoreKit(true)
        #endif
    }
    #endif

    #if os(iOS) || os(OSX)
    class func resetAppReviewManager() {
        Armchair.resetDefaults()
    }
    #endif

    class func roundWeightAndPlatesInUse(_ weightEntryTextField: PlatesTextField, titleLabel: TitleLabelVar?, platesLabel: PlatesLabelVar?, platesView: View?) {
        GlobalVariables.sharedInstance.currentPlatesInUse = PublicClasses.sortCurrentPlatesInUse(GlobalVariables.sharedInstance.currentPlatesInUse)
        let sum: Double = PublicClasses.reduceCurrentPlatesInUse(currentPlatesInUseInput: GlobalVariables.sharedInstance.currentPlatesInUse) + GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight
        let origWeight = GlobalVariables.sharedInstance.weightToLift
        GlobalVariables.sharedInstance.weightToLift = sum
        let titleLabelTemp = String(format: NSLocalizedString("Rounded from %@", comment: ""), PublicClasses.massFormatter.string(fromValue: origWeight, unit: GlobalVariables.sharedInstance.unitsFormatter))
        let labelTextTemp = PublicClasses.massFormatter.string(fromValue: GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter)
        let platesLabelText = PublicClasses.labelPlateOutputFromCurrentPlatesInUse(GlobalVariables.sharedInstance.currentPlatesInUse)
        #if os(iOS) || os(tvOS) || os(OSX)
            PublicClasses.drawPlates(platesView!)
        #endif
        #if os(iOS) || os(tvOS)
            platesLabel?.text = platesLabelText
            weightEntryTextField.text = labelTextTemp
        #endif
        #if os(iOS)
            weightEntryTextField.title = titleLabelTemp
        #elseif os(tvOS)
            titleLabel?.text = titleLabelTemp
        #elseif os(OSX)
            platesLabel?.string = platesLabelText
            titleLabel!.stringValue = titleLabelTemp
            weightEntryTextField.stringValue = labelTextTemp
        #elseif os(watchOS)
            titleLabel!.setText(titleLabelTemp)
            weightEntryTextField.setText(labelTextTemp)
        #endif
    }


    class func enableCertainPlateButtons(_ switchVal: Int, TF: Bool, FiftyFiveLbsButton: Button?, FortyFiveLbsButton: Button?, ThirtyFiveLbsButton: Button?, TwentyFiveLbsButton: Button?, FifteenLbsButton: Button?, TenLbsButton: Button?, FiveLbsButton: Button?, TwoPointFiveLbsButton: Button?, OnePointTwoFiveLbsButton: Button?) {
        let alphaVal: CGFloat = 0.8
        switch switchVal {
        case 0:
            #if os(iOS) || os(OSX) || (tvOS)
                FiftyFiveLbsButton!.isEnabled = TF
            #endif
            #if os(tvOS)
                if TF == false {
                    FiftyFiveLbsButton?.superview?.backgroundColor = GlobalVariables.sharedInstance.textPadColorDisabled
                    FiftyFiveLbsButton?.backgroundColor = GlobalVariables.sharedInstance.textPadColorDisabled
                }
                else {
                    FiftyFiveLbsButton?.superview?.backgroundColor = GlobalVariables.sharedInstance.textPadColor
                    FiftyFiveLbsButton?.backgroundColor = UIColor.clear
                }
            #elseif os(watchOS)
                FiftyFiveLbsButton!.setEnabled(TF)
                if TF == false {
                    FiftyFiveLbsButton?.setAlpha(alphaVal)
                }
                else {
                    FiftyFiveLbsButton?.setAlpha(1)
                }
            #endif

        case 1:
            #if os(iOS) || os(OSX) || (tvOS)
                FortyFiveLbsButton!.isEnabled = TF
            #endif
            #if os(tvOS)
                if TF == false {
                    FortyFiveLbsButton?.superview?.backgroundColor = GlobalVariables.sharedInstance.textPadColorDisabled
                    FortyFiveLbsButton?.backgroundColor = GlobalVariables.sharedInstance.textPadColorDisabled
                }
                else {
                    FortyFiveLbsButton?.superview?.backgroundColor = GlobalVariables.sharedInstance.textPadColor
                    FortyFiveLbsButton?.backgroundColor = UIColor.clear
                }
            #elseif os(watchOS)
                FortyFiveLbsButton!.setEnabled(TF)
                if TF == false {
                    FortyFiveLbsButton?.setAlpha(alphaVal)
                }
                else {
                    FortyFiveLbsButton?.setAlpha(1)
                }
            #endif
        case 2:
            #if os(iOS) || os(OSX) || (tvOS)
                ThirtyFiveLbsButton!.isEnabled = TF
            #endif
            #if os(tvOS)
                if TF == false {
                    ThirtyFiveLbsButton?.superview?.backgroundColor = GlobalVariables.sharedInstance.textPadColorDisabled
                    ThirtyFiveLbsButton?.backgroundColor = GlobalVariables.sharedInstance.textPadColorDisabled
                }
                else {
                    ThirtyFiveLbsButton?.superview?.backgroundColor = GlobalVariables.sharedInstance.textPadColor
                    ThirtyFiveLbsButton?.backgroundColor = UIColor.clear
                }
            #elseif os(watchOS)
                ThirtyFiveLbsButton!.setEnabled(TF)
                if TF == false {
                    ThirtyFiveLbsButton?.setAlpha(alphaVal)
                }
                else {
                    ThirtyFiveLbsButton?.setAlpha(1)
                }
            #endif
        case 3:
            #if os(iOS) || os(OSX) || (tvOS)
                TwentyFiveLbsButton!.isEnabled = TF
            #endif
            #if os(tvOS)
                if TF == false {
                    TwentyFiveLbsButton?.superview?.backgroundColor = GlobalVariables.sharedInstance.textPadColorDisabled
                    TwentyFiveLbsButton?.backgroundColor = GlobalVariables.sharedInstance.textPadColorDisabled
                }
                else {
                    TwentyFiveLbsButton?.superview?.backgroundColor = GlobalVariables.sharedInstance.textPadColor
                    TwentyFiveLbsButton?.backgroundColor = UIColor.clear
                }
            #elseif os(watchOS)
                TwentyFiveLbsButton!.setEnabled(TF)
                if TF == false {
                    TwentyFiveLbsButton?.setAlpha(alphaVal)
                }
                else {
                    TwentyFiveLbsButton?.setAlpha(1)
                }
            #endif
        case 4:
            #if os(iOS) || os(OSX) || (tvOS)
                FifteenLbsButton!.isEnabled = TF
            #endif
            #if os(tvOS)
                if TF == false {
                    FifteenLbsButton?.superview?.backgroundColor = GlobalVariables.sharedInstance.textPadColorDisabled
                    FifteenLbsButton?.backgroundColor = GlobalVariables.sharedInstance.textPadColorDisabled
                }
                else {
                    FifteenLbsButton?.superview?.backgroundColor = GlobalVariables.sharedInstance.textPadColor
                    FifteenLbsButton?.backgroundColor = UIColor.clear
                }
            #elseif os(watchOS)
                FifteenLbsButton!.setEnabled(TF)
                if TF == false {
                    FifteenLbsButton?.setAlpha(alphaVal)
                }
                else {
                    FifteenLbsButton?.setAlpha(1)
                }
            #endif
        case 5:
            #if os(iOS) || os(OSX) || (tvOS)
                TenLbsButton!.isEnabled = TF
            #endif
            #if os(tvOS)
                if TF == false {
                    TenLbsButton?.superview?.backgroundColor = GlobalVariables.sharedInstance.textPadColorDisabled
                    TenLbsButton?.backgroundColor = GlobalVariables.sharedInstance.textPadColorDisabled
                }
                else {
                    TenLbsButton?.superview?.backgroundColor = GlobalVariables.sharedInstance.textPadColor
                    TenLbsButton?.backgroundColor = UIColor.clear
                }
            #elseif os(watchOS)
                TenLbsButton!.setEnabled(TF)
                if TF == false {
                    TenLbsButton?.setAlpha(alphaVal)
                }
                else {
                    TenLbsButton?.setAlpha(1)
                }
            #endif
        case 6:
            #if os(iOS) || os(OSX) || (tvOS)
                FiveLbsButton!.isEnabled = TF
            #endif
            #if os(tvOS)
                if TF == false {
                    FiveLbsButton?.superview?.backgroundColor = GlobalVariables.sharedInstance.textPadColorDisabled
                    FiveLbsButton?.backgroundColor = GlobalVariables.sharedInstance.textPadColorDisabled
                }
                else {
                    FiveLbsButton?.superview?.backgroundColor = GlobalVariables.sharedInstance.textPadColor
                    FiveLbsButton?.backgroundColor = UIColor.clear
                }
            #elseif os(watchOS)
                FiveLbsButton!.setEnabled(TF)
                if TF == false {
                    FiveLbsButton?.setAlpha(alphaVal)
                }
                else {
                    FiveLbsButton?.setAlpha(1)
                }
            #endif
        case 7:
            #if os(iOS) || os(OSX) || (tvOS)
                TwoPointFiveLbsButton!.isEnabled = TF
            #endif
            #if os(tvOS)
                if TF == false {
                    TwoPointFiveLbsButton?.superview?.backgroundColor = GlobalVariables.sharedInstance.textPadColorDisabled
                    TwoPointFiveLbsButton?.backgroundColor = GlobalVariables.sharedInstance.textPadColorDisabled
                }
                else {
                    TwoPointFiveLbsButton?.superview?.backgroundColor = GlobalVariables.sharedInstance.textPadColor
                    TwoPointFiveLbsButton?.backgroundColor = UIColor.clear
                }
            #elseif os(watchOS)
                TwoPointFiveLbsButton!.setEnabled(TF)
                if TF == false {
                    TwoPointFiveLbsButton?.setAlpha(alphaVal)
                }
                else {
                    TwoPointFiveLbsButton?.setAlpha(1)
                }
            #endif
        case 8:
            #if os(iOS) || os(OSX) || (tvOS)
                OnePointTwoFiveLbsButton!.isEnabled = TF
            #endif
            #if os(tvOS)
                if TF == false {
                    OnePointTwoFiveLbsButton?.superview?.backgroundColor = GlobalVariables.sharedInstance.textPadColorDisabled
                    OnePointTwoFiveLbsButton?.backgroundColor = GlobalVariables.sharedInstance.textPadColorDisabled
                }
                else {
                    OnePointTwoFiveLbsButton?.superview?.backgroundColor = GlobalVariables.sharedInstance.textPadColor
                    OnePointTwoFiveLbsButton?.backgroundColor = UIColor.clear
                }
            #elseif os(watchOS)
                OnePointTwoFiveLbsButton!.setEnabled(TF)
                if TF == false {
                    OnePointTwoFiveLbsButton?.setAlpha(alphaVal)
                }
                else {
                    OnePointTwoFiveLbsButton?.setAlpha(1)
                }
            #endif
        default: break
        }
    }

    #if os(iOS) || os(tvOS) || os(OSX)
    class func updatePage(_ weightEntryTextField: TextField, platesView: View, platesLabel: PlatesLabelVar) {
        #if os(iOS) || os(tvOS)
            UIView.animate(withDuration: GlobalVariables.sharedInstance.platesFadeDuration, delay: 0.0,
                           options: [],
                           animations: {
                            weightEntryTextField.alpha = 1
            }, completion: nil)
            weightEntryTextField.text! = PublicClasses.massFormatter.string(fromValue: GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter)
        #elseif os(OSX)
            NSAnimationContext.runAnimationGroup({ (context) -> Void in
                context.duration = GlobalVariables.sharedInstance.animationTime
                weightEntryTextField.animator().alphaValue = 1
            }, completionHandler: { () -> Void in
            })
            weightEntryTextField.stringValue = PublicClasses.massFormatter.string(fromValue: GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter)
        #endif
        if GlobalVariables.sharedInstance.alwaysSort == true {
            PublicClasses.drawPlates(platesView)
        }
    }
    #endif

    class func platesInUseFinder(_ labelOutputTextOutput: [String: Int]) {
        if GlobalVariables.sharedInstance.keyPadUsedNow == true && GlobalVariables.sharedInstance.errorState == false {
            if labelOutputTextOutput.count > 0 {
                let keys = Array(labelOutputTextOutput.keys).sorted()
                for i in 0...keys.count-1 {
                    for _ in 1...labelOutputTextOutput[keys[i]]! {
                        GlobalVariables.sharedInstance.currentPlatesInUse += [keys[i]]
                    }
                }
            }
        }
    }



    class func setPlatesButtonsEnabledStatus(_ platesLabel: PlatesLabelVar, FiftyFiveLbsButton: Button, FortyFiveLbsButton: Button, ThirtyFiveLbsButton: Button, TwentyFiveLbsButton: Button, FifteenLbsButton: Button, TenLbsButton: Button, FiveLbsButton: Button, TwoPointFiveLbsButton: Button, OnePointTwoFiveLbsButton: Button, weightEntryTextField: TextField, platesView: View?=nil) {
        var counts:[String:Int] = [:]
        for item in GlobalVariables.sharedInstance.currentPlatesInUse {
            if item.contains(GlobalVariables.sharedInstance.units) {
            counts[item] = (counts[item] ?? 0) + 1
            }
        }
        let currentPlatesInUseTuples = Array(counts).sorted(by: >)
        var currentPlatesUnitsOnly = Array(GlobalVariables.sharedInstance.currentPlates[0...8])
        var currentInventorySetUnitsOnly = Array(GlobalVariables.sharedInstance.currentInventorySet[0...8])
        if GlobalVariables.sharedInstance.units == "lbs" {
            currentPlatesUnitsOnly = Array(GlobalVariables.sharedInstance.currentPlates[9...17])
            currentInventorySetUnitsOnly = Array(GlobalVariables.sharedInstance.currentInventorySet[9...17])
        }
        print(currentInventorySetUnitsOnly)
        for i in 0...8 {
            PublicClasses.enableCertainPlateButtons(i, TF: true, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton)
            print(currentPlatesUnitsOnly[i])
            if currentInventorySetUnitsOnly[i] == 0 {
PublicClasses.enableCertainPlateButtons(i, TF: false, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton)
            }
        }
        for (key,value) in currentPlatesInUseTuples {
            let valueNew = Double(key.components(separatedBy: " ")[0])!
            let differenceValue = currentInventorySetUnitsOnly[currentPlatesUnitsOnly.index(of: valueNew)!]/2 - value
            if differenceValue <= 0 {
                PublicClasses.enableCertainPlateButtons(currentPlatesUnitsOnly.index(of: valueNew)!, TF: false, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton)
            }
        }
    }


    #if os(iOS)  || os(OSX) || os(tvOS)
    class func drawPlates(_ platesView: View) {
        if GlobalVariables.sharedInstance.alwaysSort == true {
            GlobalVariables.sharedInstance.currentPlatesInUse = PublicClasses.sortCurrentPlatesInUse(GlobalVariables.sharedInstance.currentPlatesInUse)
        }
        for view in platesView.subviews {
            if view.isKind(of: ImageView.self) {
                view.removeFromSuperview()
            }
        }
        var platesInUse = GlobalVariables.sharedInstance.currentPlatesInUse
        if platesInUse.count > 0 {
            var currentPlatesWithUnits = GlobalVariables.sharedInstance.currentPlates[0...8].map({String($0) + " Kg"})
            currentPlatesWithUnits += GlobalVariables.sharedInstance.currentPlates[9...17].map({String($0) + " lbs"})
            var xPos = platesView.bounds.maxX
            var totalPlateWidth: CGFloat = 0
            for i in 0...platesInUse.count-1 {
                totalPlateWidth += CGFloat(GlobalVariables.sharedInstance.currentPlateWidths[currentPlatesWithUnits.index(of: platesInUse[i])!])
            }
            totalPlateWidth += 30
            totalPlateWidth = max(totalPlateWidth, 415)
            print(platesView.frame.width)
            var newWidthTotal: CGFloat = 0
            for i in 0...platesInUse.count-1 {
                var heightNotNormalized: CGFloat = 78
                var widthNotNormalized: CGFloat = 30
                if i != -2 && i != -1 {
                    heightNotNormalized = CGFloat(GlobalVariables.sharedInstance.currentPlateHeights[currentPlatesWithUnits.index(of: platesInUse[i])!])
                    widthNotNormalized = CGFloat(GlobalVariables.sharedInstance.currentPlateWidths[currentPlatesWithUnits.index(of: platesInUse[i])!])
                }
                else if i == -2 {
                    heightNotNormalized = 50
                    widthNotNormalized = 415
                }
                var heightNormalized: CGFloat = CGFloat()
                var widthNormalized: CGFloat = CGFloat()
                if (platesView.bounds.width / totalPlateWidth * CGFloat(GlobalVariables.sharedInstance.currentPlateHeights.max()!)) > platesView.bounds.height {
                    let scale = platesView.bounds.height / CGFloat(GlobalVariables.sharedInstance.currentPlateHeights.max()!)
                    heightNormalized = scale * heightNotNormalized
                    widthNormalized = scale * widthNotNormalized
                }
                else {
                    heightNormalized = platesView.bounds.width / totalPlateWidth * heightNotNormalized
                    widthNormalized = platesView.bounds.width / totalPlateWidth * widthNotNormalized
                }
                newWidthTotal += widthNormalized
                let imageSize: CGSize = CGSize(width: widthNormalized, height: heightNormalized)
                xPos = xPos - widthNormalized
                if i == -1 {
                    xPos = platesView.bounds.maxX - widthNormalized
                }
                let plateImageView: ImageView = ImageView(frame: CGRect(origin: CGPoint(x: xPos, y: platesView.bounds.midY-heightNormalized/2), size: imageSize))
                plateImageView.tag = 752837
                #if os(iOS) || os(tvOS)
                    plateImageView.cornerRadius = 5/292*plateImageView.frame.height
                    var plateColor: Color = Color.gray
                    if i != -2 && i != -1 {
                        plateColor = GlobalVariables.sharedInstance.plateColors[currentPlatesWithUnits.index(of: platesInUse[i])!]
                    }
                    plateImageView.backgroundColor = plateColor
                    #if os(iOS)
                        plateImageView.borderWidth = 0.5
                    #elseif os(tvOS)
                        plateImageView.borderWidth = 1
                    #endif
                    plateImageView.borderColor = GlobalVariables.sharedInstance.borderColor
                #elseif os(OSX)
                    plateImageView.wantsLayer = true
                    var colorNow: Color = GlobalVariables.sharedInstance.keyPadBackgroundViewColor
                    if i != -2 && i != -1 {
                        colorNow = GlobalVariables.sharedInstance.currentPlateColors[currentPlatesWithUnits.index(of: platesInUse[i])!]
                    }
                    plateImageView.layer?.cornerRadius = 5/292*plateImageView.frame.height
                    plateImageView.layer?.backgroundColor = colorNow.cgColor
                    plateImageView.layer?.borderColor = GlobalVariables.sharedInstance.borderColor.cgColor
                    plateImageView.layer?.borderWidth = 0.5
                #endif
                platesView.addSubview(plateImageView)
            }
        }
        if View.userInterfaceLayoutDirection(for: platesView.semanticContentAttribute) == UIUserInterfaceLayoutDirection.rightToLeft {
            platesView.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
    }
    #endif

    class func resetEverything(_ platesLabel: PlatesLabelVar, FiftyFiveLbsButton: Button, FortyFiveLbsButton: Button, ThirtyFiveLbsButton: Button, TwentyFiveLbsButton: Button, FifteenLbsButton: Button, TenLbsButton: Button, FiveLbsButton: Button, TwoPointFiveLbsButton: Button, OnePointTwoFiveLbsButton: Button, weightEntryTextField: PlatesTextField, platesView: View?, GoButton: Button?, titleLabel: TitleLabelVar?=nil, animate: Bool = false, onEachSideGroup: Group?=nil) {
        #if os(iOS) || os(tvOS)
            GoButton?.isEnabled = false
            weightEntryTextField.resignFirstResponder()
            platesLabel.alpha = 1
            platesView!.alpha = 1
            weightEntryTextField.alpha = 1
        #elseif os(OSX)
            platesLabel.alphaValue = 1
            platesView!.alphaValue = 1
            weightEntryTextField.alphaValue = 1
        #endif
        GlobalVariables.sharedInstance.weightToLift = GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight
        GlobalVariables.sharedInstance.currentPlatesInUse = [String]()
        GlobalVariables.sharedInstance.errorState=false
        GlobalVariables.sharedInstance.keyPadUsedNow = false
        PublicClasses.setPlatesButtonsEnabledStatus(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView)
        #if os(iOS) || os(tvOS)
            weightEntryTextField.placeholder = GlobalVariables.sharedInstance.weightToLiftString
            #if os(iOS)
                weightEntryTextField.errorMessage = ""
                weightEntryTextField.setTitleVisible(false, animated: true, animationCompletion: { (finished: Bool) -> Void in
                    PublicClasses.setToWeightTextField(weightEntryTextField, platesView: platesView!)
                })
            #elseif os(tvOS)
                PublicClasses.setToWeightTextField(weightEntryTextField, platesView: platesView!)
            #endif
            platesLabel.text = ""
            UIView.transition(with: GoButton!, duration: GlobalVariables.sharedInstance.platesFadeDuration, options: [.transitionCrossDissolve], animations: {
                weightEntryTextField.text = ""
            }, completion: nil)
        #elseif os(OSX)
            //        self.weightEntryTextField.errorMessage = ""
            titleLabel?.textColor = GlobalVariables.sharedInstance.secondaryColor
            platesLabel.string = ""
            weightEntryTextField.placeholderString = GlobalVariables.sharedInstance.weightToLiftString
            NSAnimationContext.runAnimationGroup({ (context) -> Void in
                context.duration = GlobalVariables.sharedInstance.animationTime
                weightEntryTextField.stringValue = ""
            }, completionHandler: { () -> Void in
            })
            
        #elseif os(watchOS)
            PublicClasses.setupTable(platesInUse: [:], table: platesLabel)
        #endif
        #if os(iOS) || os(tvOS) || os(OSX)
            PublicClasses.drawPlates(platesView!)
        #endif
    }
    
    
}
