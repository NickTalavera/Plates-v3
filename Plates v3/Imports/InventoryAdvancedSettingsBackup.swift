//
//  InventoryAdvancedSettingsPopoverSegue.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 4/29/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import UIKit
import FZAccordionTableView

class InventoryAdvancedSettingsBackup: UIViewController, UIPopoverPresentationControllerDelegate, FZAccordionTableViewDelegate, UITextFieldDelegate {
    static fileprivate let kTableViewCellReuseIdentifier = "TableViewCellReuseIdentifier"
    weak var delegate: MainDelegate?
    var sortedAlready = false
    var currentInventoryNames: [String] = [String]()
    var currentInventoryUnits: [String] = [String]()
    var currentInventoryUnitsFormatter: [MassFormatter.Unit] = []
    var currentInventoryValues: [[Int]] = [[Int]]()
    var currentPlates: [[Double]] = [[Double]]()
    var textValueTemp = ""
    //    @IBOutlet weak var navigationBar: UINavigationItem!
    var addLabel = UILabel()
    @IBOutlet weak var tableViewAccordion: FZAccordionTableView!

    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBAction func doneButtonAction(_ sender: AnyObject) {
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }

    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBAction func addButtonAction(_ sender: AnyObject) {
        if self.currentInventoryNames.count < 8 {
            let isMetric: Bool = Locale.current.usesMetricSystem
            if isMetric == true {
                self.currentInventoryUnits += ["Kg"]
                self.currentInventoryUnitsFormatter += [MassFormatter.Unit.kilogram]
                self.currentPlates += [GlobalVariables.sharedInstance.platesKG]
            }
            else {
                self.currentInventoryUnits += ["lbs"]
                self.currentInventoryUnitsFormatter += [MassFormatter.Unit.pound]
                self.currentPlates += [GlobalVariables.sharedInstance.platesLBS]
            }
            self.currentInventoryValues += [[6,8,4,4,4,4,4,2,2]]
            self.currentInventoryNames += [findNextName()]
            self.tableViewAccordion.reloadData()
            self.updateGlobals()

            if GlobalVariables.sharedInstance.gymsChosen.count < 3 {
                GlobalVariables.sharedInstance.gymsChosen.append(currentInventoryNames.last!)
            }
            var shortcutArray: [UIApplicationShortcutItem] = [UIApplicationShortcutItem(type: "calculatorOnlyItem", localizedTitle: NSLocalizedString("Calculator only", comment: ""), localizedSubtitle: "", icon: .none, userInfo: nil)]
            if GlobalVariables.sharedInstance.gymsChosen.count >= 1 {
                let shortcut2 = UIApplicationShortcutItem(type: "gymIndex0", localizedTitle: GlobalVariables.sharedInstance.gymsChosen[0], localizedSubtitle: "", icon: .none, userInfo: nil)
                shortcutArray.append(shortcut2)
            }
            if GlobalVariables.sharedInstance.gymsChosen.count >= 2 {
                let shortcut3 = UIApplicationShortcutItem(type: "gymIndex1", localizedTitle: GlobalVariables.sharedInstance.gymsChosen[1], localizedSubtitle: "", icon: .none, userInfo: nil)
                shortcutArray.append(shortcut3)
            }
            if GlobalVariables.sharedInstance.gymsChosen.count >= 3 {
                let shortcut4 = UIApplicationShortcutItem(type: "gymIndex2", localizedTitle: GlobalVariables.sharedInstance.gymsChosen[2], localizedSubtitle: "", icon: .none, userInfo: nil)
                shortcutArray.append(shortcut4)
            }
            UIApplication.shared.shortcutItems = shortcutArray
        }
    }

    func findNextName() -> String {
        var minNum: Int = 1
        var numArray: [Int] = [Int]()
        if currentInventoryNames.count > 0 {
            for i in 0...currentInventoryNames.count-1 {
                let collarNameToSplit: String = currentInventoryNames[i]
                let collarSubstring = NSLocalizedString("Gym", comment: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                if collarNameToSplit.characters.count >= collarSubstring.characters.count {
                    let substringTest = "\(collarNameToSplit.substring(with: collarSubstring.startIndex..<collarSubstring.endIndex))".trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                    let index = currentInventoryNames[i].replacingOccurrences(of: collarSubstring, with: "", options: NSString.CompareOptions.literal, range: nil).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                    if substringTest == collarSubstring && Int(index) != nil {
                        numArray += [(PublicClasses.numberFormatterDecimal.number(from: index)?.intValue)!]
                    }
                }
            }
        }
        if numArray.count == 0 {
            numArray = [0]
        }
        for i in 1...numArray.max()!+1 {
            if numArray.contains(i) == false {
                minNum = i
                break
            }
        }
        return "\(NSLocalizedString("Gym", comment: "")) \(minNum)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        self.tableViewAccordion.allowMultipleSectionsOpen = false
        self.tableViewAccordion.register(GymAdvancedSettingTableViewCell.classForCoder(), forCellReuseIdentifier: InventoryAdvancedSettings.kTableViewCellReuseIdentifier)
        self.tableViewAccordion.register(UINib(nibName: "AccordionHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: AccordionHeaderView.kAccordionHeaderViewReuseIdentifier)
        self.tableViewAccordion.tableFooterView = UIView(frame: CGRect.zero)
        NotificationCenter.default.addObserver(self, selector: #selector(dismissHere), name: NSNotification.Name(rawValue: "Reset Pages"), object: nil)
    }

    func dismissHere() {
        dismiss(animated: true, completion: nil)
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        let bigLabel: UILabel = UILabel()
        bigLabel.text = NSLocalizedString("Gyms", comment: "")
        bigLabel.backgroundColor = UIColor.clear
        bigLabel.textColor = GlobalVariables.sharedInstance.secondaryTextColor
        bigLabel.font = GlobalVariables.sharedInstance.fontTitle!
        bigLabel.adjustsFontSizeToFitWidth = true
        bigLabel.sizeToFit()
        self.navigationItem.titleView = bigLabel
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([ NSFontAttributeName: GlobalVariables.sharedInstance.fontStandard], for: UIControlState.normal)
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([ NSFontAttributeName: GlobalVariables.sharedInstance.fontStandard], for: UIControlState.normal)
        navigationItem.rightBarButtonItem?.tintColor = GlobalVariables.sharedInstance.mainColor
        navigationItem.leftBarButtonItem?.tintColor = GlobalVariables.sharedInstance.mainColor
        navigationController?.navigationBar.setTitleVerticalPositionAdjustment(GlobalVariables.sharedInstance.titleVerticalAdjustment, for: .default)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: GlobalVariables.sharedInstance.secondaryTextColor, NSFontAttributeName: GlobalVariables.sharedInstance.fontTitle!]
        navigationController!.navigationBar.barTintColor = GlobalVariables.sharedInstance.secondaryColor
    }


    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int {
        if sortedAlready == false {
            for (keys, values) in Array(GlobalVariables.sharedInstance.currentInventoryList).sorted(by: {$0.0 < $1.0}) {
                if keys == "Calculator only" {
                    currentInventoryNames.insert(keys, at: 0)
                    currentInventoryUnits.insert(GlobalVariables.sharedInstance.currentInventoryUnits[keys]!, at: 0)
                    currentInventoryValues.insert(values, at: 0)
                    if GlobalVariables.sharedInstance.currentInventoryUnits[keys]! == "Kg" {
                        currentInventoryUnitsFormatter.insert(MassFormatter.Unit.kilogram, at: 0)
                        currentPlates.insert(GlobalVariables.sharedInstance.platesKG, at: 0)
                    }
                    else {
                        currentInventoryUnitsFormatter.insert(MassFormatter.Unit.pound, at: 0)
                        currentPlates.insert(GlobalVariables.sharedInstance.platesLBS, at: 0)
                    }
                }
                else {
                    currentInventoryNames += [keys]
                    currentInventoryUnits += [GlobalVariables.sharedInstance.currentInventoryUnits[keys]!]
                    currentInventoryValues += [values]
                    if GlobalVariables.sharedInstance.currentInventoryUnits[keys]! == "Kg" {
                        currentInventoryUnitsFormatter.append(MassFormatter.Unit.kilogram)
                        currentPlates += [GlobalVariables.sharedInstance.platesKG]
                    }
                    else {
                        currentInventoryUnitsFormatter += [MassFormatter.Unit.pound]
                        currentPlates += [GlobalVariables.sharedInstance.platesLBS]
                    }
                }
            }
            sortedAlready = true
        }
        if currentInventoryNames.count == 0 {
            self.tableViewAccordion.isScrollEnabled = false
            let addLabel = UILabel(frame: self.view.bounds)
            self.view.addSubview(addLabel)
            addLabel.numberOfLines = 2
            addLabel.text = NSLocalizedString("Add a gym", comment: "")
            addLabel.textAlignment = NSTextAlignment.center
            addLabel.font = GlobalVariables.sharedInstance.fontAddX
            addLabel.textColor = GlobalVariables.sharedInstance.secondaryColor
            addLabel.sizeToFit()
            addLabel.adjustsFontSizeToFitWidth = true
            addLabel.tag = 91248124
            addLabel.alpha = 0
            UIView.transition(with: addLabel, duration: GlobalVariables.sharedInstance.platesFadeDuration, options: [.transitionCrossDissolve], animations: {
                addLabel.alpha = 1
                self.tableViewAccordion.alpha = 0
            }, completion: nil)
            let addLabelVerticalContraints = NSLayoutConstraint(item: addLabel, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: -44)
            let addLabelHorizontalContraints = NSLayoutConstraint(item: addLabel, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
            let addLabelWidth = NSLayoutConstraint(item: addLabel, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.9, constant: 0)
            addLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([addLabelVerticalContraints,addLabelHorizontalContraints,addLabelWidth])
        }
        else {
            self.tableViewAccordion.alpha = 1
            self.tableViewAccordion.isScrollEnabled = true
            if self.tableViewAccordion.superview!.subviews.count > 0 {
                for view in self.tableViewAccordion.superview!.subviews {
                    if view.tag == 91248124 {
                        UIView.transition(with: view, duration: GlobalVariables.sharedInstance.platesFadeDuration, options: [.transitionCrossDissolve], animations: {
                            view.alpha = 0
                        }, completion: { (finished: Bool) -> Void in
                            view.removeFromSuperview()
                        })
                    }
                }
            }
        }
        return currentInventoryNames.count
    }

    func updateGlobals() {
        let calculatorOnlyValues = GlobalVariables.sharedInstance.currentInventoryList["Calculator only"]
        let oldGymName = GlobalVariables.sharedInstance.currentInventoryName
        let oldGymUnit = GlobalVariables.sharedInstance.currentInventoryUnits[GlobalVariables.sharedInstance.currentInventoryName]
        let oldGymInventoryCounts = GlobalVariables.sharedInstance.currentInventoryList[GlobalVariables.sharedInstance.currentInventoryName]
        let oldInventorySet = GlobalVariables.sharedInstance.currentInventorySet
        let oldGymSection = currentInventoryNames.index(of: oldGymName)
        GlobalVariables.sharedInstance.currentInventoryList = [:]
        GlobalVariables.sharedInstance.currentInventoryUnits = [:]
        if currentInventoryNames.count > 0 {
            for i in 0...currentInventoryNames.count-1 {
                let key = currentInventoryNames[i]
                GlobalVariables.sharedInstance.currentInventoryList[key] = self.currentInventoryValues[i]
                GlobalVariables.sharedInstance.currentInventoryUnits[key] = self.currentInventoryUnits[i]
            }
        }
        //        GlobalVariables.sharedInstance.currentInventoryList["Calculator only"] = calculatorOnlyValues
        //        GlobalVariables.sharedInstance.currentInventoryUnits["Calculator only"] = GlobalVariables.sharedInstance.units
        if GlobalVariables.sharedInstance.currentInventoryList[oldGymName] != nil {
            GlobalVariables.sharedInstance.currentInventorySet = GlobalVariables.sharedInstance.currentInventoryList[GlobalVariables.sharedInstance.currentInventoryName]!
        }
        else {
            GlobalVariables.sharedInstance.currentInventoryName = "Calculator only"
            GlobalVariables.sharedInstance.currentInventorySet = calculatorOnlyValues!
            delegate?.resetEverythingProtocol()
        }
        if GlobalVariables.sharedInstance.currentInventoryUnits[oldGymName] != oldGymUnit {
            //            GlobalVariables.sharedInstance.currentInventoryName = "Calculator only"
            //            GlobalVariables.sharedInstance.currentInventorySet = calculatorOnlyValues!
            GlobalVariables.sharedInstance.units = GlobalVariables.sharedInstance.currentInventoryUnits[GlobalVariables.sharedInstance.currentInventoryName]!
            if GlobalVariables.sharedInstance.units == "Kg" {
                GlobalVariables.sharedInstance.unitsFormatter = MassFormatter.Unit.kilogram
            }
            else {
                GlobalVariables.sharedInstance.unitsFormatter = MassFormatter.Unit.pound
            }
            delegate?.resetEverythingProtocol()
        }
        if GlobalVariables.sharedInstance.currentPlatesInUse.count > 0 && oldGymSection != nil {
            var counts:[Double:Int] = [:]
            for item in GlobalVariables.sharedInstance.currentPlatesInUse {
                counts[item] = (counts[item] ?? 0) + 1
            }
            for i in 0...oldGymInventoryCounts!.count-1 {
                if counts[currentPlates[oldGymSection!][i]] != nil {
                }
                if counts[currentPlates[oldGymSection!][i]] != nil && counts[currentPlates[oldGymSection!][i]]!*2 > currentInventoryValues[oldGymSection!][i] {
                    delegate?.resetEverythingProtocol()
                    break
                }
            }
        }
        if GlobalVariables.sharedInstance.currentInventorySet != oldInventorySet {
            delegate?.updateButtonsEnabledProtocol()
        }

        DataAccess.sharedInstance.saveEverything()
        PublicClasses.wcSendAllImportantGlobals()
    }

    func segmentValueChanged(_ sender: UISegmentedControl) {
        self.view.endEditing(true)
        let selectedIndex = sender.selectedSegmentIndex
        var section = 0
        for i in 0...tableViewAccordion.numberOfSections-1 {
            if tableViewAccordion.isSectionOpen(i) == true {
                section = i
                break
            }
        }
        if selectedIndex == 0 {
            currentInventoryUnits[section] = "Kg"
            currentInventoryUnitsFormatter[section] = MassFormatter.Unit.kilogram
            currentPlates[section] = GlobalVariables.sharedInstance.platesKG
        }
        else if selectedIndex == 1 {
            currentInventoryUnits[section] = "lbs"
            currentInventoryUnitsFormatter[section] = MassFormatter.Unit.pound
            currentPlates[section] = GlobalVariables.sharedInstance.platesLBS
        }


        for rowToLookAt in 2 ..< tableViewAccordion.numberOfRows(inSection: section)-1
        {
            let cell: GymAdvancedSettingTableViewCell = tableView(self.tableViewAccordion, cellForRowAtIndexPath: NSIndexPath(row: rowToLookAt, section: section) as IndexPath) as! GymAdvancedSettingTableViewCell
            cell.leftLabel.text = PublicClasses.massFormatter.string(fromValue: currentPlates[section][rowToLookAt-2], unit: currentInventoryUnitsFormatter[section])
        }
        var rowsAvailable = self.tableViewAccordion.indexPathsForVisibleRows
        rowsAvailable?.remove(at: (rowsAvailable?.index(of: IndexPath(row:0, section: section)))!);
        updateGlobals()
        rowsAvailable?.remove(at: (rowsAvailable?.index(of: IndexPath(row:1, section: section)))!)
        updateGlobals()
        self.tableViewAccordion.reloadRows(at: rowsAvailable!, with: UITableViewRowAnimation.none)
    }

    func tableView(_ tableView: UITableView, canEditRowAtIndexPath indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            // handle delete (by removing the data from your array and updating the tableview)
        }
    }

    func stepperValueChanged(_ sender: UIStepper) {
        self.view.endEditing(true)
        let row = sender.tag
        let index = row - 2
        var section = 0
        for i in 0...tableViewAccordion.numberOfSections-1 {
            if tableViewAccordion.isSectionOpen(i) == true {
                section = i
                break
            }
        }
        let cell = tableView(self.tableViewAccordion, cellForRowAtIndexPath: IndexPath(row: row, section: section)) as! GymAdvancedSettingTableViewCell
        if (currentInventoryValues[section].filter { $0 > 0}).count <= 1 && sender.value <= (sender.minimumValue + sender.stepValue) {
            sender.value = sender.minimumValue + sender.stepValue
            if currentInventoryNames[section] == "Calculator only" {
                sender.value = 20
            }
        }
        currentInventoryValues[section][index] = Int(sender.value)
        updateGlobals()
        self.tableViewAccordion.reloadRows(at: [IndexPath(row:row, section: section)], with: UITableViewRowAnimation.none)
    }

    func removeButtonAction(_ sender:UIButton!)
    {
        var section = 0
        for i in 0...tableViewAccordion.numberOfSections-1 {
            if tableViewAccordion.isSectionOpen(i) == true {
                section = i
                break
            }
        }
        self.tableViewAccordion.toggleSection(section)
        let gymsChosenStatus = GlobalVariables.sharedInstance.gymsChosen.index(of: self.currentInventoryNames[section])
        if gymsChosenStatus != nil {
            print(GlobalVariables.sharedInstance.gymsChosen)
            var set1:Set<String> = Set(Array(GlobalVariables.sharedInstance.currentInventoryList.keys))
            set1 = set1.subtracting(GlobalVariables.sharedInstance.gymsChosen)
            set1 = set1.subtracting(["Calculator only"])
            let set1Array = [String](set1)
            print(set1Array)
            GlobalVariables.sharedInstance.gymsChosen.remove(at: gymsChosenStatus!)
            if set1Array.count > 0 {
                GlobalVariables.sharedInstance.gymsChosen.append(set1Array[0])
            }
            print(GlobalVariables.sharedInstance.gymsChosen)
            var shortcutArray: [UIApplicationShortcutItem] = [UIApplicationShortcutItem(type: "calculatorOnlyItem", localizedTitle: NSLocalizedString("Calculator only", comment: ""), localizedSubtitle: "", icon: .none, userInfo: nil)]
            if GlobalVariables.sharedInstance.gymsChosen.count >= 1 {
                let shortcut2 = UIApplicationShortcutItem(type: "gymIndex0", localizedTitle: GlobalVariables.sharedInstance.gymsChosen[0], localizedSubtitle: "", icon: .none, userInfo: nil)
                shortcutArray.append(shortcut2)
            }
            if GlobalVariables.sharedInstance.gymsChosen.count >= 2 {
                let shortcut3 = UIApplicationShortcutItem(type: "gymIndex1", localizedTitle: GlobalVariables.sharedInstance.gymsChosen[1], localizedSubtitle: "", icon: .none, userInfo: nil)
                shortcutArray.append(shortcut3)
            }
            if GlobalVariables.sharedInstance.gymsChosen.count >= 3 {
                let shortcut4 = UIApplicationShortcutItem(type: "gymIndex2", localizedTitle: GlobalVariables.sharedInstance.gymsChosen[2], localizedSubtitle: "", icon: .none, userInfo: nil)
                shortcutArray.append(shortcut4)
            }
            UIApplication.shared.shortcutItems = shortcutArray

        }
        self.currentInventoryNames.remove(at: section)
        self.currentInventoryUnits.remove(at: section)
        self.currentInventoryValues.remove(at: section)
        self.currentInventoryUnitsFormatter.remove(at: section)
        self.currentPlates.remove(at: section)

        let delayTime = DispatchTime.now() + Double(Int64(0.35 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            self.tableViewAccordion.reloadData()
        }
        self.updateGlobals()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if currentInventoryNames[section] == "Calculator only" {
            return GlobalVariables.sharedInstance.currentPlates.count + 3 - 1
        }
        else {
            return GlobalVariables.sharedInstance.currentPlates.count + 3
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 44.0;
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return self.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return self.tableView(tableView, heightForHeaderInSection:section)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: AccordionHeaderView.kAccordionHeaderViewReuseIdentifier) as! AccordionHeaderView
        header.headerLabel.text = currentInventoryNames[section]
        print(currentInventoryNames[section])
        if currentInventoryNames[section] == "Calculator only" {
            print("Calculator only is shit")
            print(NSLocalizedString("Calculator only", comment: ""))
            header.headerLabel.text = NSLocalizedString("Calculator only", comment: "")
        }
        header.headerLabel!.adjustsFontSizeToFitWidth = true
        header.headerLabel!.allowsDefaultTighteningForTruncation = true
        header.headerLabel.font = GlobalVariables.sharedInstance.fontStandard
        header.headerLabel.textColor = GlobalVariables.sharedInstance.defaultTextColor
        header.contentView.backgroundColor = UIColor.clear
        return header
    }

    func tableView(_ tableView: FZAccordionTableView, willOpenSection section: Int, withHeader header: UITableViewHeaderFooterView?) {
    }

    func keyboardWillHide(_ sender: Notification) {
        var section = 0
        for i in 0...tableViewAccordion.numberOfSections-1 {
            if tableViewAccordion.isSectionOpen(i) == true {
                section = i
                break
            }
        }
        self.tableViewAccordion.headerView(forSection: section)?.isUserInteractionEnabled = true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        var section = 0
        for i in 0...tableViewAccordion.numberOfSections-1 {
            if tableViewAccordion.isSectionOpen(i) == true {
                section = i
                break
            }
        }
        self.tableViewAccordion.headerView(forSection: section)?.isUserInteractionEnabled = false
        textValueTemp = textField.text!
    }


    override func viewDidDisappear(_ animated: Bool) {
        delegate!.presentCustomizedPrompt()
        PublicClasses.wcSendAllImportantGlobals()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        var section = 0
        for i in 0...tableViewAccordion.numberOfSections-1 {
            if tableViewAccordion.isSectionOpen(i) == true {
                section = i
                break
            }
        }

        var placeholderText = textField.text
        let currentGymIndexFromGlobal = currentInventoryNames.index(of: GlobalVariables.sharedInstance.currentInventoryName)
        placeholderText = placeholderText!.trimmingCharacters(in: CharacterSet.whitespaces)
        if placeholderText != textValueTemp {
            if placeholderText?.characters.count == 0 {
                placeholderText = findNextName()
            }
            if placeholderText == "Calculator only" {
                placeholderText = findNextName()
            }
            if section == currentGymIndexFromGlobal {
                GlobalVariables.sharedInstance.currentInventoryName = placeholderText!
            }
            currentInventoryNames[section] = placeholderText!
            textField.text = placeholderText
            self.tableViewAccordion.reloadData()
            self.updateGlobals()
        }
        textValueTemp = ""
        self.tableViewAccordion.headerView(forSection: section)?.isUserInteractionEnabled = true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }


    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { // return NO to not change text
        var result = true
        GlobalVariables.sharedInstance.keyPadUsedNow = false
        let prospectiveText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if string.characters.count > 0 {
            let disallowedCharacterSet = CharacterSet(charactersIn: "%")
            let replacementStringIsLegal = string.rangeOfCharacter(from: disallowedCharacterSet) == nil
            let resultingStringLengthIsLegal = prospectiveText.characters.count <= 45
            result = replacementStringIsLegal && resultingStringLengthIsLegal
        }
        return result
    }


    func tableView(_ tableView: FZAccordionTableView, didOpenSection section: Int, withHeader header: UITableViewHeaderFooterView?) {
        let indexPathZero = IndexPath(row: 0, section: section)
        if self.tableViewAccordion.cellForRow(at: indexPathZero) != nil {
            self.tableViewAccordion.scrollToRow(at: indexPathZero, at: UITableViewScrollPosition.top, animated: true)
        }
    }

    func tableView(_ tableView: FZAccordionTableView, willCloseSection section: Int, withHeader header: UITableViewHeaderFooterView?) {

    }

    func tableView(_ tableView: FZAccordionTableView, didCloseSection section: Int, withHeader header: UITableViewHeaderFooterView?) {

    }

    func tableView(_ tableView: FZAccordionTableView, canInteractWithHeaderAtSection section: Int) -> Bool {
        return true
    }


    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InventoryAdvancedSettings.kTableViewCellReuseIdentifier, for: indexPath) as! GymAdvancedSettingTableViewCell
        cell.contentView.alpha = 1
        cell.backgroundColor = UIColor.clear
        cell.leftLabel.adjustsFontSizeToFitWidth = true
        cell.leftLabel.allowsDefaultTighteningForTruncation = true
        cell.removeButton.titleLabel?.adjustsFontSizeToFitWidth = true
        cell.removeButton.titleLabel?.allowsDefaultTighteningForTruncation = true
        let row = (indexPath as NSIndexPath).row
        let section = (indexPath as NSIndexPath).section
        let rowCountPerSection = GlobalVariables.sharedInstance.currentPlates.count + 3 - 1
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.tag = row
        if row == 1 {
            cell.segmentedControl = UISegmentedControl(items: [PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.kilogram), PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.pound)])
            cell.segmentedControl.layer.cornerRadius = 0.5 * cell.segmentedControl.bounds.size.height
            if currentInventoryUnits[section] == "Kg" {
                cell.segmentedControl.selectedSegmentIndex = 0
            }
            else {
                cell.segmentedControl.selectedSegmentIndex = 1
            }
            cell.contentView.addSubview(cell.segmentedControl)
            let trailingsegmentedControl = NSLayoutConstraint(item: cell.segmentedControl, attribute: .trailing, relatedBy: .equal, toItem: cell.contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0)
            let leadingnameTextField = NSLayoutConstraint(item: cell.segmentedControl, attribute: .leading, relatedBy: .equal, toItem: cell.contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 0)
            let centerYsegmentedControl = NSLayoutConstraint(item: cell.segmentedControl, attribute: .centerY, relatedBy: .equal, toItem: cell.contentView, attribute: .centerY, multiplier: 1, constant: 0)
            cell.segmentedControl.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([trailingsegmentedControl, leadingnameTextField, centerYsegmentedControl])
            cell.segmentedControl.layer.cornerRadius = 0.5 * cell.segmentedControl.bounds.size.height
            cell.segmentedControl.addTarget(self, action: #selector(InventoryAdvancedSettings.segmentValueChanged(_:)), for: .valueChanged )
        }
        else if row == 0 {
            cell.contentView.addSubview(cell.titleTextField)
            cell.titleTextField.delegate = self
            cell.titleTextField.keyboardType = UIKeyboardType.alphabet
            cell.titleTextField.frame = cell.contentView.frame
            cell.leftLabel.frame = cell.contentView.frame
            cell.titleTextField.alpha = 1
            cell.leftLabel.alpha = 1
            cell.titleTextField.text = currentInventoryNames[section]
            cell.titleTextField.font = GlobalVariables.sharedInstance.fontStandard
            cell.leftLabel.font = GlobalVariables.sharedInstance.fontStandard
            cell.leftLabel.textColor = GlobalVariables.sharedInstance.defaultTextColor
            cell.titleTextField.textColor = GlobalVariables.sharedInstance.defaultTextColor
            cell.titleTextField.placeholderFont = GlobalVariables.sharedInstance.fontStandard
            cell.titleTextField.placeholderColor = GlobalVariables.sharedInstance.placeholderColor
            cell.titleTextField.lineColor = GlobalVariables.sharedInstance.secondaryColor
            cell.titleTextField.selectedLineColor = GlobalVariables.sharedInstance.secondaryColor
            cell.titleTextField.titleLabel.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            cell.titleTextField.setTitleVisible(false)
            cell.leftLabel.text = NSLocalizedString("Name:", comment: "")
            cell.leftLabel.font = GlobalVariables.sharedInstance.fontStandard
            cell.leftLabel.textColor = GlobalVariables.sharedInstance.defaultTextColor
            cell.leftLabel.adjustsFontSizeToFitWidth = true
            cell.leftLabel.textAlignment = NSTextAlignment.left
            if currentInventoryNames[section] == "Calculator only" {
                cell.titleTextField.text = NSLocalizedString("Calculator only", comment: "")
                cell.titleTextField.isEnabled = false
                cell.titleTextField.textColor = GlobalVariables.sharedInstance.placeholderColor
                cell.titleTextField.lineColor = GlobalVariables.sharedInstance.placeholderColor
                cell.titleTextField.titleColor = GlobalVariables.sharedInstance.placeholderColor
                cell.titleTextField.tintColor = GlobalVariables.sharedInstance.placeholderColor
                cell.titleTextField.selectedLineColor = GlobalVariables.sharedInstance.placeholderColor
            }

            let leadingnameTextField = NSLayoutConstraint(item: cell.titleTextField, attribute: .leading, relatedBy: .equal, toItem: cell.contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 0)
            let trailingsegmentedControl = NSLayoutConstraint(item: cell.titleTextField, attribute: .trailing, relatedBy: .equal, toItem: cell.contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0)
            let centerYnametitleTextField = NSLayoutConstraint(item: cell.titleTextField, attribute: .centerY, relatedBy: .equal, toItem: cell.contentView, attribute: .centerY, multiplier: 1, constant: -6)
            let heightTitleTextField = NSLayoutConstraint(item: cell.titleTextField, attribute: .height, relatedBy: .equal, toItem: cell.contentView, attribute: .height, multiplier: 1, constant: 0)
            cell.titleTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([leadingnameTextField,trailingsegmentedControl, centerYnametitleTextField, heightTitleTextField])
            cell.leftLabel.tag = row
            cell.titleTextField.tag = row
            cell.leftLabel.sizeToFit()
        }
        else if row == rowCountPerSection {
            cell.contentView.addSubview(cell.removeButton)
            cell.removeButton.titleLabel?.font = GlobalVariables.sharedInstance.fontStandard
            cell.removeButton.frame = cell.contentView.frame
            cell.removeButton.titleLabel?.adjustsFontSizeToFitWidth = true
            //            cell.removeButton.backgroundColor = GlobalVariables.sharedInstance.secondaryColor
            cell.removeButton.setTitle(NSLocalizedString("Delete", comment: ""), for: UIControlState())
            //            cell.removeButton.setTitleColor(GlobalVariables.sharedInstance.secondaryTextColor, forState: .Normal)
            cell.removeButton.setTitleColor(GlobalVariables.sharedInstance.errorColor, for: .normal)
            cell.removeButton.setTitleColor(GlobalVariables.sharedInstance.placeholderColor, for: .highlighted)
            cell.removeButton.setTitleColor(GlobalVariables.sharedInstance.placeholderColor, for: .disabled)
            cell.removeButton.titleLabel?.adjustsFontSizeToFitWidth = true
            cell.removeButton.titleLabel?.allowsDefaultTighteningForTruncation = true
            let leadingnameTextField = NSLayoutConstraint(item: cell.removeButton, attribute: .leading, relatedBy: .equal, toItem: cell.contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 0)
            let trailingsegmentedControl = NSLayoutConstraint(item: cell.removeButton, attribute: .trailing, relatedBy: .equal, toItem: cell.contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0)
            let centerYnameleftLabel = NSLayoutConstraint(item: cell.removeButton, attribute: .centerY, relatedBy: .equal, toItem: cell.contentView, attribute: .centerY, multiplier: 1, constant: 0)
            let heightConstraint = NSLayoutConstraint(item: cell.removeButton, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 34)
            cell.removeButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([heightConstraint, centerYnameleftLabel, leadingnameTextField, trailingsegmentedControl])
            cell.removeButton.addTarget(self, action: #selector(InventoryAdvancedSettings.removeButtonAction(_:)), for: UIControlEvents.touchUpInside)
            if currentInventoryNames[section] == "Calculator only" {
                cell.removeButton.isEnabled = false
            }
        }
        else {
            let index = row - 2
            cell.stepperControl = UIStepper()
            cell.leftLabel = UILabel.init(frame: cell.contentView.frame)
            cell.plateCountLabel = UILabel.init(frame: cell.contentView.frame)
            cell.leftLabel.text = PublicClasses.massFormatter.string(fromValue: currentPlates[section][index], unit: currentInventoryUnitsFormatter[section])
            cell.contentView.addSubview(cell.leftLabel)
            cell.contentView.addSubview(cell.plateCountLabel)
            cell.contentView.addSubview(cell.stepperControl)
            cell.stepperControl.maximumValue = 20
            cell.stepperControl.minimumValue = 0
            if currentInventoryNames[section] == "Calculator only" {
                cell.stepperControl.stepValue = 20
//                cell.plateCountLabel.text = NSLocalizedString("Enabled", comment: "")
//                if Double(currentInventoryValues[section][index]) == 20 {
//                    cell.plateCountLabel.text = NSLocalizedString("Enabled", comment: "")
//                }
//                else if Double(currentInventoryValues[section][index]) == 0 {
//                    cell.plateCountLabel.text = NSLocalizedString("Disabled", comment: "")
//                }
            }
            else {
                cell.stepperControl.stepValue = 2
                cell.plateCountLabel.text = PublicClasses.numberFormatterDecimal.string(from: Double(currentInventoryValues[section][index]) as NSNumber)
            }
            cell.stepperControl.value = Double(currentInventoryValues[section][index])
            cell.leftLabel.font = GlobalVariables.sharedInstance.fontStandard
            cell.leftLabel.textColor = GlobalVariables.sharedInstance.defaultTextColor
            cell.leftLabel.adjustsFontSizeToFitWidth = true
            cell.leftLabel.textAlignment = NSTextAlignment.left
            cell.plateCountLabel.font = GlobalVariables.sharedInstance.fontStandard
            cell.plateCountLabel.textColor = GlobalVariables.sharedInstance.defaultTextColor
            cell.plateCountLabel.adjustsFontSizeToFitWidth = true
            cell.plateCountLabel.textAlignment = NSTextAlignment.right
            if Double(currentInventoryValues[section][index]) == 0 {
                cell.plateCountLabel.text = ""
                cell.leftLabel.textColor = GlobalVariables.sharedInstance.placeholderColor
            }
            let trailingsegmentedControl = NSLayoutConstraint(item: cell.stepperControl, attribute: .trailing, relatedBy: .equal, toItem: cell.contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0)
            let leadingnameTextField = NSLayoutConstraint(item: cell.leftLabel, attribute: .leading, relatedBy: .equal, toItem: cell.contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 0)
            let spaceBetweenTextFields = NSLayoutConstraint(item: cell.plateCountLabel, attribute: .trailing, relatedBy: .equal, toItem: cell.stepperControl, attribute: .leading, multiplier: 1.0, constant: -10)
            let spaceBetweenleftLabelPlateCountLabelFields = NSLayoutConstraint(item: cell.leftLabel, attribute: .trailing, relatedBy: .equal, toItem: cell.plateCountLabel, attribute: .leading, multiplier: 1.0, constant: -10)
            let centerYnameleftLabel = NSLayoutConstraint(item: cell.leftLabel, attribute: .centerY, relatedBy: .equal, toItem: cell.contentView, attribute: .centerY, multiplier: 1, constant: 0)
            let centerYsegmentedControl = NSLayoutConstraint(item: cell.stepperControl, attribute: .centerY, relatedBy: .equal, toItem: cell.contentView, attribute: .centerY, multiplier: 1, constant: 0)
            let centerYplateCountLabel = NSLayoutConstraint(item: cell.plateCountLabel, attribute: .centerY, relatedBy: .equal, toItem: cell.contentView, attribute: .centerY, multiplier: 1, constant: 0)
                        let leftLabelWidth = NSLayoutConstraint(item: cell.leftLabel, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: .none, attribute: .width, multiplier: 1, constant: 10)
            cell.leftLabel.translatesAutoresizingMaskIntoConstraints = false
            cell.stepperControl.translatesAutoresizingMaskIntoConstraints = false
            cell.plateCountLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([trailingsegmentedControl, spaceBetweenleftLabelPlateCountLabelFields, spaceBetweenTextFields, centerYplateCountLabel, centerYsegmentedControl, centerYnameleftLabel, leadingnameTextField, leftLabelWidth])
            cell.leftLabel.tag = row
            cell.plateCountLabel.tag = row
            cell.stepperControl.tag = row
            cell.leftLabel.sizeToFit()
            cell.plateCountLabel.sizeToFit()
            cell.stepperControl.sizeToFit()
            cell.stepperControl.addTarget(self, action: #selector(InventoryAdvancedSettings.stepperValueChanged(_:)), for: .valueChanged)
        }
        return cell
    }
    
}
