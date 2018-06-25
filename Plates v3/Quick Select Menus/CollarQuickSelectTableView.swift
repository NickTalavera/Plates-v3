//
//  collarQuickSelectTableView.swift
//  Bar - collar Plate Weight Calculator
//
//  Created by Nick Talavera on 4/28/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import UIKit

class CollarQuickSelectTableView: UITableViewController {
    let textCellIdentifier = "TextCell"
    var currentSelectedIndexPath = IndexPath()
    weak var delegate: MainDelegate?
    var currentcollarNames: [String] = [String]()
    var currentcollarValues: [Double] = [Double]()
    var maxWidth: CGFloat = 70
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.view.layoutSubviews()
        NotificationCenter.default.addObserver(self, selector: #selector(dismissHere), name: NSNotification.Name(rawValue: "Reset Pages"), object: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.view.layoutSubviews()
        var detailTextLabel = ""
        var textLabel = ""
        if app.profile.collarCollection.list.count > 0 {
            for row in 0...app.profile.collarCollection.list.count-1{
                textLabel = NSLocalizedString(app.profile.collarCollection.list[row].name, comment: "")
                detailTextLabel = PublicClasses.massFormatter.string(fromValue: app.profile.collarCollection.list[row].weight, unit: UnitOfWeight(unit: app.profile.collarCollection.list[row].unitType).formatter)
                let stringBoundingBoxTextLabel: CGSize = (textLabel as NSString).size(withAttributes: [NSAttributedStringKey.font: app.visuals.fontStandard])
                let stringBoundingBoxDetailTextLabel: CGSize = (detailTextLabel as NSString).size(withAttributes: [NSAttributedStringKey.font: app.visuals.fontStandard])
                maxWidth = max(stringBoundingBoxTextLabel.width + stringBoundingBoxDetailTextLabel.width + 60, maxWidth)
            }
        }
        let height = CGFloat(app.profile.collarCollection.list.count)*44
        self.preferredContentSize = CGSize(width: maxWidth, height: height)
    }
    
    
    @objc func dismissHere() {
        dismiss(animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return app.profile.collarCollection.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath as IndexPath) as! CollarsQuickSelectTableViewCell
        let row = (indexPath as NSIndexPath).row
        cell.leftLabel?.text = NSLocalizedString(app.profile.collarCollection.list[row].name, comment: "")
        cell.detailLabel!.text = PublicClasses.massFormatter.string(fromValue:
            app.profile.collarCollection.list[row].weight, unit:
            UnitOfWeight(unit: app.profile.collarCollection.list[row].unitType).formatter)
        cell.leftLabel!.font = app.visuals.fontStandard
        cell.detailLabel!.font = app.visuals.fontStandard
        cell.detailLabel!.textColor = app.visuals.placeholderColor
        if UIView.userInterfaceLayoutDirection(for: cell.detailLabel.semanticContentAttribute) == UIUserInterfaceLayoutDirection.rightToLeft {
            cell.detailLabel.textAlignment = NSTextAlignment.left
        }
        else {
            cell.detailLabel.textAlignment = NSTextAlignment.right
        }
        cell.leftLabel?.minimumScaleFactor = 0.01
        cell.leftLabel!.adjustsFontSizeToFitWidth = true
        cell.leftLabel!.allowsDefaultTighteningForTruncation = true
        if app.profile.currentCollar.name == app.profile.collarCollection.list.map({$0.name})[row] {
            cell.contentView.backgroundColor = app.visuals.secondaryColor
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
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        //        var detailTextLabel = ""
        //
        //        var textLabel = ""
        //        if currentcollarNames.count > 0 {
        //            for row in 0...currentcollarNames.count-1{
        //                let add: CGFloat = 40
        //                textLabel = NSLocalizedString(currentcollarNames[row], comment: "")
        //                //                detailTextLabel = PublicClasses.massFormatter.unitString(fromValue: currentcollarValues[row], unit: GlobalVariables.sharedInstance.unitsFormatter)
        //                //                let stringBoundingBoxTextLabel: CGSize = ((textLabel as NSString)).size(withAttributes: [NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard])
        //                //                let stringBoundingBoxDetailTextLabel: CGSize = ((detailTextLabel as NSString)).size(withAttributes: [NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard])
        //                //                maxWidth = max(stringBoundingBoxTextLabel.width + stringBoundingBoxDetailTextLabel.width + add, maxWidth)
        //            }
        //        }
        //        //        let height = CGFloat(GlobalVariables.sharedInstance.currentInventoryList.count)*44
        //        //        let currentSetSizeForPopover = CGSize(width: maxWidth, height: height)
        //        tableView.layoutIfNeeded()
        //        self.preferredContentSize = currentSetSizeForPopover
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        let row = (indexPath as NSIndexPath).row
        app.profile.currentCollar = app.profile.collarCollection.list[row]
        app.updateWeightToLift()
        tableView.cellForRow(at: indexPath as IndexPath)?.contentView.backgroundColor = app.visuals.secondaryColor
        tableView.cellForRow(at: currentSelectedIndexPath as IndexPath)?.contentView.backgroundColor = UIColor.clear
        self.delegate?.updatePageProtocol()
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
}
