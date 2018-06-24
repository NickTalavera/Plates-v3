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
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {

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
        //                let popoverContent = (self.storyboard?.instantiateViewController(withIdentifier: "CollarAdvancedSettings"))! as! CollarAdvancedSettings
        //                popoverContent.delegate = self
        //                let nav = UINavigationController(rootViewController: popoverContent)
        //                nav.modalPresentationStyle = UIModalPresentationStyle.popover
        //                let popover = nav.popoverPresentationController
        //                popoverContent.preferredContentSize = CGSize(width: self.view.bounds.width*0.8,height: self.view.bounds.height*0.85)
        //                popover!.delegate = self
        //                popover!.sourceView = self.view
        //                popover?.backgroundColor = UIColor.white
        //                popover?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        //                popover!.sourceRect = CGRectMake(self.view.bounds.midX, self.view.bounds.midY,0,0)
        //                self.present(nav, animated: true, completion: nil)
    }
    
    
    
}

