//
//  KeyPadDumpingGround.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 4/30/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import Armchair
import SwiftyStoreKit

extension KeyPadViewController {
    func btn_clicked(_ sender: UIBarButtonItem) {
    }
    func rightBarButtonPressed() {
    }


    @IBAction func UnitsButtonAction(_ sender: AnyObject) {
        Armchair.userDidSignificantEvent(true)
        self.view.endEditing(true)
        PublicClasses.unitsButtonAction(weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton, titleLabel: nil)
        DataAccess.sharedInstance.saveEverything()
    }

    @IBAction func settingsButtonAction(_ sender: AnyObject) {
        Armchair.userDidSignificantEvent(true)
        self.view.endEditing(true)
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "settingsPopoverView") as! SettingsQuickSelectTableView
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.delegate = self
        vc.popoverPresentationController?.barButtonItem = self.barbuttonitem
        vc.popoverPresentationController!.delegate = self
        vc.popoverPresentationController?.backgroundColor = GlobalVariables.sharedInstance.secondaryColor
        vc.popoverPresentationController!.permittedArrowDirections = UIPopoverArrowDirection.up
        vc.preferredContentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height*0.7)
        self.present(vc, animated: true, completion:nil)
    }

    @IBAction func InventoryButtonAction(_ sender: AnyObject) {
        Armchair.userDidSignificantEvent(true)
        self.view.endEditing(true)
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "InventoryPopover") as! InventoryQuickSelectTableView
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.delegate = self
        vc.popoverPresentationController?.sourceView = gymButtonAnchor
        vc.popoverPresentationController!.delegate = self
        vc.popoverPresentationController?.backgroundColor = GlobalVariables.sharedInstance.secondaryColor
        vc.popoverPresentationController!.permittedArrowDirections = UIPopoverArrowDirection.down
        self.present(vc, animated: true, completion:nil)
    }

    @IBAction func CollarsButtonAction(_ sender: AnyObject) {
        Armchair.userDidSignificantEvent(true)
        self.view.endEditing(true)
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CollarsPopover") as! CollarQuickSelectTableView
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.delegate = self
        vc.popoverPresentationController?.sourceView = collarButtonAnchor
        vc.popoverPresentationController!.delegate = self
        vc.popoverPresentationController?.backgroundColor = GlobalVariables.sharedInstance.secondaryColor
        vc.popoverPresentationController!.permittedArrowDirections = UIPopoverArrowDirection.down
        self.present(vc, animated: true, completion:nil)
    }

    @IBAction func BarbellButtonAction(_ sender: AnyObject) {
        Armchair.userDidSignificantEvent(true)
        self.view.endEditing(true)
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BarbellPopover") as! BarbellQuickSelectTableView
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.delegate = self
        vc.popoverPresentationController?.sourceView = barbellButtonAnchor
        vc.popoverPresentationController!.delegate = self
        vc.popoverPresentationController?.backgroundColor = GlobalVariables.sharedInstance.secondaryColor
        vc.popoverPresentationController!.permittedArrowDirections = UIPopoverArrowDirection.down
        self.present(vc, animated: true, completion:nil)
    }


    func presentInventoryAdvancedSettingsPopover() {
        Armchair.userDidSignificantEvent(true)
        self.view.endEditing(true)
        let popoverContent = (self.storyboard?.instantiateViewController(withIdentifier: "InventoryAdvancedSettings"))! as! InventoryAdvancedSettings
        popoverContent.delegate = self
        let nav = UINavigationController(rootViewController: popoverContent)
        nav.modalPresentationStyle = UIModalPresentationStyle.popover
        let popover = nav.popoverPresentationController
        popoverContent.preferredContentSize = CGSize(width: self.view.bounds.width*0.8,height: self.view.bounds.height*0.85)
        popover!.delegate = self
        popover?.backgroundColor = UIColor.white
        popover!.sourceView = self.view
        popover?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        popover!.sourceRect = CGRectMake(self.view.bounds.midX, self.view.bounds.midY,0,0)
        self.present(nav, animated: true, completion: nil)
    }
    func presentBarbellAdvancedSettingsPopover() {
        Armchair.userDidSignificantEvent(true)
        self.view.endEditing(true)
        let popoverContent = (self.storyboard?.instantiateViewController(withIdentifier: "BarbellAdvancedSettings"))! as! BarbellAdvancedSettings
        popoverContent.delegate = self
        let nav = UINavigationController(rootViewController: popoverContent)
        nav.modalPresentationStyle = UIModalPresentationStyle.popover
        let popover = nav.popoverPresentationController
        popoverContent.preferredContentSize = CGSize(width: self.view.bounds.width*0.8,height: self.view.bounds.height*0.85)
        popover!.delegate = self
        popover!.sourceView = self.view
        popover?.backgroundColor = UIColor.white
        popover?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        popover!.sourceRect = CGRectMake(self.view.bounds.midX, self.view.bounds.midY,0,0)
        self.present(nav, animated: true, completion: nil)
    }
    func presentCollarAdvancedSettingsPopover() {
        Armchair.userDidSignificantEvent(true)
        self.view.endEditing(true)
        let popoverContent = (self.storyboard?.instantiateViewController(withIdentifier: "CollarAdvancedSettings"))! as! CollarAdvancedSettings
        popoverContent.delegate = self
        let nav = UINavigationController(rootViewController: popoverContent)
        nav.modalPresentationStyle = UIModalPresentationStyle.popover
        let popover = nav.popoverPresentationController
        popoverContent.preferredContentSize = CGSize(width: self.view.bounds.width*0.8,height: self.view.bounds.height*0.85)
        popover!.delegate = self
        popover!.sourceView = self.view
        popover?.backgroundColor = UIColor.white
        popover?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        popover!.sourceRect = CGRectMake(self.view.bounds.midX, self.view.bounds.midY,0,0)
        self.present(nav, animated: true, completion: nil)
    }


    @IBAction func FiftyFiveLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        var button = 0
        if GlobalVariables.sharedInstance.units == "lbs" {
            button += 9
        }
        PublicClasses.plateButtonPressed(button, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil)
    }
    @IBAction func FortyFiveLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        var button = 1
        if GlobalVariables.sharedInstance.units == "lbs" {
            button += 9
        }
        PublicClasses.plateButtonPressed(button, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil)
    }
    @IBAction func ThirtyFiveLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        var button = 2
        if GlobalVariables.sharedInstance.units == "lbs" {
            button += 9
        }
        PublicClasses.plateButtonPressed(button, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil)

    }
    @IBAction func TwentyFiveLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        var button = 3
        if GlobalVariables.sharedInstance.units == "lbs" {
            button += 9
        }
        PublicClasses.plateButtonPressed(button, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil)

    }
    @IBAction func FifteenLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        var button = 4
        if GlobalVariables.sharedInstance.units == "lbs" {
            button += 9
        }
        PublicClasses.plateButtonPressed(button, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil)

    }
    @IBAction func TenLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        var button = 5
        if GlobalVariables.sharedInstance.units == "lbs" {
            button += 9
        }
        PublicClasses.plateButtonPressed(button, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil)

    }
    @IBAction func FiveLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        var button = 6
        if GlobalVariables.sharedInstance.units == "lbs" {
            button += 9
        }
        PublicClasses.plateButtonPressed(button, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil)

    }
    @IBAction func TwoPointFiveLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        var button = 7
        if GlobalVariables.sharedInstance.units == "lbs" {
            button += 9
        }
        PublicClasses.plateButtonPressed(button, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil)

    }
    @IBAction func OnePointTwoFiveLbsButton(_ sender: AnyObject) {
        self.view.endEditing(true)
        var button = 8
        if GlobalVariables.sharedInstance.units == "lbs" {
            button += 9
        }
        PublicClasses.plateButtonPressed(button, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil)
    }




    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc(adaptivePresentationStyleForPresentationController:) func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }


    func findErrors (_ weightToConvert: Double, weightLabels: [Double: Int]) {
        //                var weightTemp = GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight
        //                for (key,value) in weightLabels {
        //                    if value != 0 {
        //                        weightTemp += key*Double(value*2)
        //                    }
        //                }
        //
        //                if weightToConvert > weightTemp {
        //                    GlobalVariables.sharedInstance.weightToLift = weightTemp
        //                    self.weightEntryTextField.errorMessage = "ROUNDED DOWN: \((PublicClasses.numberFormatterDecimal.stringFromNumber(round((weightToConvert-GlobalVariables.sharedInstance.weightToLift)*10000)/10000))!)\(NSLocalizedString(GlobalVariables.sharedInstance.units, comment: ""))"
        //                    self.weightEntryTextField.text = String(PublicClasses.numberFormatterDecimal.stringFromNumber(NSNumber(GlobalVariables.sharedInstance.weightToLift))!)
        //                    setToWeightTextField()
        //                }
        //                if weightToConvert == GlobalVariables.sharedInstance.currentBarWeight  + GlobalVariables.sharedInstance.currentCollarWeight {
        //                    self.weightEntryTextField.errorMessage = "EMPTY BAR"
        //                    setToWeightTextField()
        //                    GlobalVariables.sharedInstance.errorState=true
        //                }
        //                else if weightToConvert < Double(GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight) {
        //                    self.weightEntryTextField.errorMessage = "ADD MORE WEIGHT"
        //                    setToWeightTextField()
        //                    GlobalVariables.sharedInstance.errorState=true
        //                }
    }

    func presentRemoveAdsSettingsPopover() {
        Armchair.userDidSignificantEvent(true)

    }

    func setupToScreenShot() {
        UIApplication.shared.isStatusBarHidden = true
    }

    func setupToScreenShotLaunchScreen() {
        platesLabel.textColor = Color.clear
        FiftyFiveLbsButton.setTitleColor(Color.clear, for: UIControlState.normal)
        FortyFiveLbsButton.setTitleColor(Color.clear, for: UIControlState.normal)
        ThirtyFiveLbsButton.setTitleColor(Color.clear, for: UIControlState.normal)
        TwentyFiveLbsButton.setTitleColor(Color.clear, for: UIControlState.normal)
        FifteenLbsButton.setTitleColor(Color.clear, for: UIControlState.normal)
        TenLbsButton.setTitleColor(Color.clear, for: UIControlState.normal)
        RemoveButton.setTitleColor(Color.clear, for: UIControlState.normal)
        FiveLbsButton.setTitleColor(Color.clear, for: UIControlState.normal)
        TwoPointFiveLbsButton.setTitleColor(Color.clear, for: UIControlState.normal)
        OnePointTwoFiveLbsButton.setTitleColor(Color.clear, for: UIControlState.normal)
        PercentButton.setTitleColor(Color.clear, for: UIControlState.normal)
        ClearButton.setTitleColor(Color.clear, for: UIControlState.normal)
        BarbellButton.setTitleColor(Color.clear, for: UIControlState.normal)
        CollarsButton.setTitleColor(Color.clear, for: UIControlState.normal)
        InventoryButton.setTitleColor(Color.clear, for: UIControlState.normal)
        UnitsButton.setTitleColor(Color.clear, for: UIControlState.normal)
        GoButton.setTitleColor(Color.clear, for: UIControlState.normal)
        FiftyFiveLbsButton.setTitleColor(Color.clear, for: UIControlState.disabled)
        FortyFiveLbsButton.setTitleColor(Color.clear, for: UIControlState.disabled)
        ThirtyFiveLbsButton.setTitleColor(Color.clear, for: UIControlState.disabled)
        TwentyFiveLbsButton.setTitleColor(Color.clear, for: UIControlState.disabled)
        FifteenLbsButton.setTitleColor(Color.clear, for: UIControlState.disabled)
        TenLbsButton.setTitleColor(Color.clear, for: UIControlState.disabled)
        RemoveButton.setTitleColor(Color.clear, for: UIControlState.disabled)
        FiveLbsButton.setTitleColor(Color.clear, for: UIControlState.disabled)
        TwoPointFiveLbsButton.setTitleColor(Color.clear, for: UIControlState.disabled)
        OnePointTwoFiveLbsButton.setTitleColor(Color.clear, for: UIControlState.disabled)
        PercentButton.setTitleColor(Color.clear, for: UIControlState.disabled)
        ClearButton.setTitleColor(Color.clear, for: UIControlState.disabled)
        BarbellButton.setTitleColor(Color.clear, for: UIControlState.disabled)
        CollarsButton.setTitleColor(Color.clear, for: UIControlState.disabled)
        InventoryButton.setTitleColor(Color.clear, for: UIControlState.disabled)
        UnitsButton.setTitleColor(Color.clear, for: UIControlState.disabled)
        GoButton.setTitleColor(Color.clear, for: UIControlState.disabled)
        goButtonWidthConstraint.constant = GoButton.frame.height
        self.navigationItem.titleView = UILabel()
        weightEntryTextField.textColor = UIColor.clear
        weightEntryTextField.titleColor = UIColor.clear
        weightEntryTextField.placeholderColor = UIColor.clear
        platesView.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.clear
        weightEntryTextField.tintColor = UIColor.clear
        barbuttonitem.tintColor = UIColor.clear
        weightEntryTextField.placeholder = ""
        barbuttonitem.title = ""
        UIApplication.shared.isStatusBarHidden = true
    }

    func buyIAP() {
        SwiftyStoreKit.purchaseProduct("removeAds", atomically: true) { result in
            switch result {
            case .success(let product):
                print("Purchase Success: \(product.productId)")
                GlobalVariables.sharedInstance.paidToRemoveAds = true
                DataAccess.sharedInstance.saveEverything()
                self.bannerViewHeight.constant = 0
            case .error(let error):
                switch error.code {
                case .unknown: print("Unknown error. Please contact support")
                case .clientInvalid: print("Not allowed to make the payment")
                case .paymentCancelled: break
                case .paymentInvalid: print("The purchase identifier was invalid")
                case .paymentNotAllowed: print("The device is not allowed to make the payment")
                case .storeProductNotAvailable: print("The product is not available in the current storefront")
                case .cloudServicePermissionDenied: print("Access to cloud service information is not allowed")
                case .cloudServiceNetworkConnectionFailed: print("Could not connect to the network")
                default:
                    print("I have an unexpected case.")
                }
            }
        }
    }

    func restorePurchases() {
//        let alert = UIAlertController(title: NSLocalizedString("Already purchased?", comment: ""), message: NSLocalizedString("Restore purchases", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
//        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: UIAlertActionStyle.cancel, handler: { (a) -> Void in
//            // User tapped 'cancel', so do nothing
//        })
//        let confirmAction = UIAlertAction(title: NSLocalizedString("Confirm", comment: ""), style: UIAlertActionStyle.default, handler: { (a) -> Void in
            SwiftyStoreKit.restorePurchases(atomically: true) { results in
                if results.restoreFailedProducts.count > 0 {
                    self.alert(message: results.restoreFailedProducts[0].0.localizedDescription)
                }
                else if results.restoredProducts.count > 0 {
                    var productName = results.restoredProducts.first?.productId
                    SwiftyStoreKit.retrieveProductsInfo([(results.restoredProducts.first?.productId)!]) { result in
                        if let product = result.retrievedProducts.first {
                            let priceString = product.localizedPrice!
                            productName = product.localizedTitle
                        }
                    }
                    self.alert(message: "Restored: " + productName!)
                    GlobalVariables.sharedInstance.paidToRemoveAds = true
                    DataAccess.sharedInstance.saveEverything()
                    self.bannerViewHeight.constant = 0
                }
                else {
                    self .alert(message: NSLocalizedString("Nothing to restore", comment: ""))
                }
            }
//        })
//        alert.addAction(cancelAction)
//        alert.addAction(confirmAction)
//        self.present(alert, animated: true, completion: { () -> Void in
//        })
    }

    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
