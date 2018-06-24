//
//  PublicClasses.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 5/29/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import Foundation
import CoreData
import UIKit
import JVFloatLabeledText

var app = AppData()

class PublicClasses {
    ////    weak var delegate:MainDelegate?
    //
    class func switchUnitsTo(_ unit: UnitOfWeight.unitType, weightEntryTextField: JVFloatLabeledTextField, FiftyFiveLbsButton: UIButton, FortyFiveLbsButton: UIButton, ThirtyFiveLbsButton: UIButton, TwentyFiveLbsButton: UIButton, FifteenLbsButton: UIButton, TenLbsButton: UIButton, FiveLbsButton: UIButton, TwoPointFiveLbsButton: UIButton, OnePointTwoFiveLbsButton: UIButton, UnitsButton: UIButton?, platesLabel: UITextView, platesView: UIView?, GoButton: UIButton?, overwriteValues: Bool? = true) {
        app.switchUnits()
        app.status.convertedUnitsOn = false
        app.status.percentageModeActive = false
        //        PublicClasses.setToWeightTextField(weightEntryTextField, platesView: platesView!)
        if app.calc.currentPlatesInUse.countPlates() > 0 || (weightEntryTextField.text?.characters.count)! > 0 {
            app.updateWeightToLift()
            weightEntryTextField.text = app.calc.weightToLiftString
        }
        //        weightEntryTextField.backgroundColor = UIColor.clear
        var offsetForUnits = 0
        if app.profile.chosenUnit.unit == UnitOfWeight.unitType.lb {
            offsetForUnits = 9
        }
        UnitsButton!.setTitle(PublicClasses.massFormatter.unitString(fromValue: 0, unit: app.profile.chosenUnit.formatter), for: .normal)
        FiftyFiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: app.profile.currentPlateSet.list[0+offsetForUnits].weight as NSNumber), for: .normal)
        FortyFiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: app.profile.currentPlateSet.list[1+offsetForUnits].weight as NSNumber), for: .normal)
        ThirtyFiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: app.profile.currentPlateSet.list[2+offsetForUnits].weight as NSNumber), for: .normal)
        TwentyFiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: app.profile.currentPlateSet.list[3+offsetForUnits].weight as NSNumber), for: .normal)
        FifteenLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: app.profile.currentPlateSet.list[4+offsetForUnits].weight as NSNumber), for: .normal)
        TenLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: app.profile.currentPlateSet.list[5+offsetForUnits].weight as NSNumber), for: .normal)
        FiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: app.profile.currentPlateSet.list[6+offsetForUnits].weight as NSNumber), for: .normal)
        TwoPointFiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: app.profile.currentPlateSet.list[7+offsetForUnits].weight as NSNumber), for: .normal)
        OnePointTwoFiveLbsButton.setTitle(PublicClasses.numberFormatterDecimal.string(from: app.profile.currentPlateSet.list[8+offsetForUnits].weight as NSNumber), for: .normal)
        
        GoButton?.setTitle(NSLocalizedString("Calculate", comment: ""), for: .normal)
        
        PublicClasses.setPlatesButtonsEnabledStatus(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView!)
    }
    
    
    
    class func enableCertainPlateButtons(_ switchVal: Int, TF: Bool, FiftyFiveLbsButton: UIButton?, FortyFiveLbsButton: UIButton?, ThirtyFiveLbsButton: UIButton?, TwentyFiveLbsButton: UIButton?, FifteenLbsButton: UIButton?, TenLbsButton: UIButton?, FiveLbsButton: UIButton?, TwoPointFiveLbsButton: UIButton?, OnePointTwoFiveLbsButton: UIButton?) {
        switch switchVal {
        case 0:
            FiftyFiveLbsButton!.isEnabled = TF
        case 1:
            FortyFiveLbsButton!.isEnabled = TF
        case 2:
            ThirtyFiveLbsButton!.isEnabled = TF
        case 3:
            TwentyFiveLbsButton!.isEnabled = TF
        case 4:
            FifteenLbsButton!.isEnabled = TF
        case 5:
            TenLbsButton!.isEnabled = TF
        case 6:
            FiveLbsButton!.isEnabled = TF
        case 7:
            TwoPointFiveLbsButton!.isEnabled = TF
        case 8:
            OnePointTwoFiveLbsButton!.isEnabled = TF
        default: break
        }
    }
    
    
    class func updatePage(_ weightEntryTextField: JVFloatLabeledTextField, platesView: UIView, platesLabel: UITextView) {
        //        UIView.animate(withDuration: GlobalVariables.sharedInstance.platesFadeDuration, delay: 0.0,
        //                       options: [],
        //                       animations: {
        weightEntryTextField.alpha = 1
        //        }, completion: nil)
        app.updateWeightToLift()
        weightEntryTextField.text! = app.calc.weightToLiftString
        if app.status.alwaysSort == true {
            PublicClasses.drawPlates(platesView)
        }
        //    }
        //
        //        class func platesInUseFinder(_ labelOutputTextOutput: [String: Int]) {
        //            if GlobalVariables.sharedInstance.keyPadUsedNow == true && GlobalVariables.sharedInstance.errorState == false {
        //                if labelOutputTextOutput.count > 0 {
        //                    let keys = Array(labelOutputTextOutput.keys).sorted()
        //                    for i in 0...keys.count-1 {
        //                        for _ in 1...labelOutputTextOutput[keys[i]]! {
        //                            app.profile.currentPlateSet.listInUse += [keys[i]]
        //                        }
        //                    }
        //                }
        //            }
    }
    
    
    
    class func setPlatesButtonsEnabledStatus(_ platesLabel: UITextView, FiftyFiveLbsButton: UIButton, FortyFiveLbsButton: UIButton, ThirtyFiveLbsButton: UIButton, TwentyFiveLbsButton: UIButton, FifteenLbsButton: UIButton, TenLbsButton: UIButton, FiveLbsButton: UIButton, TwoPointFiveLbsButton: UIButton, OnePointTwoFiveLbsButton: UIButton, weightEntryTextField: JVFloatLabeledTextField, platesView: UIView) {
        //        var counts:[String:Int] = [:]
        //        for item in app.profile.currentPlateSet.listInUse {
        //            if item.contains(GlobalVariables.sharedInstance.units) {
        //                counts[item] = (counts[item] ?? 0) + 1
        //            }
        //        }
        //        let currentPlatesInUseTuples = Array(counts).sorted(by: >)
        //        var currentPlatesUnitsOnly = Array(app.profile.currentPlateSet.list[0...8])
        //        var currentInventorySetUnitsOnly = Array(GlobalVariables.sharedInstance.currentInventorySet[0...8])
        //        if GlobalVariables.sharedInstance.units == "lbs" {
        //            currentPlatesUnitsOnly = Array(app.profile.currentPlateSet.list[9...17])
        //            currentInventorySetUnitsOnly = Array(GlobalVariables.sharedInstance.currentInventorySet[9...17])
        //        }
        //        print(currentInventorySetUnitsOnly)
        //        for i in 0...8 {
        //            PublicClasses.enableCertainPlateButtons(i, TF: true, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton)
        //            print(currentPlatesUnitsOnly[i])
        //            if currentInventorySetUnitsOnly[i] == 0 {
        //                PublicClasses.enableCertainPlateButtons(i, TF: false, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton)
        //            }
        //        }
        //        for (key,value) in currentPlatesInUseTuples {
        //            let valueNew = Double(key.components(separatedBy: " ")[0])!
        //            let differenceValue = currentInventorySetUnitsOnly[currentPlatesUnitsOnly.index(of: valueNew)!]/2 - value
        //            if differenceValue <= 0 {
        //                PublicClasses.enableCertainPlateButtons(currentPlatesUnitsOnly.index(of: valueNew)!, TF: false, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton)
        //            }
        //        }
    }
    
    
    
    class func drawPlates(_ platesView: UIView) {
        if app.status.alwaysSort == true {
            app.calc.currentPlatesInUse.sortPlates()
        }
        for view in platesView.subviews {
            if view.isKind(of: UIImageView.self) {
                view.removeFromSuperview()
            }
        }
        let platesInUse = app.calc.currentPlatesInUse
        if platesInUse.countPlates() > 0 {
            print()
            let platesInUseDetails = app.calc.currentPlatesInUse.list.map ({$0.getDimensions()})
            var xPos = platesView.bounds.maxX
            let totalPlateWidth: CGFloat = CGFloat(platesInUseDetails.map({Double($0.width)}).reduce(0, +)) + 30
            for i in 0...platesInUseDetails.count-1 {
                let heightNotNormalized: CGFloat = CGFloat(platesInUseDetails[i].height)
                let widthNotNormalized: CGFloat = CGFloat(platesInUseDetails[i].width)
                var heightNormalized: CGFloat = CGFloat()
                var widthNormalized: CGFloat = CGFloat()
                if (platesView.bounds.width / totalPlateWidth * CGFloat(platesInUseDetails.map({Double($0.height)}).max()!) ) > platesView.bounds.height {
                    let scale = platesView.bounds.height / CGFloat(platesInUseDetails.map({Double($0.height)}).max()!)
                    heightNormalized = scale * heightNotNormalized
                    widthNormalized = scale * widthNotNormalized
                }
                else {
                    heightNormalized = platesView.bounds.width / totalPlateWidth * heightNotNormalized
                    widthNormalized = platesView.bounds.width / totalPlateWidth * widthNotNormalized
                }
                let imageSize: CGSize = CGSize(width: widthNormalized, height: heightNormalized)
                xPos = xPos - widthNormalized
                let plateImageView: UIImageView = UIImageView(frame: CGRect(origin: CGPoint(x: xPos, y: platesView.bounds.midY-heightNormalized/2), size: imageSize))
                plateImageView.tag = 752837 //CHECK
                plateImageView.layer.cornerRadius = 5/292*plateImageView.frame.height
                plateImageView.backgroundColor = platesInUseDetails[i].color
                plateImageView.layer.borderWidth = 0.5
                plateImageView.layer.borderColor = app.visuals.borderColor.cgColor
                platesView.addSubview(plateImageView)
            }
        }
        if UIView.userInterfaceLayoutDirection(for: platesView.semanticContentAttribute) == UIUserInterfaceLayoutDirection.rightToLeft {
            platesView.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
    }
    
    
    
    
        class func resetEverything(_ platesLabel: UITextView, FiftyFiveLbsButton: UIButton, FortyFiveLbsButton: UIButton, ThirtyFiveLbsButton: UIButton, TwentyFiveLbsButton: UIButton, FifteenLbsButton: UIButton, TenLbsButton: UIButton, FiveLbsButton: UIButton, TwoPointFiveLbsButton: UIButton, OnePointTwoFiveLbsButton: UIButton, weightEntryTextField: JVFloatLabeledTextField, platesView: UIView, GoButton: UIButton, animate: Bool = false) {
            weightEntryTextField.resignFirstResponder()
            GoButton.isEnabled = false
            app.status.errorState=false
            app.status.keyPadUsedNow = false
            app.status.percentageModeActive = false
            app.calc.currentPlatesInUse.list = []
            app.updateWeightToLift()
            PublicClasses.setPlatesButtonsEnabledStatus(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView)
            
            PublicClasses.massFormatter.string(fromValue: app.calc.weightToLift, unit: app.profile.chosenUnit.formatter)
            //                weightEntryTextField.errorMessage = ""
            //        weightEntryTextField.setTitleVisible(false, animated: true, animationCompletion: { (finished: Bool) -> Void in
            //                        PublicClasses.setToWeightTextField(weightEntryTextField, platesView: platesView)
            //        //        })
            UIView.transition(with: GoButton, duration: app.visuals.platesFadeDuration/2, options: [.transitionCrossDissolve], animations: {
                platesLabel.alpha = 0
                if weightEntryTextField.text != "" {
                    weightEntryTextField.alpha = 0
                }
                platesView.alpha = 0
            }, completion: { (finished: Bool) -> () in
                platesLabel.text = ""
                weightEntryTextField.placeholder = NSLocalizedString("Enter a weight", comment: "")
                weightEntryTextField.text = ""
                weightEntryTextField.floatingLabel.text = NSLocalizedString("Total weight", comment: "")
                PublicClasses.drawPlates(platesView)
                UIView.transition(with: GoButton, duration: app.visuals.platesFadeDuration/2, options: [.transitionCrossDissolve], animations: {
                    platesLabel.alpha = 1
                    weightEntryTextField.alpha = 1
                    platesView.alpha = 1
                }, completion: { (finished: Bool) -> () in
                })
            })
            
        }
}
