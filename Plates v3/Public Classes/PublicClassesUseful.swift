//
//  PublicClasses.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 5/29/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import Foundation
import CoreData
import JVFloatLabeledText
import UIKit

extension PublicClasses {
    class func keyboardWillShow(notification: NSNotification, textFieldFrame: CGRect, pageView: UIView) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if keyboardSize.height >= textFieldFrame.minY {
                app.status.keypadMovedUp = true
                pageView.frame.origin.y -= keyboardSize.height - textFieldFrame.minY
            }
            app.status.keyboardHeight = keyboardSize.height
        }
    }
    
    class func keyboardWillHide(notification: Notification, textFieldFrame: CGRect, pageView: UIView) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if app.status.keypadMovedUp == true {
                var keyBoardHeightT: CGFloat = keyboardSize.height
                if keyboardSize.height == 0 {
                    keyBoardHeightT = app.status.keyboardHeight
                }
                pageView.frame.origin.y += keyBoardHeightT - textFieldFrame.minY
                app.status.keypadMovedUp = false
            }
        }
    }
    
    class var currentLocaleUnit: UnitOfWeight {
        let isMetric: Bool = Locale.current.usesMetricSystem
        if isMetric == true {
            return(UnitOfWeight(unit: UnitOfWeight.unitType.kg))
        }
        else {
            return(UnitOfWeight(unit: UnitOfWeight.unitType.lb))
        }
    }
    
    class var numberFormatterDecimal: NumberFormatter {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.maximumIntegerDigits = 4
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.groupingSeparator = ""        
        return numberFormatter
    }

    class var massFormatter: MassFormatter {
        let massFormatter: MassFormatter = MassFormatter()
        massFormatter.unitStyle = .medium
        massFormatter.numberFormatter = PublicClasses.numberFormatterDecimal
        return massFormatter
    }

    class var percentFormatter: NumberFormatter {
        let numberFormatter: NumberFormatter = PublicClasses.numberFormatterDecimal
        numberFormatter.numberStyle = NumberFormatter.Style.percent
        return numberFormatter
    }
//
//    class func unitToFormatter(_ unit: String) -> MassFormatter.Unit {
//        if unit == "Kg" {
//            return MassFormatter.Unit.kilogram
//        }
//        return MassFormatter.Unit.pound
//    }
//
//
//    class func unitToOppositeUnitFormatter(_ unit: String) -> MassFormatter.Unit {
//        if unit != "Kg" {
//            return MassFormatter.Unit.kilogram
//        }
//        return MassFormatter.Unit.pound
//    }
//
//    class func unitToOppositeString(_ unit: String) -> String {
//        if unit != "Kg" {
//            return "lbs"
//        }
//        return "Kg"
//    }
//
//
//    class func findMinCurrentPlates(_ currentPlates: [Double]) -> Double {
//        var currentPlatesWithUnits = GlobalVariables.sharedInstance.currentPlates[0...8].map({String($0) + " Kg"})
//        currentPlatesWithUnits += GlobalVariables.sharedInstance.currentPlates[9...17].map({String($0) + " lbs"})
//        var convertedToKg = [Double]()
//        for i in currentPlatesWithUnits {
//            let units = i.components(separatedBy: " ")[1]
//            let value = Double(i.components(separatedBy: " ")[0])!
//            let origString = i
//            if GlobalVariables.sharedInstance.units == "Kg" {
//                if units == "lbs" {
//                    convertedToKg.append((value * 0.453592).roundToPlaces(GlobalVariables.sharedInstance.currentDecimalPlaces))
//                }
//                else {
//                    convertedToKg.append(value)
//                }
//            }
//            else if GlobalVariables.sharedInstance.units == "lbs" {
//                if units == "Kg" {
//                    convertedToKg.append((value / 0.453592).roundToPlaces(GlobalVariables.sharedInstance.currentDecimalPlaces))
//                }
//                else {
//                    convertedToKg.append(value)
//                }
//            }
//        }
//        let combined = zip(convertedToKg, currentPlatesWithUnits).sorted {$0.0 > $1.0}
//        convertedToKg = combined.map {$0.0}
//        currentPlatesWithUnits = combined.map {$0.1}
//
//        var list: [String] = [String]()
//        for j in 0...currentPlatesWithUnits.count-1 {
//            if GlobalVariables.sharedInstance.currentInventorySet[j] > 0 {
//                    list.append(currentPlatesWithUnits[j])
//            }
//        }
//
//        let minValue = list.map({Double($0.components(separatedBy: " ")[0])!}).min()!
//        return minValue
//    }
//
////    #if os(watchOS)
//    class func dictionaryOfCurrentPlatesInUse(currentPlatesInUseInput: [String]) -> [String:Int] {
//        var counts:[String:Int] = [:]
//        for item in GlobalVariables.sharedInstance.currentPlatesInUse {
//            counts[item] = (counts[item] ?? 0) + 1
//        }
//        var weightsPreviousOutPut: [String:Int] = [:]
//        let sortedKeys = Array(counts).sorted(by: >)
//        for (key, value) in sortedKeys {
//            for j in 0...GlobalVariables.sharedInstance.currentPlates.count-1 {
//                if Double(key.components(separatedBy: " ")[0])! == GlobalVariables.sharedInstance.currentPlates[j] {
//                    weightsPreviousOutPut[key] = value
//                }
//            }
//        }
//        return weightsPreviousOutPut
//    }
////    #endif
//
//    class func convertToUnit(_ value: Double, toUnit: String) -> Double {
//        var newValue = value
//        if toUnit == "lbs" {
//            newValue = newValue / 0.453592
//        }
//        else if toUnit == "Kg" {
//            newValue = newValue * 0.453592
//        }
//        return newValue
//    }
//
//    class func reduceCurrentPlatesInUse(currentPlatesInUseInput: [String]) -> Double {
//        let results = dictionaryOfCurrentPlatesInUse(currentPlatesInUseInput: currentPlatesInUseInput).flatMap { (key, value) in key.contains(PublicClasses.unitToOppositeString(GlobalVariables.sharedInstance.units)) ? Double(key.components(separatedBy: " ")[0])!*Double(value) : PublicClasses.convertToUnit(Double(key.components(separatedBy: " ")[0])!*Double(value), toUnit: GlobalVariables.sharedInstance.units) }
//        let resultsSum = results.reduce(0, +) * 2
//        return resultsSum
//    }
//
//    class func stillLower() -> Bool {
//        var stillLower: Bool = true
//        if stillLower == true {
//            var counts:[String:Int] = [:]
//            for item in GlobalVariables.sharedInstance.currentPlatesInUse {
//                counts[item] = (counts[item] ?? 0) + 1
//            }
//            var currentPlatesWithUnits = GlobalVariables.sharedInstance.currentPlates[0...8].map({String($0) + " Kg"})
//            currentPlatesWithUnits += GlobalVariables.sharedInstance.currentPlates[9...17].map({String($0) + " lbs"})
//            for i in 0...currentPlatesWithUnits.count-1 {
//                for (key,value) in counts {
//                    if currentPlatesWithUnits[i] == key {
//                                                if GlobalVariables.sharedInstance.currentInventorySet[i] < value {
//                                                    stillLower = false
//                                                    break
//                                                }
//                                                continue
//                    }
//                }
//            }
//        }
//        return stillLower
//    }
//
//    class func sortCurrentPlatesInUse(_ currentPlatesInUse: [String]) -> [String] {
//        var platesTemp = [Double]()
//        for i in currentPlatesInUse.map({$0.components(separatedBy: " ")}) {
//            var value: Double = Double(i[0])!
//            let unit: String = i[1]
//            if unit == "lbs" {
//                value = value * 0.453592
//            }
//            platesTemp.append(value)
//        }
//        let combined = zip(platesTemp, currentPlatesInUse).sorted {$0.0 < $1.0}
//        return combined.map {$0.1}.reversed()
//    }
//
}

