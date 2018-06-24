//
//  CollarQuickSelectTableView.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 4/28/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import UIKit
#if os(iOS)
import Armchair
#endif

class CollarQuickSelectTableView: UITableViewController {
    let textCellIdentifier = "TextCell"
    weak var delegate: MainDelegate?
    var currentSelectedIndexPath = IndexPath()
    var sortedAlready = false
    var currentCollarNames: [String] = [String]()
    var currentCollarValues: [Double] = [Double]()
    var maxWidth: CGFloat = 70
    var cellHeight: CGFloat = 44

    #if os(iOS)
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        var detailTextLabel = ""
        var textLabel = ""
        if currentCollarNames.count > 0 {
            for row in 0...currentCollarNames.count-1{
                let add: CGFloat = 40
                textLabel = NSLocalizedString(currentCollarNames[row], comment: "")
                detailTextLabel = PublicClasses.massFormatter.unitString(fromValue: currentCollarValues[row], unit: GlobalVariables.sharedInstance.unitsFormatter)
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
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(dismissHere), name: NSNotification.Name(rawValue: "Reset Pages"), object: nil)
    }
    @objc func dismissHere() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.layoutSubviews()
        var detailTextLabel = ""
        var textLabel = ""
        if currentCollarNames.count > 0 {
            for row in 0...currentCollarNames.count-1{
                textLabel = NSLocalizedString(currentCollarNames[row], comment: "")
                detailTextLabel = PublicClasses.massFormatter.string(fromValue: currentCollarValues[row], unit: GlobalVariables.sharedInstance.unitsFormatter)
                let stringBoundingBoxTextLabel: CGSize = ((textLabel as NSString)).size(withAttributes: [NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard])
                let stringBoundingBoxDetailTextLabel: CGSize = ((detailTextLabel as NSString)).size(withAttributes: [NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard])
                maxWidth = max(stringBoundingBoxTextLabel.width + stringBoundingBoxDetailTextLabel.width + 40, maxWidth)
            }
        }
        let height = CGFloat(GlobalVariables.sharedInstance.currentCollarSet.count)*44
        self.preferredContentSize = CGSize(width: maxWidth, height: height)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.sortedAlready == false {
            for keys in Array(GlobalVariables.sharedInstance.currentCollarSet.keys).sorted(by: {$0 < $1}) {
                if keys == "No collar" {
                    currentCollarNames.insert(keys, at: 0)
                    currentCollarValues.insert(GlobalVariables.sharedInstance.currentCollarSet[keys]!, at: 0)
                }
                else {
                    currentCollarNames += [keys]
                    currentCollarValues += [GlobalVariables.sharedInstance.currentCollarSet[keys]!]
                }
            }

            self.sortedAlready = true
        }
        return self.currentCollarValues.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! CollarsQuickSelectTableViewCell
        let row = (indexPath as NSIndexPath).row
        cell.detailLabel!.text = PublicClasses.massFormatter.string(fromValue: currentCollarValues[row], unit: GlobalVariables.sharedInstance.unitsFormatter)
        cell.leftLabel.text = NSLocalizedString(currentCollarNames[row], comment: "")
        cell.leftLabel!.adjustsFontSizeToFitWidth = true
        cell.leftLabel!.allowsDefaultTighteningForTruncation = true
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
        let stringBoundingBoxTextLabel: CGSize = (((cell.leftLabel?.text)! as NSString)).size(withAttributes: [NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard])
        let stringBoundingBoxDetailTextLabel: CGSize = (((cell.leftLabel?.text)! as NSString)).size(withAttributes: [NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard])
        preferredContentSize = CGSize(width: stringBoundingBoxTextLabel.width + stringBoundingBoxDetailTextLabel.width, height: preferredContentSize.height)
        cell.leftLabel?.minimumScaleFactor = 0.1
        cell.leftLabel!.adjustsFontSizeToFitWidth = true
        cell.backgroundColor = UIColor.clear
        if GlobalVariables.sharedInstance.currentCollarName == currentCollarNames[row] {
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
        #if os(iOS)
            Armchair.userDidSignificantEvent(true)
        #endif
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        let row = (indexPath as NSIndexPath).row
        GlobalVariables.sharedInstance.weightToLift = GlobalVariables.sharedInstance.weightToLift - GlobalVariables.sharedInstance.currentCollarWeight + Double(currentCollarValues[row])
        GlobalVariables.sharedInstance.currentCollarName = currentCollarNames[row]
        GlobalVariables.sharedInstance.currentCollarWeight = Double(currentCollarValues[row])
        self.delegate?.updatePageProtocol()
        tableView.cellForRow(at: indexPath as IndexPath)?.contentView.backgroundColor = GlobalVariables.sharedInstance.secondaryColor
        tableView.cellForRow(at: currentSelectedIndexPath as IndexPath)?.contentView.backgroundColor = UIColor.clear
        #if os(iOS)
        PublicClasses.wcSendAllImportantGlobals()
            #endif
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
//    override func viewWillDisappear(animated: Bool) {
//        PublicClasses.wcSendAllImportantGlobals()
//    }
}
