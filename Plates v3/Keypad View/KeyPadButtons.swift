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
    @IBAction func RemoveButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        PublicClasses.removeButtonAction(weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton)    }
    
    @IBAction func PercentButtonAction(_ sender: AnyObject) {
        PublicClasses.percentButtonAction(weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton)
    }
    
    
    @IBAction func GoButtonAction(_ sender: AnyObject) {
        PublicClasses.goButtonAction(weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton)
    }
    
    @IBAction func ClearButtonAction(_ sender: AnyObject) {
        PublicClasses.resetEverything(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, animate: true)
        DataAccess.sharedInstance.saveEverything()
    }
    
    @IBAction func UnitsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        PublicClasses.unitsButtonAction(weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton)
        DataAccess.sharedInstance.saveEverything()
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
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
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
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //                let vc = storyboard.instantiateViewController(withIdentifier: "BarbellPopover") as! BarbellQuickSelectTableView
        //        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        //        vc.delegate = self
        //        vc.popoverPresentationController?.sourceView = barbellButtonAnchor
        //        vc.popoverPresentationController!.delegate = self
        //        vc.popoverPresentationController?.backgroundColor = GlobalVariables.sharedInstance.secondaryColor
        //        vc.popoverPresentationController!.permittedArrowDirections = UIPopoverArrowDirection.down
        //        self.present(vc, animated: true, completion:nil)
    }
    
    
    @IBAction func FiftyFiveLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        PublicClasses.plateButtonPressed(buttonSpot: 0, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton)
    }
    
    
    @IBAction func FortyFiveLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        PublicClasses.plateButtonPressed(buttonSpot: 1, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton)
    }
    @IBAction func ThirtyFiveLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        PublicClasses.plateButtonPressed(buttonSpot: 2, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton)
        
    }
    @IBAction func TwentyFiveLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        PublicClasses.plateButtonPressed(buttonSpot: 3, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton)
        
    }
    @IBAction func FifteenLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        PublicClasses.plateButtonPressed(buttonSpot: 4, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton)
        
    }
    @IBAction func TenLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        PublicClasses.plateButtonPressed(buttonSpot: 5, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton)
        
    }
    @IBAction func FiveLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        PublicClasses.plateButtonPressed(buttonSpot: 6, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton)
        
    }
    
    @IBAction func TwoPointFiveLbsButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        PublicClasses.plateButtonPressed(buttonSpot: 7, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton)
        
    }
    
    @IBAction func OnePointTwoFiveLbsButton(_ sender: AnyObject) {
        self.view.endEditing(true)
        PublicClasses.plateButtonPressed(buttonSpot: 8, platesLabel: platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton)
    }
    
    
}

