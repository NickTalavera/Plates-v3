//
//  PublicClasses.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 5/29/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//
//
import Foundation
import CoreData
import UIKit
import JVFloatLabeledText

extension PublicClasses {
    class func removeUnitsFromText(_ placeholderText: String) -> String {
        var text: String = placeholderText
//                text = text.replace(PublicClasses.massFormatter.unitString(fromValue: GlobalVariables.sharedInstance.weightToLift, unit: GlobalVariables.sharedInstance.unitsFormatter), withString: "")
//                text = text.replace(PublicClasses.massFormatter.unitString(fromValue: 0, unit: GlobalVariables.sharedInstance.unitsFormatter), withString: "")
//                let decimalSeperator: String = PublicClasses.numberFormatterDecimal.decimalSeparator
//                do {
//                    let regex = try NSRegularExpression(pattern: "[^0-9\(decimalSeperator)]", options: NSRegularExpression.Options.caseInsensitive)
//
//                    //replace all not required characters with empty string ""
//                    text = regex.stringByReplacingMatches(in: text, options: NSRegularExpression.MatchingOptions.withTransparentBounds, range: NSMakeRange(0, text.characters.count), withTemplate: "")
//                } catch {
//                    print("Cant convert")
//                }
                return text
    }
//
//    #if os(iOS) || os(tvOS) || os(OSX)
//    class func textFieldDecimalVerification(_ textField: TextField, range: NSRange, string: String, GoButton: Button=Button(), maxDecimalPlaces: Int, maxIntegerPlaces: Int, unit: MassFormatter.Unit=GlobalVariables.sharedInstance.unitsFormatter, percentageMode: Bool) -> Bool {
//    var result = true
//    GlobalVariables.sharedInstance.keyPadUsedNow = false
//        #if os(iOS) || os(tvOS)
//            let prospectiveText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
//        #elseif os(OSX)
//    let prospectiveText = (textField.stringValue as NSString).replacingCharacters(in: range, with: string)
//            #endif
//    if string.characters.count > 0 {
//    GoButton.isEnabled = true
//    let decimalSeperator: String = PublicClasses.numberFormatterDecimal.decimalSeparator
//    var disallowedCharacterSet = CharacterSet(charactersIn: "0123456789\(decimalSeperator)").inverted
//    if percentageMode == true {
//    disallowedCharacterSet = CharacterSet(charactersIn: "0123456789").inverted
//    }
//    let replacementStringIsLegal = string.rangeOfCharacter(from: disallowedCharacterSet) == nil
//    let resultingStringLengthIsLegal = prospectiveText.characters.count <= maxDecimalPlaces + maxIntegerPlaces + 1
//    let split = prospectiveText.components(separatedBy: decimalSeperator)
//    var resultingDecimalPlaceStringLengthIsLegal = true
//    var resultingIntegerPlaceStringLengthIsLegal = true
//    var noDecimalLengthisLegal = true
//    if split.count == 1 {
//    noDecimalLengthisLegal = split[0].characters.count <= maxIntegerPlaces
//    }
//    if split.count >= 1 {
//    resultingIntegerPlaceStringLengthIsLegal = split[0].characters.count <= maxIntegerPlaces
//    }
//    if split.count >= 2 {
//    resultingDecimalPlaceStringLengthIsLegal = split[1].characters.count <= maxDecimalPlaces
//    }
//    let resultingTextIsNumeric = PublicClasses.numberFormatterDecimal.number(from: prospectiveText) != nil
//    result = replacementStringIsLegal && resultingStringLengthIsLegal && resultingTextIsNumeric && resultingIntegerPlaceStringLengthIsLegal && resultingDecimalPlaceStringLengthIsLegal && noDecimalLengthisLegal
//    }
//
//
//    if result == true {
//            #if os(iOS) || os(tvOS)
//    View.transition(with: GoButton, duration: GlobalVariables.sharedInstance.platesFadeDuration, options: [.transitionCrossDissolve], animations: {
//    GoButton.setTitle(NSLocalizedString("Calculate", comment: ""), for: .normal)
//    }, completion: nil)
//            #elseif os(OSX)
//        NSAnimationContext.runAnimationGroup({ (context) -> Void in
//            context.duration = GlobalVariables.sharedInstance.animationTime
//            GoButton.title = NSLocalizedString("Calculate", comment: "")
//            }, completionHandler: { () -> Void in
//        })
//                #endif
//    }
//    return result
//    }
//    #endif
//
    class func labelPlateOutputFromCurrentPlatesInUse(_ currentPlatesInUse: [String]) -> String {
        var counts: [String:Int] = [:]
        for item in currentPlatesInUse {
            counts[item] = (counts[item] ?? 0) + 1
        }
        return PublicClasses.formatLabel(counts)
    }

    class func formatLabel(_ currentPlatesInUse: [String:Int]) -> String {
        var labelOut: String = ""
//        if currentPlatesInUse.count > 0 {
//            labelOut = "\(NSLocalizedString("On each side", comment: ""))\n"
//            let currentPlatesWithUnits = Array(currentPlatesInUse.keys)
//            var valDict = [Double]()
//            var stringDict = [String]()
//            var unitDict = [String]()
//            for i in currentPlatesWithUnits.map({$0.components(separatedBy: " ")}) {
//                let origString = i[0] + " " + i[1]
//                var value: Double = Double(i[0])!
//                let unit: String = i[1]
//                if unit == "lbs" {
//                    value = value * 0.453592
//                }
//                valDict.append(value)
//                stringDict.append(origString)
//                unitDict.append(unit)
//            }
//            stringDict = zip(valDict, stringDict).sorted {$0.0 > $1.0}.map {$0.1}
//            unitDict = zip(valDict, unitDict).sorted {$0.0 > $1.0}.map {$0.1}
//            for i in 0...stringDict.count-1 {
//                labelOut += "\(PublicClasses.massFormatter.string(fromValue: Double(stringDict[i].components(separatedBy: " ")[0])!, unit: PublicClasses.unitToFormatter(unitDict[i]))) × \(currentPlatesInUse[stringDict[i]]!)\n"
//            }
//        }
        return labelOut.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
//
//
//    class func labelOutputText(_ weightToConvert: Double) -> [String: Int] {
//        GlobalVariables.sharedInstance.errorState = false
//        var currentPlatesWithUnits = GlobalVariables.sharedInstance.currentPlates[0...8].map({String($0) + " Kg"})
//        currentPlatesWithUnits += GlobalVariables.sharedInstance.currentPlates[9...17].map({String($0) + " lbs"})
//        var convertedToKgOld = [Double]()
//        for i in currentPlatesWithUnits {
//            let units = i.components(separatedBy: " ")[1]
//            let value = Double(i.components(separatedBy: " ")[0])!
//            let origString = i
//            if GlobalVariables.sharedInstance.units == "Kg" {
//                if units == "lbs" {
//                    convertedToKgOld.append((value * 0.453592).roundToPlaces(GlobalVariables.sharedInstance.currentDecimalPlaces))
//                }
//                else {
//                    convertedToKgOld.append(value)
//                }
//            }
//            else if GlobalVariables.sharedInstance.units == "lbs" {
//                if units == "Kg" {
//                    convertedToKgOld.append((value / 0.453592).roundToPlaces(GlobalVariables.sharedInstance.currentDecimalPlaces))
//                }
//                else {
//                    convertedToKgOld.append(value)
//                }
//            }
//        }
//        let combined = zip(convertedToKgOld, currentPlatesWithUnits).sorted {$0.0 > $1.0}
//        let convertedToKg = combined.map {$0.0}
//        currentPlatesWithUnits = combined.map {$0.1}
//        let combinedInventorySet = zip(convertedToKgOld, GlobalVariables.sharedInstance.currentInventorySet).sorted {$0.0 > $1.0}.map {$0.1}
//        print(currentPlatesWithUnits)
//        print(convertedToKg)
//
//        var weightLabels = [String:Int]()
//        var halfWeight = (weightToConvert - GlobalVariables.sharedInstance.currentBarWeight - GlobalVariables.sharedInstance.currentCollarWeight) / 2
//        var list: [String] = [String]()
//        for j in 0...currentPlatesWithUnits.count-1 {
//            if combinedInventorySet[j] > 0 {
//                for _ in 1...combinedInventorySet[j]/2 {
//                    list.append(currentPlatesWithUnits[j])
//                }
//            }
//        }
//
//        let minValue = list.map({Double($0.components(separatedBy: " ")[0])!}).min()!
//        halfWeight =  halfWeight - (halfWeight.truncatingRemainder(dividingBy: minValue))
//
//        var remainder = (Double(weightToConvert)-(GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight)).roundToPlaces(GlobalVariables.sharedInstance.currentDecimalPlaces)
//        var currentInventoryTemp = combinedInventorySet
//        for i in 0...currentPlatesWithUnits.count-1 {
//            print(currentPlatesWithUnits[i])
//            weightLabels[currentPlatesWithUnits[i]] = 0
//            print(currentInventoryTemp[i])
//            while remainder + 0.001 >= convertedToKg[i]*2 && currentInventoryTemp[i] > 0 {
//                remainder=remainder-convertedToKg[i]*2
//                weightLabels[currentPlatesWithUnits[i]] = weightLabels[currentPlatesWithUnits[i]]! + 1
//                currentInventoryTemp[i] = currentInventoryTemp[i] - 2
//            }
//        }
//        for (key,value) in weightLabels {
//            if value == 0 {
//                weightLabels.removeValue(forKey: key)
//            }
//        }
//        print(weightLabels)
////        var sumOfWeightLabels: Double = 0
////        for (key,value) in weightLabels {
////            sumOfWeightLabels += Double(key.components(separatedBy: " ")[0])! * Double(value)
////        }
//        var currentPlatesInUse: [String] = [String]()
//        if weightLabels.count > 0 {
//            let keys = Array(weightLabels.keys).sorted()
//            for i in 0...keys.count-1 {
//                for _ in 1...weightLabels[keys[i]]! {
//                    currentPlatesInUse += [keys[i]]
//                }
//            }
//        }
//        GlobalVariables.sharedInstance.currentPlatesInUse = currentPlatesInUse
////        //        var currentPlatesInUseCandidate = currentPlatesInUse
////        //        var smallestDifferenceCandidate = halfWeight - currentPlatesInUseCandidate.reduce(0, combine: +)
////        //        var platesAvailable = list
////        //        print("currentPlatesInUseCandidate")
////        //        print(currentPlatesInUseCandidate)
////        //        print(smallestDifferenceCandidate)
////        //
////        //        if smallestDifferenceCandidate != 0 {
////        //            var currentPlatesInUseNew = [Double](currentPlatesInUse.reverse())
////        //            while sumOfWeightLabels != halfWeight && currentPlatesInUseNew.count > 0 {
////        //                tries += 1
////        //                print()
////        //                print(tries)
////        //                let lastItemInCurrentPlates: Double = currentPlatesInUseNew.last!
////        //                var counts:[Double:Int] = [:]
////        //                for item in currentPlatesInUseNew {
////        //                    counts[item] = (counts[item] ?? 0) + 1
////        //                }
////        //                currentPlatesInUseNew.removeLast()
////        //
////        //                platesAvailable = list
////        //                platesAvailable = platesAvailable.filter { $0 != lastItemInCurrentPlates}
////        //                print("platesAvailable")
////        //                print(platesAvailable)
////        //                var counter = 0
////        //                while platesAvailable.count > 1 && remainder != 0 {
////        //                    platesAvailable = list
////        //                    counter += 1
////        //                    print(counter)
////        //                    platesAvailable.removeLast(counter)
////        //
////        //
////        //                    print("platesAvailable")
////        //                    print(platesAvailable)
////        //
////        //
////        //                    //                while remainder != 0 {
////        //                    for i in currentPlatesInUseNew {
////        //                        let index = platesAvailable.indexOf(i)
////        //                        if index != nil {
////        //                            platesAvailable.removeAtIndex(index!)
////        //                        }
////        //                    }
////        //
////        //                    var remainder = halfWeight - currentPlatesInUseNew.reduce(0, combine: +)
////        //                    platesAvailable = platesAvailable.filter { $0 <= remainder}
////        //                    var weightLabelsTry = currentPlatesInUseNew
////        //                    for i in 0...GlobalVariables.sharedInstance.currentPlates.count-1 {
////        //                        weightLabels[GlobalVariables.sharedInstance.currentPlates[i]] = 0
////        //                        for plateNow in platesAvailable {
////        //                            if (remainder - plateNow) > 0 {
////        //                                weightLabelsTry.append(plateNow)
////        //                                remainder = remainder - plateNow
////        //                            }
////        //                        }
////        //                    }
////        //                    if remainder < smallestDifferenceCandidate {
////        //                        currentPlatesInUseCandidate = weightLabelsTry
////        //                        smallestDifferenceCandidate = remainder
////        //                    }
////        //                    print("Candidate")
////        //                    print(currentPlatesInUseCandidate)
////        //                    print(smallestDifferenceCandidate)
////        //                    //                }
////        //
////        //                }
////        //                sumOfWeightLabels = 0
////        //                for (key,value) in weightLabels {
////        //                    sumOfWeightLabels += key * Double(value)
////        //                }
////        //            print(sumOfWeightLabels)
////        //        }
////        //
////        //
////        //            print("currentPlatesInUseCandidate")
////        //            print(currentPlatesInUseCandidate)
////        //        weightLabels = [:]
////        //        for item in currentPlatesInUseCandidate {
////        //            weightLabels[item] = (weightLabels[item] ?? 0) + 1
////        //        }
////        //        }
//        return weightLabels
//    }
//
//    #if os(iOS) || os(tvOS)
//    class func getFontSizeToFitFrameOfLabel(_ button: Button, maxTextSize: CGFloat, frameToFit: CGRect) -> CGFloat {
//    if (button.titleLabel?.text?.characters.count == 0 || button.bounds.size.equalTo(CGSize.zero)) {
//    return button.titleLabel!.font.pointSize
//    }
//    let textViewTemp = Label(frame: frameToFit)
//    textViewTemp.font = button.titleLabel!.font
//    textViewTemp.text = button.title(for: .normal)!
//    let textViewSize = textViewTemp.frame.size;
//    let fixedWidth = textViewSize.width;
//    let fixedHeight = textViewSize.height;
//    let expectSize = textViewTemp.sizeThatFits(CGSize.init(width: fixedWidth, height: fixedHeight));
//    var expectFont = textViewTemp.font;
//    if (expectSize.width > textViewSize.width - 5) {
//    while (textViewTemp.sizeThatFits(CGSize.init(width: fixedWidth, height: fixedHeight)).width > textViewSize.width - 5) {
//    expectFont = Font.systemFont(ofSize: min((expectFont?.pointSize)!-1,maxTextSize), weight: UIFont.Weight.thin)
//    textViewTemp.font = expectFont
//    }
//    }
//    else {
//    var titleFont = textViewTemp.font?.pointSize
//    while (textViewTemp.sizeThatFits(CGSize.init(width: fixedWidth, height: fixedHeight)).width < textViewSize.width - 5) {
//    expectFont = Font.systemFont(ofSize: min((expectFont?.pointSize)!+1,maxTextSize), weight: UIFont.Weight.thin)
//    textViewTemp.font = expectFont
//    if textViewTemp.font?.pointSize == titleFont {
//    break
//    }
//    else {
//    titleFont = textViewTemp.font?.pointSize
//    }
//    }
//    expectFont = Font.systemFont(ofSize: min((expectFont?.pointSize)!,maxTextSize), weight: UIFont.Weight.thin)
//    textViewTemp.font = expectFont
//    }
//    return (expectFont!.pointSize)
//    }
//
//    #endif
//
//
//    #if os(OSX)
//    class func getFontSizeToFitFrameOfLabel(textView: Button, maxTextSize: CGFloat) -> CGFloat {
//        if (textView.stringValue.isEmpty || textView.bounds.size.equalTo(CGSize.zero)) {
//            return (textView.font?.pointSize)!
//        }
//        let textViewTemp = NSTextField(frame: textView.frame)
//        textViewTemp.font = textView.font
//        if #available(OSX 10.11, *) {
//            textViewTemp.maximumNumberOfLines=1
//        } else {
//            // Fallback on earlier versions
//        }
//        let oldFontSize = textView.font?.pointSize
//        textViewTemp.stringValue = textView.title
//        let textViewSize = textViewTemp.frame.size;
//        let fixedWidth = textViewSize.width;
//        let fixedHeight = textViewSize.height;
//        let expectSize = textViewTemp.sizeThatFits(CGSize(width: fixedWidth, height: fixedHeight));
//        var expectFont = textViewTemp.font;
//        if (expectSize.width > textViewSize.width - 5 && (expectFont?.pointSize)!-1 > 5) {
//            while (textViewTemp.sizeThatFits(CGSize(width: fixedWidth, height: fixedHeight)).width > textViewSize.width - 5) && (expectFont?.pointSize)!-1 > 5 {
//                expectFont = Font(name: (expectFont?.fontName)!, size: min((expectFont?.pointSize)!-1,maxTextSize))
//                textViewTemp.font = expectFont
//            }
//        }
//        else {
//            var titleFont = textViewTemp.font?.pointSize
//            while (textViewTemp.sizeThatFits(CGSize(width: fixedWidth, height: fixedHeight)).width < textViewSize.width - 5) && (expectFont?.pointSize)!+1 <= GlobalVariables.sharedInstance.defaultFontSize {
//                expectFont = Font(name: (expectFont?.fontName)!, size: min((expectFont?.pointSize)!+1,maxTextSize))
//                textViewTemp.font = expectFont
//                if textViewTemp.font?.pointSize == titleFont {
//                    break
//                }
//                else {
//                    titleFont = textViewTemp.font?.pointSize
//                }
//            }
//            expectFont = Font(name: (expectFont?.fontName)!, size: min((expectFont?.pointSize)!,maxTextSize))
//            textViewTemp.font = expectFont
//        }
//        if max((textViewTemp.font?.pointSize)!, oldFontSize!) - min((textViewTemp.font?.pointSize)!, oldFontSize!) < 2 {
//            expectFont = Font(name: (expectFont?.fontName)!, size: min((textViewTemp.font?.pointSize)!, oldFontSize!))
//        }
//        textView.font = expectFont
//        return (textView.font?.pointSize)!
//    }
//    #endif
//
//
//    #if os(iOS)  || os(OSX) || os(tvOS)
//    class func setToWeightTextField(_ weightEntryTextField: PlatesTextField, platesView: View, titleLabel: TitleLabelVar?=nil) {
//        PublicClasses.drawPlates(platesView)
//        GlobalVariables.sharedInstance.percentageModeActive = false
//        #if os(iOS)
//            weightEntryTextField.placeholder = GlobalVariables.sharedInstance.weightToLiftString
//            weightEntryTextField.title = NSLocalizedString("Total weight", comment: "")
//            weightEntryTextField.keyboardType = .decimalPad
//        #elseif os(tvOS)
//            titleLabel?.text = NSLocalizedString("Total weight", comment: "")
//            weightEntryTextField.placeholder = NSLocalizedString("Weight to lift", comment: "")
//        #elseif os(OSX)
//            weightEntryTextField.placeholderString = NSLocalizedString("Weight to lift", comment: "")
//            titleLabel?.stringValue = NSLocalizedString("Total weight", comment: "")
//        #endif
//        #if os(tvOS) || os(OSX)
//            titleLabel?.textColor = GlobalVariables.sharedInstance.secondaryColor
//        #endif
//    }
//
//    class func updateTextViewFont(_ textView: PlatesLabelVar, maxTextSize: CGFloat) {
//        #if os(iOS) || os(tvOS)
//            if (textView.text.isEmpty || textView.bounds.size.equalTo(CGSize.zero)) {
//                return;
//            }
//            let textViewSize = textView.frame.size;
//        #elseif os(OSX)
//            if (textView.string!.isEmpty || textView.bounds.size.equalTo(CGSize.zero)) {
//                return;
//            }
//            let textViewTemp = NSTextField(frame: textView.frame)
//            textViewTemp.font = textView.font
//            let oldFontSize = textView.font?.pointSize
//            textViewTemp.stringValue = textView.string!
//            let textViewSize = textViewTemp.frame.size;
//        #endif
//        let fixedWidth = textViewSize.width;
//        let fixedHeight = textViewSize.height;
//        #if os(iOS) || os(tvOS)
//            var expectFont = GlobalVariables.sharedInstance.fontStandard
//            let expectSize = textView.sizeThatFits(CGSize.init(width: fixedWidth, height: fixedHeight));
//            if (expectSize.height > textViewSize.height) {
//                while (textView.sizeThatFits(CGSize.init(width: fixedWidth, height: fixedHeight)).height > textViewSize.height) {
//                    expectFont = Font.systemFont(ofSize: textView.font!.pointSize - 1, weight: UIFont.Weight.thin)
//                    textView.font = Font.systemFont(ofSize: min(maxTextSize,expectFont.pointSize), weight: UIFont.Weight.thin)
//                }
//            }
//            else {
//                while (textView.sizeThatFits(CGSize.init(width: fixedWidth, height: fixedHeight)).height < textViewSize.height) {
//                    expectFont = textView.font!;
//                    textView.font = Font.systemFont(ofSize: textView.font!.pointSize + 1, weight: UIFont.Weight.thin)
//                }
//                textView.font = Font.systemFont(ofSize: min(maxTextSize,expectFont.pointSize), weight: UIFont.Weight.thin)
//            }
//        #elseif os(OSX)
//            let expectSize = textViewTemp.sizeThatFits(CGSize(width: fixedWidth, height: fixedHeight));
//            var expectFont = textViewTemp.font;
//            if (expectSize.height > textViewSize.height) {
//                while (textViewTemp.sizeThatFits(CGSize(width: fixedWidth, height: fixedHeight)).height > textViewSize.height) {
//                    if #available(OSX 10.11, *) {
//                        expectFont = Font.systemFont(ofSize: (expectFont?.pointSize)!-1, weight: NSFontWeightThin)
//                    }
//                    else {
//                        expectFont = Font(name: (expectFont?.fontName)!, size: (expectFont?.pointSize)!-1)
//                    }
//                    textViewTemp.font = expectFont
//                }
//            }
//            else {
//                while (textViewTemp.sizeThatFits(CGSize(width: fixedWidth, height: fixedHeight)).height < textViewSize.height && (expectFont?.pointSize)! < maxTextSize) {
//                    if #available(OSX 10.11, *) {
//                        expectFont = Font.systemFont(ofSize: (expectFont?.pointSize)!+1, weight: NSFontWeightThin)
//                    }
//                    else {
//                        expectFont = Font(name: (expectFont?.fontName)!, size: (expectFont?.pointSize)!+1)
//                    }
//                    textViewTemp.font = expectFont
//                }
//                if #available(OSX 10.11, *) {
//                    expectFont = Font.systemFont(ofSize: min((expectFont?.pointSize)!,maxTextSize), weight: NSFontWeightThin)
//                }
//                else {
//                    expectFont = Font(name: (expectFont?.fontName)!, size: min((expectFont?.pointSize)!,maxTextSize))
//                }
//                textViewTemp.font = expectFont
//            }
//            if max((textViewTemp.font?.pointSize)!, oldFontSize!) - min((textViewTemp.font?.pointSize)!, oldFontSize!) < 2 {
//                if #available(OSX 10.11, *) {
//                    expectFont = Font.systemFont(ofSize: min((textViewTemp.font?.pointSize)!, oldFontSize!), weight: NSFontWeightThin)
//                }
//                else {
//                    expectFont = Font(name: (expectFont?.fontName)!, size: min((textViewTemp.font?.pointSize)!, oldFontSize!))
//                }
//            }
//            textView.font = expectFont
//        #endif
//    }
}
