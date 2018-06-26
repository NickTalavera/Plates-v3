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
    class func textFieldDecimalVerification(_ textField: UITextField, range: NSRange, string: String, maxDecimalPlaces: Int, maxIntegerPlaces: Int, unit: MassFormatter.Unit=app.profile.chosenUnit.formatter, percentageMode: Bool) -> Bool {
        var result = true
        let prospectiveText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if string.count > 0 {
            let decimalSeperator: String = PublicClasses.numberFormatterDecimal.decimalSeparator
            var disallowedCharacterSet = CharacterSet(charactersIn: "0123456789\(decimalSeperator)").inverted
            if percentageMode == true {
                disallowedCharacterSet = CharacterSet(charactersIn: "0123456789").inverted
            }
            let replacementStringIsLegal = string.rangeOfCharacter(from: disallowedCharacterSet) == nil
            let resultingStringLengthIsLegal = prospectiveText.count <= maxDecimalPlaces + maxIntegerPlaces + 1
            let split = prospectiveText.components(separatedBy: decimalSeperator)
            var resultingDecimalPlaceStringLengthIsLegal = true
            var resultingIntegerPlaceStringLengthIsLegal = true
            var noDecimalLengthisLegal = true
            if split.count == 1 {
                noDecimalLengthisLegal = split[0].count <= maxIntegerPlaces
            }
            if split.count >= 1 {
                resultingIntegerPlaceStringLengthIsLegal = split[0].count <= maxIntegerPlaces
            }
            if split.count >= 2 {
                resultingDecimalPlaceStringLengthIsLegal = split[1].count <= maxDecimalPlaces
            }
            let resultingTextIsNumeric = PublicClasses.numberFormatterDecimal.number(from: prospectiveText) != nil
            result = replacementStringIsLegal && resultingStringLengthIsLegal && resultingTextIsNumeric && resultingIntegerPlaceStringLengthIsLegal && resultingDecimalPlaceStringLengthIsLegal && noDecimalLengthisLegal
        }
        return result
    }

    
    class func formatLabel(_ currentPlatesInUse: AppData.Plates) -> String {
        var labelOut: String = ""
        if currentPlatesInUse.list.count > 0 {
            labelOut = "\(NSLocalizedString("On each side", comment: ""))\n"
            
            var counts: Dictionary<Double, Int> = [:]
            var units: Dictionary<Double, MassFormatter.Unit> = [:]
            for (_, element) in currentPlatesInUse.list.enumerated() {
                counts[element.weight] = (counts[element.weight] ?? 0) + (element.count ?? 0)
                units[element.weight] = UnitOfWeight(unit: element.unitType).formatter
            }
            let weights = counts.keys.sorted(by: >)
            for i in 0...weights.count-1 {
                var weight_key = weights[i]
                labelOut += "\(PublicClasses.massFormatter.string(fromValue: weight_key, unit: units[weight_key]!)) × \(counts[weight_key]!)\n"
            }
        }
        return labelOut.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    
        class func labelOutputText(_ weightToConvert: Double) -> [String: Int] {
            app.status.errorState = false
//            var currentPlatesWithUnits = GlobalVariables.sharedInstance.currentPlates[0...8].map({String($0) + " Kg"})
//            currentPlatesWithUnits += GlobalVariables.sharedInstance.currentPlates[9...17].map({String($0) + " lbs"})
//            var convertedToKgOld = [Double]()
//            for i in currentPlatesWithUnits {
//                let units = i.components(separatedBy: " ")[1]
//                let value = Double(i.components(separatedBy: " ")[0])!
//                let origString = i
//                if GlobalVariables.sharedInstance.units == "Kg" {
//                    if units == "lbs" {
//                        convertedToKgOld.append((value * 0.453592).roundToPlaces(GlobalVariables.sharedInstance.currentDecimalPlaces))
//                    }
//                    else {
//                        convertedToKgOld.append(value)
//                    }
//                }
//                else if GlobalVariables.sharedInstance.units == "lbs" {
//                    if units == "Kg" {
//                        convertedToKgOld.append((value / 0.453592).roundToPlaces(GlobalVariables.sharedInstance.currentDecimalPlaces))
//                    }
//                    else {
//                        convertedToKgOld.append(value)
//                    }
//                }
//            }
//            let combined = zip(convertedToKgOld, currentPlatesWithUnits).sorted {$0.0 > $1.0}
//            let convertedToKg = combined.map {$0.0}
//            currentPlatesWithUnits = combined.map {$0.1}
//            let combinedInventorySet = zip(convertedToKgOld, GlobalVariables.sharedInstance.currentInventorySet).sorted {$0.0 > $1.0}.map {$0.1}
//            print(currentPlatesWithUnits)
//            print(convertedToKg)
//
            var weightLabels = [String:Int]()
//            var halfWeight = (weightToConvert - GlobalVariables.sharedInstance.currentBarWeight - GlobalVariables.sharedInstance.currentCollarWeight) / 2
//            var list: [String] = [String]()
//            for j in 0...currentPlatesWithUnits.count-1 {
//                if combinedInventorySet[j] > 0 {
//                    for _ in 1...combinedInventorySet[j]/2 {
//                        list.append(currentPlatesWithUnits[j])
//                    }
//                }
//            }
//
//            let minValue = list.map({Double($0.components(separatedBy: " ")[0])!}).min()!
//            halfWeight =  halfWeight - (halfWeight.truncatingRemainder(dividingBy: minValue))
//
//            var remainder = (Double(weightToConvert)-(GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight)).roundToPlaces(GlobalVariables.sharedInstance.currentDecimalPlaces)
//            var currentInventoryTemp = combinedInventorySet
//            for i in 0...currentPlatesWithUnits.count-1 {
//                print(currentPlatesWithUnits[i])
//                weightLabels[currentPlatesWithUnits[i]] = 0
//                print(currentInventoryTemp[i])
//                while remainder + 0.001 >= convertedToKg[i]*2 && currentInventoryTemp[i] > 0 {
//                    remainder=remainder-convertedToKg[i]*2
//                    weightLabels[currentPlatesWithUnits[i]] = weightLabels[currentPlatesWithUnits[i]]! + 1
//                    currentInventoryTemp[i] = currentInventoryTemp[i] - 2
//                }
//            }
//            for (key,value) in weightLabels {
//                if value == 0 {
//                    weightLabels.removeValue(forKey: key)
//                }
//            }
//            print(weightLabels)
//    //        var sumOfWeightLabels: Double = 0
//    //        for (key,value) in weightLabels {
//    //            sumOfWeightLabels += Double(key.components(separatedBy: " ")[0])! * Double(value)
//    //        }
//            var currentPlatesInUse: [String] = [String]()
//            if weightLabels.count > 0 {
//                let keys = Array(weightLabels.keys).sorted()
//                for i in 0...keys.count-1 {
//                    for _ in 1...weightLabels[keys[i]]! {
//                        currentPlatesInUse += [keys[i]]
//                    }
//                }
//            }
//            GlobalVariables.sharedInstance.currentPlatesInUse = currentPlatesInUse
//
            return weightLabels
        }
    
        class func getFontSizeToFitFrameOfLabel(_ button: UIButton, maxTextSize: CGFloat, frameToFit: CGRect) -> CGFloat {
            if (button.titleLabel?.text?.characters.count == 0 || button.bounds.size.equalTo(CGSize.zero)) {
                return button.titleLabel!.font.pointSize
            }
            let textViewTemp = UILabel(frame: frameToFit)
            textViewTemp.font = button.titleLabel!.font
            textViewTemp.text = button.title(for: .normal)!
            let textViewSize = textViewTemp.frame.size;
            let fixedWidth = textViewSize.width;
            let fixedHeight = textViewSize.height;
            let expectSize = textViewTemp.sizeThatFits(CGSize.init(width: fixedWidth, height: fixedHeight));
            var expectFont = textViewTemp.font;
            if (expectSize.width > textViewSize.width - 5) {
                while (textViewTemp.sizeThatFits(CGSize.init(width: fixedWidth, height: fixedHeight)).width > textViewSize.width - 5) {
                    expectFont = UIFont.systemFont(ofSize: min((expectFont?.pointSize)!-1,maxTextSize), weight: UIFont.Weight.thin)
                    textViewTemp.font = expectFont
                }
            }
            else {
                var titleFont = textViewTemp.font?.pointSize
                while (textViewTemp.sizeThatFits(CGSize.init(width: fixedWidth, height: fixedHeight)).width < textViewSize.width - 5) {
                    expectFont = UIFont.systemFont(ofSize: min((expectFont?.pointSize)!+1,maxTextSize), weight: UIFont.Weight.thin)
                    textViewTemp.font = expectFont
                    if textViewTemp.font?.pointSize == titleFont {
                        break
                    }
                    else {
                        titleFont = textViewTemp.font?.pointSize
                    }
                }
                expectFont = UIFont.systemFont(ofSize: min((expectFont?.pointSize)!,maxTextSize), weight: UIFont.Weight.thin)
                textViewTemp.font = expectFont
            }
        return (expectFont!.pointSize)
        }

    
    class func updateTextViewFont(_ textView: UITextView, maxTextSize: CGFloat) {
        if (textView.text.isEmpty || textView.bounds.size.equalTo(CGSize.zero)) {
            return;
        }
        let textViewSize = textView.frame.size;
        let fixedWidth = textViewSize.width;
        let fixedHeight = textViewSize.height;
        var expectFont = app.visuals.fontStandard
        textView.font = UIFont.systemFont(ofSize: maxTextSize + 1, weight: UIFont.Weight.thin)
        let expectSize = textView.sizeThatFits(CGSize.init(width: fixedWidth, height: fixedHeight));
        if (expectSize.height > textViewSize.height) {
            while (textView.sizeThatFits(CGSize.init(width: fixedWidth, height: fixedHeight)).height > textViewSize.height) {
                expectFont = UIFont.systemFont(ofSize: textView.font!.pointSize - 1, weight: UIFont.Weight.thin)
                textView.font = UIFont.systemFont(ofSize: min(maxTextSize,expectFont.pointSize), weight: UIFont.Weight.thin)
            }
        }
        else {
            while (textView.sizeThatFits(CGSize.init(width: fixedWidth, height: fixedHeight)).height < textViewSize.height) {
                expectFont = textView.font!;
                textView.font = UIFont.systemFont(ofSize: textView.font!.pointSize + 1, weight: UIFont.Weight.thin)
            }
            textView.font = UIFont.systemFont(ofSize: min(maxTextSize,expectFont.pointSize), weight: UIFont.Weight.thin)
        }
    }
}
