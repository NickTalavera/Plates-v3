//
//  BarbellQuickSelectTableView.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 4/28/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import UIKit

class InventoryQuickSelectTableView: UITableViewController {
//    let textCellIdentifier = "TextCell"
//    var currentSelectedIndexPath = IndexPath()
    weak var delegate: MainDelegate?
//    var sortedAlready = false
//    var maxWidth: CGFloat = 70
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
//        self.view.layoutSubviews()
//         NotificationCenter.default.addObserver(self, selector: #selector(dismissHere), name: NSNotification.Name(rawValue: "Reset Pages"), object: nil)
//    }
//
//
//    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
//        var detailTextLabel = ""
//        var textLabel = ""
////        if currentInventoryNames.count > 0 {
////            for row in 0...currentInventoryNames.count-1{
////                let add: CGFloat = 40
////                textLabel = NSLocalizedString(currentInventoryNames[row], comment: "")
////                detailTextLabel = PublicClasses.massFormatter.unitString(fromValue: 0, unit: GlobalVariables.sharedInstance.unitsFormatter)
////                let stringBoundingBoxTextLabel: CGSize = ((textLabel as NSString)).size(withAttributes: [NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard])
////                let stringBoundingBoxDetailTextLabel: CGSize = ((detailTextLabel as NSString)).size(withAttributes: [NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard])
////                maxWidth = max(stringBoundingBoxTextLabel.width + stringBoundingBoxDetailTextLabel.width + add, maxWidth)
////            }
////        }
////        let height = CGFloat(GlobalVariables.sharedInstance.currentInventoryList.count)*44
////        let currentSetSizeForPopover = CGSize(width: maxWidth, height: height)
////        tableView.layoutIfNeeded()
////        self.preferredContentSize = currentSetSizeForPopover
//    }
//
//    @objc func dismissHere() {
//        dismiss(animated: true, completion: nil)
//    }
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        if sortedAlready == false {
////            for (keys, values) in Array(GlobalVariables.sharedInstance.currentInventoryList).sorted(by: {$0.0 < $1.0}) {
////                if "Calculator only" == keys {
////                    currentInventoryNames.insert(keys, at: 0)
////                    currentInventoryValues.insert(values, at: 0)
//////                    currentInventoryUnits.insert(GlobalVariables.sharedInstance.units, at: 0)
////                }
////                else {
////                    currentInventoryNames += [keys]
////                    currentInventoryValues += [values]
//////                    currentInventoryUnits += [GlobalVariables.sharedInstance.currentInventoryUnits[keys]!]
////                }
////            }
////            sortedAlready = true
////        }
////        return currentInventoryValues.count
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(false)
////        self.view.layoutSubviews()
////        var detailTextLabel = ""
////        var textLabel = ""
////        if currentInventoryNames.count > 0 {
////            for row in 0...currentInventoryNames.count-1{
////                let add: CGFloat = 40
////                textLabel = NSLocalizedString(currentInventoryNames[row], comment: "")
////                detailTextLabel = PublicClasses.massFormatter.unitString(fromValue: 0, unit: GlobalVariables.sharedInstance.unitsFormatter)
////                let stringBoundingBoxTextLabel: CGSize = ((textLabel as NSString)).size(withAttributes: [NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard])
////                let stringBoundingBoxDetailTextLabel: CGSize = ((detailTextLabel as NSString)).size(withAttributes: [NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard])
////                maxWidth = max(stringBoundingBoxTextLabel.width + stringBoundingBoxDetailTextLabel.width + add, maxWidth)
////            }
////        }
////        let height = CGFloat(GlobalVariables.sharedInstance.currentInventoryList.count)*44
////        let currentSetSizeForPopover = CGSize(width: maxWidth, height: height)
////        tableView.layoutIfNeeded()
////        self.preferredContentSize = currentSetSizeForPopover
////    }
////
////
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! InventoryQuickSelectTableViewCell
//
//        let row = (indexPath as NSIndexPath).row
////        cell.leftLabel?.text = NSLocalizedString(currentInventoryNames[row], comment: "")
//////        var unit: MassFormatter.Unit = MassFormatter.Unit.kilogram
////        if cell.leftLabel?.text != NSLocalizedString("Calculator only", comment: "") {
//////            if currentInventoryUnits[row] == "Kg" {
//////                unit = MassFormatter.Unit.kilogram
//////            }
//////            else {
//////                unit = MassFormatter.Unit.pound
//////            }
//////            cell.detailLabel!.text = PublicClasses.massFormatter.unitString(fromValue: 0, unit: unit)
////        }
//////        else {
//////            cell.detailLabel!.text = ""
//////        }
//        cell.leftLabel.clipsToBounds = true
//        cell.leftLabel!.font = app.visuals.fontStandard
//        cell.leftLabel!.adjustsFontSizeToFitWidth = true
//        cell.leftLabel!.allowsDefaultTighteningForTruncation = true
////        cell.detailLabel!.font = GlobalVariables.sharedInstance.fontStandard
////        cell.detailLabel!.adjustsFontSizeToFitWidth = true
////        cell.detailLabel!.allowsDefaultTighteningForTruncation = true
////        #if os(iOS)
//////            cell.detailLabel!.textColor = GlobalVariables.sharedInstance.placeholderColor
//////            if UIView.userInterfaceLayoutDirection(for: cell.detailLabel.semanticContentAttribute) == UIUserInterfaceLayoutDirection.rightToLeft {
//////                cell.detailLabel.textAlignment = NSTextAlignment.left
//////            }
//////            else {
//////                cell.detailLabel.textAlignment = NSTextAlignment.right
//////            }
////        #endif
////
//////        let spacerConstraint = NSLayoutConstraint(item: cell.leftLabel, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: cell.detailLabel, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: -10)
////        let detailLabelTrailing = NSLayoutConstraint(item: cell.leftLabel, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: cell.contentView, attribute: NSLayoutAttribute.trailingMargin, multiplier: 1, constant: 0)
////        let leftLabelLeading = NSLayoutConstraint(item: cell.leftLabel, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: cell.contentView, attribute: NSLayoutAttribute.leadingMargin, multiplier: 1, constant: 0)
////        cell.leftLabel.translatesAutoresizingMaskIntoConstraints = false
//////        cell.detailLabel.translatesAutoresizingMaskIntoConstraints = false
////        NSLayoutConstraint.activate([leftLabelLeading, detailLabelTrailing])
////
////
////        if GlobalVariables.sharedInstance.currentInventoryName == currentInventoryNames[row] {
////            cell.contentView.backgroundColor = GlobalVariables.sharedInstance.secondaryColor
////            currentSelectedIndexPath = indexPath
////        }
////        else {
////            cell.contentView.backgroundColor = UIColor.clear
////        }
//////        cell.detailLabel!.layer.zPosition=1
//////        cell.detailLabel.removeFromSuperview()
////        cell.setNeedsLayout()
//        return cell
//    }
//
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////            #if os(iOS)
////        Armchair.userDidSignificantEvent(true)
////                #endif
////        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
////        let row = (indexPath as NSIndexPath).row
////        let oldInventorySet = GlobalVariables.sharedInstance.currentInventorySet
////            var stillLower = true
////            GlobalVariables.sharedInstance.currentInventoryName = currentInventoryNames[row]
////            GlobalVariables.sharedInstance.currentInventorySet = currentInventoryValues[row]
////            tableView.cellForRow(at: indexPath as IndexPath)?.contentView.backgroundColor = GlobalVariables.sharedInstance.secondaryColor
////            tableView.cellForRow(at: currentSelectedIndexPath as IndexPath)?.contentView.backgroundColor = UIColor.clear
//////            if currentInventoryUnits[row] != GlobalVariables.sharedInstance.units  {
//////                    delegate?.switchUnitsToWrapDelegate(currentInventoryUnits[row])
//////                    stillLower = false
//////            }
////            if stillLower == true {
////                stillLower = PublicClasses.stillLower()
//////                var counts:[String:Int] = [:]
//////                for item in GlobalVariables.sharedInstance.currentPlatesInUse {
//////                    counts[item] = (counts[item] ?? 0) + 1
//////                }
//////                for i in 0...GlobalVariables.sharedInstance.currentPlates.count-1 {
//////                    for (key,value) in counts {
////////                        if GlobalVariables.sharedInstance.currentPlates[i] == key {
////////                            if currentInventoryValues[row][i] < value {
////////                                stillLower = false
////////                                break
////////                            }
////////                            continue
////////                        }
//////                    }
//////                }
////            }
////            if stillLower == false {
////                self.delegate?.resetEverythingProtocol()
////            }
////
////        if oldInventorySet != GlobalVariables.sharedInstance.currentInventorySet {
////            self.delegate?.updateButtonsEnabledProtocol()
////        }
////        if GlobalVariables.sharedInstance.currentInventoryName != "Calculator only" {
////        if GlobalVariables.sharedInstance.gymsChosen.index(of: GlobalVariables.sharedInstance.currentInventoryName) == nil {
////        GlobalVariables.sharedInstance.gymsChosen.removeLast()
////        }
////        else {
////            GlobalVariables.sharedInstance.gymsChosen.remove(at: GlobalVariables.sharedInstance.gymsChosen.index(of: GlobalVariables.sharedInstance.currentInventoryName)!)
////        }
////        GlobalVariables.sharedInstance.gymsChosen.insert(GlobalVariables.sharedInstance.currentInventoryName, at: 0)
////        }
////
//            self.presentingViewController!.dismiss(animated: true, completion: nil)
//    }
}
