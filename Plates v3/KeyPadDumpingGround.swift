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
    func btn_clicked(_ sender: UIBarButtonItem) {
    }
    func rightBarButtonPressed() {
    }
    
    @IBAction func ClearButtonAction(_ sender: AnyObject) {
        //        PublicClasses.resetEverything(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil, animate: true)
        //        DataAccess.sharedInstance.saveEverything()
    }
    
    @IBAction func UnitsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        //        PublicClasses.unitsButtonAction(weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton, titleLabel: nil)
        //        DataAccess.sharedInstance.saveEverything()
    }
    
    @IBAction func settingsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //        let vc = storyboard.instantiateViewController(withIdentifier: "settingsPopoverView") as! SettingsQuickSelectTableView
        //        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        //        vc.delegate = self
        //        vc.popoverPresentationController?.barButtonItem = self.barbuttonitem
        //        vc.popoverPresentationController!.delegate = self
        //        vc.popoverPresentationController?.backgroundColor = GlobalVariables.sharedInstance.secondaryColor
        //        vc.popoverPresentationController!.permittedArrowDirections = UIPopoverArrowDirection.up
        //        vc.preferredContentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height*0.7)
        //        self.present(vc, animated: true, completion:nil)
    }
    
    @IBAction func InventoryButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //        let vc = storyboard.instantiateViewController(withIdentifier: "InventoryPopover") as! InventoryQuickSelectTableView
        //        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        //        vc.delegate = self
        //        vc.popoverPresentationController?.sourceView = gymButtonAnchor
        //        vc.popoverPresentationController!.delegate = self
        //        vc.popoverPresentationController?.backgroundColor = GlobalVariables.sharedInstance.secondaryColor
        //        vc.popoverPresentationController!.permittedArrowDirections = UIPopoverArrowDirection.down
        //        self.present(vc, animated: true, completion:nil)
    }
    
    @IBAction func CollarsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        //        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //        let vc = storyboard.instantiateViewController(withIdentifier: "CollarsPopover") as! CollarQuickSelectTableView
        //        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        //        vc.delegate = self
        //        vc.popoverPresentationController?.sourceView = collarButtonAnchor
        //        vc.popoverPresentationController!.delegate = self
        //        vc.popoverPresentationController?.backgroundColor = GlobalVariables.sharedInstance.secondaryColor
        //        vc.popoverPresentationController!.permittedArrowDirections = UIPopoverArrowDirection.down
        //        self.present(vc, animated: true, completion:nil)
    }
    
    @IBAction func BarbellButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        //        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //        let vc = storyboard.instantiateViewController(withIdentifier: "BarbellPopover") as! BarbellQuickSelectTableView
        //        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        //        vc.delegate = self
        //        vc.popoverPresentationController?.sourceView = barbellButtonAnchor
        //        vc.popoverPresentationController!.delegate = self
        //        vc.popoverPresentationController?.backgroundColor = GlobalVariables.sharedInstance.secondaryColor
        //        vc.popoverPresentationController!.permittedArrowDirections = UIPopoverArrowDirection.down
        //        self.present(vc, animated: true, completion:nil)
    }
    
    
    func presentInventoryAdvancedSettingsPopover() {
        self.view.endEditing(true)
        //        let popoverContent = (self.storyboard?.instantiateViewController(withIdentifier: "InventoryAdvancedSettings"))! as! InventoryAdvancedSettings
        //        popoverContent.delegate = self
        //        let nav = UINavigationController(rootViewController: popoverContent)
        //        nav.modalPresentationStyle = UIModalPresentationStyle.popover
        //        let popover = nav.popoverPresentationController
        //        popoverContent.preferredContentSize = CGSize(width: self.view.bounds.width*0.8,height: self.view.bounds.height*0.85)
        //        popover!.delegate = self
        //        popover?.backgroundColor = UIColor.white
        //        popover!.sourceView = self.view
        //        popover?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        //        popover!.sourceRect = CGRectMake(self.view.bounds.midX, self.view.bounds.midY,0,0)
        //        self.present(nav, animated: true, completion: nil)
    }
    
    func presentBarbellAdvancedSettingsPopover() {
        self.view.endEditing(true)
        //        let popoverContent = (self.storyboard?.instantiateViewController(withIdentifier: "BarbellAdvancedSettings"))! as! BarbellAdvancedSettings
        //        popoverContent.delegate = self
        //        let nav = UINavigationController(rootViewController: popoverContent)
        //        nav.modalPresentationStyle = UIModalPresentationStyle.popover
        //        let popover = nav.popoverPresentationController
        //        popoverContent.preferredContentSize = CGSize(width: self.view.bounds.width*0.8,height: self.view.bounds.height*0.85)
        //        popover!.delegate = self
        //        popover!.sourceView = self.view
        //        popover?.backgroundColor = UIColor.white
        //        popover?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        //        popover!.sourceRect = CGRectMake(self.view.bounds.midX, self.view.bounds.midY,0,0)
        //        self.present(nav, animated: true, completion: nil)
    }
    
    func presentCollarAdvancedSettingsPopover() {
        self.view.endEditing(true)
        //        let popoverContent = (self.storyboard?.instantiateViewController(withIdentifier: "CollarAdvancedSettings"))! as! CollarAdvancedSettings
        //        popoverContent.delegate = self
        //        let nav = UINavigationController(rootViewController: popoverContent)
        //        nav.modalPresentationStyle = UIModalPresentationStyle.popover
        //        let popover = nav.popoverPresentationController
        //        popoverContent.preferredContentSize = CGSize(width: self.view.bounds.width*0.8,height: self.view.bounds.height*0.85)
        //        popover!.delegate = self
        //        popover!.sourceView = self.view
        //        popover?.backgroundColor = UIColor.white
        //        popover?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        //        popover!.sourceRect = CGRectMake(self.view.bounds.midX, self.view.bounds.midY,0,0)
        //        self.present(nav, animated: true, completion: nil)
    }
    
    
    @IBAction func FiftyFiveLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        var button = 0
        //        if GlobalVariables.sharedInstance.units == "lbs" {
        //            button += 9
        //        }
        //        PublicClasses.plateButtonPressed(button, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil)
    }
    @IBAction func FortyFiveLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        var button = 1
        //        if GlobalVariables.sharedInstance.units == "lbs" {
        //            button += 9
        //        }
        //        PublicClasses.plateButtonPressed(button, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil)
    }
    @IBAction func ThirtyFiveLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        var button = 2
        //        if GlobalVariables.sharedInstance.units == "lbs" {
        //            button += 9
        //        }
        //        PublicClasses.plateButtonPressed(button, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil)
        
    }
    @IBAction func TwentyFiveLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        var button = 3
        //        if GlobalVariables.sharedInstance.units == "lbs" {
        //            button += 9
        //        }
        //        PublicClasses.plateButtonPressed(button, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil)
        
    }
    @IBAction func FifteenLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        var button = 4
        //        if GlobalVariables.sharedInstance.units == "lbs" {
        //            button += 9
        //        }
        //        PublicClasses.plateButtonPressed(button, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil)
        
    }
    @IBAction func TenLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        var button = 5
        //        if GlobalVariables.sharedInstance.units == "lbs" {
        //            button += 9
        //        }
        //        PublicClasses.plateButtonPressed(button, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil)
        
    }
    @IBAction func FiveLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        var button = 6
        //        if GlobalVariables.sharedInstance.units == "lbs" {
        //            button += 9
        //        }
        //        PublicClasses.plateButtonPressed(button, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil)
        
    }
    
    @IBAction func TwoPointFiveLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        var button = 7
        //        if GlobalVariables.sharedInstance.units == "lbs" {
        //            button += 9
        //        }
        //        PublicClasses.plateButtonPressed(button, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil)
        
    }
    
    @IBAction func OnePointTwoFiveLbsButton(_ sender: AnyObject) {
        self.view.endEditing(true)
        var button = 8
        //        if GlobalVariables.sharedInstance.units == "lbs" {
        //            button += 9
        //        }
        //        PublicClasses.plateButtonPressed(button, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc(adaptivePresentationStyleForPresentationController:) func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    
    func setupToScreenShot() {
        UIApplication.shared.isStatusBarHidden = true
    }
    
    func setupToScreenShotLaunchScreen() {
        platesLabel.textColor = UIColor.clear
        FiftyFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        FortyFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        ThirtyFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        TwentyFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        FifteenLbsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        TenLbsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        RemoveButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        FiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        TwoPointFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        OnePointTwoFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        PercentButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        ClearButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        BarbellButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        CollarsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        InventoryButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        UnitsButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        GoButton.setTitleColor(UIColor.clear, for: UIControlState.normal)
        FiftyFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        FortyFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        ThirtyFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        TwentyFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        FifteenLbsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        TenLbsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        RemoveButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        FiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        TwoPointFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        OnePointTwoFiveLbsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        PercentButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        ClearButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        BarbellButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        CollarsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        InventoryButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        UnitsButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        GoButton.setTitleColor(UIColor.clear, for: UIControlState.disabled)
        goButtonWidthConstraint.constant = GoButton.frame.height
        self.navigationItem.titleView = UILabel()
        //        weightEntryTextField.textColor = UIColor.clear
        //        weightEntryTextField.titleColor = UIColor.clear
        //        weightEntryTextField.placeholderColor = UIColor.clear
        platesView.backgroundColor = UIColor.clear
        //        titleLabel.textColor = UIUIColor.clear
        //        weightEntryTextField.UIColor = UIColor.clear
        barbuttonitem.tintColor = UIColor.clear
        //        weightEntryTextField.placeholder = ""
        barbuttonitem.title = ""
        UIApplication.shared.isStatusBarHidden = true
    }
    
    override func viewDidLayoutSubviews() {
    }
    
}

