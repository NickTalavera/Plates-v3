//
//  BarbellQuickSelectTableView.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 4/28/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import UIKit
#if os(iOS)
import Armchair
    #endif

class BarbellQuickSelectTableView: UITableViewController {
    let textCellIdentifier = "TextCell"
    var currentSelectedIndexPath = IndexPath()
    weak var delegate: MainDelegate?
    var sortedAlready = false
    var currentBarbellNames: [String] = [String]()
    var currentBarbellValues: [Double] = [Double]()
    var maxWidth: CGFloat = 70
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Array(GlobalVariables.sharedInstance.barbellsListUnits.keys))
        print(Array(GlobalVariables.sharedInstance.currentBarbellSet.keys))
        tableView.delegate = self
        tableView.dataSource = self
        self.view.layoutSubviews()
         NotificationCenter.default.addObserver(self, selector: #selector(dismissHere), name: NSNotification.Name(rawValue: "Reset Pages"), object: nil)
    }

#if os(iOS)
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        var detailTextLabel = ""
        
        var textLabel = ""
        if currentBarbellNames.count > 0 {
            for row in 0...currentBarbellNames.count-1{
                let add: CGFloat = 40
                textLabel = NSLocalizedString(currentBarbellNames[row], comment: "")
                detailTextLabel = PublicClasses.massFormatter.unitString(fromValue: currentBarbellValues[row], unit: GlobalVariables.sharedInstance.unitsFormatter)
                let stringBoundingBoxTextLabel: CGSize = ((textLabel as NSString)).size(withAttributes: [NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard])
                let stringBoundingBoxDetailTextLabel: CGSize = ((detailTextLabel as NSString)).size(withAttributes: [NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard])
                maxWidth = max(stringBoundingBoxTextLabel.width + stringBoundingBoxDetailTextLabel.width + add, maxWidth)
            }
        }
        let height = CGFloat(GlobalVariables.sharedInstance.currentInventoryList.count)*44
        let currentSetSizeForPopover = CGSize(width: maxWidth, height: height)
        tableView.layoutIfNeeded()
        self.preferredContentSize = currentSetSizeForPopover
    }
#endif

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.view.layoutSubviews()
        var detailTextLabel = ""
        var textLabel = ""
        if currentBarbellNames.count > 0 {
            for row in 0...currentBarbellNames.count-1{
                textLabel = NSLocalizedString(currentBarbellNames[row], comment: "")
                detailTextLabel = PublicClasses.massFormatter.string(fromValue: currentBarbellValues[row], unit: GlobalVariables.sharedInstance.unitsFormatter)
                let stringBoundingBoxTextLabel: CGSize = (textLabel as NSString).size(withAttributes: [NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard])
                let stringBoundingBoxDetailTextLabel: CGSize = (detailTextLabel as NSString).size(withAttributes: [NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard])
                maxWidth = max(stringBoundingBoxTextLabel.width + stringBoundingBoxDetailTextLabel.width + 60, maxWidth)
            }
        }
        let height = CGFloat(GlobalVariables.sharedInstance.currentBarbellSet.count)*44
        self.preferredContentSize = CGSize(width: maxWidth, height: height)
        print(Array(GlobalVariables.sharedInstance.barbellsListUnits.keys))
    }


    @objc func dismissHere() {
        dismiss(animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sortedAlready == false {
            for keys in Array(GlobalVariables.sharedInstance.currentBarbellSet.keys).sorted(by: {$0 < $1}) {
                if keys == "No barbell" {
                    currentBarbellNames.insert(keys, at: 0)
                    currentBarbellValues.insert(GlobalVariables.sharedInstance.currentBarbellSet[keys]!, at: 0)
                }
                else {
                currentBarbellNames += [keys]
                currentBarbellValues += [GlobalVariables.sharedInstance.currentBarbellSet[keys]!]
                }
            }
            sortedAlready = true
        }
        return currentBarbellValues.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath as IndexPath) as! BarbellQuickSelectTableViewCell
        let row = (indexPath as NSIndexPath).row
        cell.leftLabel?.text = NSLocalizedString(currentBarbellNames[row], comment: "")
        cell.detailLabel!.text = PublicClasses.massFormatter.string(fromValue: currentBarbellValues[row], unit: GlobalVariables.sharedInstance.unitsFormatter)
        cell.leftLabel!.font = GlobalVariables.sharedInstance.fontStandard
        cell.detailLabel!.font = GlobalVariables.sharedInstance.fontStandard
        #if os(iOS)
            cell.detailLabel!.textColor = GlobalVariables.sharedInstance.placeholderColor
            if UIView.userInterfaceLayoutDirection(for: cell.detailLabel.semanticContentAttribute) == UIUserInterfaceLayoutDirection.rightToLeft {
                cell.detailLabel.textAlignment = NSTextAlignment.left
            }
            else {
                cell.detailLabel.textAlignment = NSTextAlignment.right
            }
        #endif
        cell.leftLabel?.minimumScaleFactor = 0.01
        cell.leftLabel!.adjustsFontSizeToFitWidth = true
        cell.leftLabel!.allowsDefaultTighteningForTruncation = true
        if GlobalVariables.sharedInstance.currentBarName == currentBarbellNames[row] {
            cell.contentView.backgroundColor = GlobalVariables.sharedInstance.secondaryColor
            currentSelectedIndexPath = indexPath
        }
        else {
            cell.contentView.backgroundColor = UIColor.clear
        }
        cell.detailLabel!.layer.zPosition=1
        let spacerConstraint = NSLayoutConstraint(item: cell.leftLabel, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: cell.detailLabel, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: -10)
        let detailLabelTrailing = NSLayoutConstraint(item: cell.detailLabel, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: cell.contentView, attribute: NSLayoutAttribute.trailingMargin, multiplier: 1, constant: 0)
        let leftLabelLeading = NSLayoutConstraint(item: cell.leftLabel, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: cell.contentView, attribute: NSLayoutAttribute.leadingMargin, multiplier: 1, constant: 0)
        cell.leftLabel.translatesAutoresizingMaskIntoConstraints = false
        cell.detailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([detailLabelTrailing,spacerConstraint, leftLabelLeading])
        cell.setNeedsLayout()
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        let row = (indexPath as NSIndexPath).row
             GlobalVariables.sharedInstance.weightToLift = GlobalVariables.sharedInstance.weightToLift - GlobalVariables.sharedInstance.currentBarWeight +  Double(currentBarbellValues[row])
        GlobalVariables.sharedInstance.currentBarName = currentBarbellNames[row]
        GlobalVariables.sharedInstance.currentBarWeight = Double(currentBarbellValues[row])
        tableView.cellForRow(at: indexPath as IndexPath)?.contentView.backgroundColor = GlobalVariables.sharedInstance.secondaryColor
        tableView.cellForRow(at: currentSelectedIndexPath as IndexPath)?.contentView.backgroundColor = UIColor.clear
        self.delegate?.updatePageProtocol()
        #if os(iOS)
            Armchair.userDidSignificantEvent(true)
                    PublicClasses.wcSendAllImportantGlobals()
        #endif
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
}
