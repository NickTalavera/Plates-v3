//
//  SettingsQuickSelectTableView.swift
//  Bar - Barbell Plate Weight Calc/Users/nicktalavera/Dropbox/Coding Projects/Bar---Barbell-Plate-Weight-Calculator/Bar - Barbell Plate Weight Calculator Watch/Base.lproj/Interface.storyboardulator
//
//  Created by Nick Talavera on 4/28/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import UIKit
import Armchair
import StoreKit
import SwiftyStoreKit

class SettingsQuickSelectTableView: UITableViewController, UIPopoverPresentationControllerDelegate {

    let textCellIdentifier = "TextCell"
    weak var delegate: MainDelegate?
    @IBOutlet weak var upgradeTitleLabel: UILabel!
    @IBOutlet weak var gymLabel: UILabel!
    @IBOutlet weak var doneLabel: UILabel!
    @IBOutlet weak var barbellLabel: UILabel!
    @IBOutlet weak var alwaysSortLabel: UILabel!
    @IBOutlet weak var removeAdsLabel: UILabel!
    @IBOutlet weak var collarLabel: UILabel!
    @IBOutlet weak var inventoriesCell: UITableViewCell!
    @IBOutlet weak var barbellsCell: UITableViewCell!
    @IBOutlet weak var collarsCell: UITableViewCell!
    @IBOutlet weak var removeAdsCell: UITableViewCell!
    @IBOutlet weak var alwaysSortSwitch: UISwitch!
    @IBOutlet weak var alwaysSortCell: UITableViewCell!
    @IBOutlet weak var convertGymUnitsLabel: UILabel!
    @IBOutlet weak var convertGymUnitsSwitch: UISwitch!
    @IBOutlet weak var convertGymUnitsCell: UITableViewCell!
    @IBOutlet weak var settingsTitle: UILabel!
    @IBOutlet weak var restorePurchasesLabel: UILabel!
    @IBOutlet weak var settingsVerticalAdjustConstraint: NSLayoutConstraint!
@IBOutlet weak var restorePurchasesCell: UITableViewCell!
    var changedValue = false
    @IBAction func convertGymUnitsSwitchAction(_ sender: UISwitch) {
        Armchair.userDidSignificantEvent(true)
        GlobalVariables.sharedInstance.convertGymUnits = sender.isOn
        changedValue = true
    }


    @IBAction func alwaysSortSwitchAction(_ sender: UISwitch) {
        Armchair.userDidSignificantEvent(true)
        GlobalVariables.sharedInstance.alwaysSort = sender.isOn
        if sender.isOn == true {
            GlobalVariables.sharedInstance.currentPlatesInUse = PublicClasses.sortCurrentPlatesInUse(GlobalVariables.sharedInstance.currentPlatesInUse)
            delegate?.drawPlatesProtocol()
        }
        changedValue = true
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //Create label and autoresize it
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.sectionHeaderHeight))
        headerLabel.font = GlobalVariables.sharedInstance.fontStandard.withSize( (GlobalVariables.sharedInstance.fontStandard.pointSize) * 0.75)
        headerLabel.text = NSLocalizedString(self.tableView(self.tableView, titleForHeaderInSection: section)!, comment: "")
        headerLabel.sizeToFit()
        headerLabel.adjustsFontSizeToFitWidth = true
        //        headerLabel.backgroundColor =
        //Adding Label to existing headerView
        let headerView = UIView()
        headerView.addSubview(headerLabel)
        return headerView
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    override func viewWillDisappear(_ animated: Bool) {
        if changedValue == true {
            DataAccess.sharedInstance.saveEverything()
            DataAccess.sharedInstance.iCloudSave()
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        if changedValue == true {
            delegate!.presentCustomizedPrompt()
        }
    }



    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.definesPresentationContext = true
        barbellLabel.font = GlobalVariables.sharedInstance.fontStandard
        gymLabel.font = GlobalVariables.sharedInstance.fontStandard
        collarLabel.font = GlobalVariables.sharedInstance.fontStandard
        alwaysSortLabel.font = GlobalVariables.sharedInstance.fontStandard
        convertGymUnitsLabel.font = GlobalVariables.sharedInstance.fontStandard
        removeAdsLabel.font = GlobalVariables.sharedInstance.fontStandard
        restorePurchasesLabel.font = GlobalVariables.sharedInstance.fontStandard
        barbellLabel.adjustsFontSizeToFitWidth = true
        gymLabel.adjustsFontSizeToFitWidth = true
        collarLabel.adjustsFontSizeToFitWidth = true
        alwaysSortLabel.adjustsFontSizeToFitWidth = true
        convertGymUnitsLabel.adjustsFontSizeToFitWidth = true
        removeAdsLabel.adjustsFontSizeToFitWidth = true
        restorePurchasesLabel.adjustsFontSizeToFitWidth = true
        barbellLabel.allowsDefaultTighteningForTruncation = true
        gymLabel.allowsDefaultTighteningForTruncation = true
        collarLabel.allowsDefaultTighteningForTruncation = true
        alwaysSortLabel.allowsDefaultTighteningForTruncation = true
        convertGymUnitsLabel.allowsDefaultTighteningForTruncation = true
        removeAdsLabel.allowsDefaultTighteningForTruncation = true
        restorePurchasesLabel.allowsDefaultTighteningForTruncation = true
        alwaysSortSwitch.tintColor = GlobalVariables.sharedInstance.secondaryColor
        alwaysSortSwitch.onTintColor = GlobalVariables.sharedInstance.secondaryColor
        convertGymUnitsSwitch.tintColor = GlobalVariables.sharedInstance.secondaryColor
        convertGymUnitsSwitch.onTintColor = GlobalVariables.sharedInstance.secondaryColor
        upgradeTitleLabel.font = GlobalVariables.sharedInstance.fontTitle
        upgradeTitleLabel.text = NSLocalizedString("Upgrade", comment: "")
        upgradeTitleLabel.baselineAdjustment = .alignCenters
        settingsTitle.font = GlobalVariables.sharedInstance.fontTitle
        settingsTitle.text = NSLocalizedString("Settings", comment: "")
        settingsTitle.baselineAdjustment = .alignCenters
        settingsVerticalAdjustConstraint.constant += GlobalVariables.sharedInstance.titleVerticalAdjustment
        barbellLabel.text = NSLocalizedString("Edit barbells", comment: "")
        gymLabel.text = NSLocalizedString("Edit gyms", comment: "")
        collarLabel.text = NSLocalizedString("Edit collars", comment: "")
        alwaysSortLabel.text = NSLocalizedString("Always sort", comment: "")
        convertGymUnitsLabel.text = NSLocalizedString("Convert the output's unit", comment: "")
        removeAdsLabel.text = NSLocalizedString("Remove ads", comment: "")
        restorePurchasesLabel.text = NSLocalizedString("Already purchased?", comment: "")
        tableView.delegate = self
        tableView.dataSource = self
        alwaysSortSwitch.setOn(GlobalVariables.sharedInstance.alwaysSort, animated: false)
        convertGymUnitsSwitch.setOn(GlobalVariables.sharedInstance.convertGymUnits, animated: false)
        var cellsCount = 8
        if SKPaymentQueue.canMakePayments() == false || GlobalVariables.sharedInstance.paidToRemoveAds == true {
            removeAdsCell.selectionStyle = .none
            removeAdsLabel.textColor = GlobalVariables.sharedInstance.placeholderColor
            cellsCount = 5
        }
        var textToTest = [barbellLabel.text, gymLabel.text, collarLabel.text, alwaysSortLabel.text, removeAdsLabel.text, restorePurchasesLabel.text]
        var maxWidth = alwaysSortSwitch.frame.width
        var textLabel = ""
            for row in 0...textToTest.count-1{
                textLabel = NSLocalizedString(textToTest[row]!, comment: "")
                let stringBoundingBoxTextLabel: CGSize = (textLabel as NSString).size(withAttributes: [NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard])
                if alwaysSortLabel.text == textToTest[row]! {
                    let stringBoundingBoxDetailTextLabel: CGSize = CGSize(width: alwaysSortSwitch.bounds.width, height: alwaysSortSwitch.bounds.height)
                    maxWidth = max(stringBoundingBoxTextLabel.width + stringBoundingBoxDetailTextLabel.width + 60, maxWidth)
                }
                else {
                    maxWidth = max(stringBoundingBoxTextLabel.width + 60, maxWidth)
                }
            }
        let height = CGFloat(cellsCount)*44
        self.preferredContentSize = CGSize(width: maxWidth, height: height)
        self.reloadInputViews()
    }

    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        var text=""
        //        self.presentingViewController!.dismissViewControllerAnimated(false, completion: nil)
        switch UIDevice.current.orientation{
        case .portrait:
            text="Portrait"
        case .landscapeLeft:
            text="LandscapeLeft"
        case .landscapeRight:
            text="LandscapeRight"
        default:
            text="Another"
        }
        NSLog("You have moved: \(text)")
    }

    func presentationController(_ controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        let navigationController = UINavigationController(rootViewController: controller.presentedViewController)
        //        let btnDone = UIBarButtonItem(title: "Done", style: .Done, target: self, action: Selector("dismiss"))
        //        navigationController.topViewController!.navigationItem.rightBarButtonItem = btnDone
        return navigationController
    }
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView.cellForRow(at: indexPath)?.reuseIdentifier == "inventoriesCell" {
            self.presentingViewController!.dismiss(animated: false, completion: nil)
            let delay = 0.0 * Double(NSEC_PER_SEC)
            let time = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: time, execute: {self.delegate?.presentInventoryAdvancedSettingsPopover()
            })
        }

        if tableView.cellForRow(at: indexPath)?.reuseIdentifier == "barbellsCell" {
            self.presentingViewController!.dismiss(animated: false, completion: nil)
            let delay = 0.0 * Double(NSEC_PER_SEC)
            let time = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: time, execute: {self.delegate?.presentBarbellAdvancedSettingsPopover()
            })

        }
        if tableView.cellForRow(at: indexPath)?.reuseIdentifier == "collarsCell" {
            self.presentingViewController!.dismiss(animated: false, completion: nil)
            let delay = 0.0 * Double(NSEC_PER_SEC)
            let time = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: time, execute: {self.delegate?.presentCollarAdvancedSettingsPopover()
            })
        }

        if tableView.cellForRow(at: indexPath)?.reuseIdentifier == "removeAdsCell" {
            self.presentingViewController!.dismiss(animated: true, completion: nil)
            delegate?.buyIAP()
        }
        if tableView.cellForRow(at: indexPath)?.reuseIdentifier == "restorePurchasesCell" {
            self.presentingViewController!.dismiss(animated: true, completion: nil)
            delegate?.restorePurchases()
        }
    }


    
    
    
}

