//
//  BarbellAdvancedSettings.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 6/20/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class BarbellAdvancedSettings: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    let textCellIdentifier = "TextCell"
    weak var delegate: MainDelegate?
    var needToUploadChanges = false
    var sortedAlready = false
    var currentBarNames: [String] = [String]()
    var currentBarUnits: [String] = [String]()
    var currentBarValues: [Double] = [Double]()
    #if os(iOS)
    var cellHeight: CGFloat = 88
    #elseif os(tvOS)
    var cellHeight: CGFloat = 230
    #endif
    var addLabel = UILabel()
    func segmentedControlSwitched(_ index: Int, tag: Int) {
        self.view.endEditing(true)
        let cell = tableView(self.tableView, cellForRowAt: IndexPath(row: tag, section: 0)) as! BarbellAdvancedSettingTableViewCell
        var placeholderText = cell.valueTextField.text
        placeholderText = PublicClasses.removeUnitsFromText(placeholderText!)
        if index == 0 {
            currentBarUnits[tag] = "Kg"
            currentBarValues[cell.tag] = PublicClasses.numberFormatterDecimal.number(from: placeholderText!)!.doubleValue
                .roundToPlaces(GlobalVariables.sharedInstance.kgDecimalPlaces)
            cell.valueTextField.text = PublicClasses.massFormatter.string(fromValue: currentBarValues[cell.tag], unit: MassFormatter.Unit.kilogram)
        }
        else if index == 1 {
            currentBarUnits[tag] = "lbs"
            currentBarValues[cell.tag] = PublicClasses.numberFormatterDecimal.number(from: placeholderText!)!.doubleValue.roundToPlaces(GlobalVariables.sharedInstance.lbDecimalPlaces)
            cell.valueTextField.text = PublicClasses.massFormatter.string(fromValue: currentBarValues[cell.tag], unit: MassFormatter.Unit.pound)
        }
        GlobalVariables.sharedInstance.barbellsListUnits[currentBarNames[tag]] = currentBarUnits[tag]
        updateGlobals()
        self.tableView.reloadData()
    }


    @IBAction func doneButtonAction(_ sender: AnyObject) {
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }

    func findNextName() -> String {
        var minNum = 1
        var numArray: [Int] = [Int]()
        if currentBarNames.count > 0 {
            for i in 0...currentBarNames.count-1 {
                let barbellNameToSplit: String = currentBarNames[i]
                let barbellSubstring = NSLocalizedString("Barbell", comment: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                if barbellNameToSplit.characters.count >= barbellSubstring.characters.count {
                    let substringTest = "\(barbellNameToSplit.substring(with: barbellSubstring.startIndex..<barbellSubstring.endIndex))".trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                    let index = currentBarNames[i].replacingOccurrences(of: barbellSubstring, with: "", options: NSString.CompareOptions.literal, range: nil).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                    if substringTest == barbellSubstring && Int(index) != nil {
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
        return "\(NSLocalizedString("Barbell", comment: "")) \(minNum)"
    }

    @IBAction func addButtonAction(_ sender: AnyObject) {
addButtonRunner()
    }

    func addButtonRunner() {
        if currentBarNames.count < 8 {
            currentBarNames += [findNextName()]
            currentBarValues += [0]
            let isMetric: Bool = Locale.current.usesMetricSystem
            if isMetric == true {
                currentBarUnits += ["Kg"]
            }
            else if isMetric == false {
                currentBarUnits += ["lbs"]
            }
            self.tableView.reloadData()
        }
        updateGlobals()
    }
    func updateGlobals() {
        needToUploadChanges = true
        let oldBarName = GlobalVariables.sharedInstance.currentBarName
        let oldBarbellWeight = GlobalVariables.sharedInstance.currentBarWeight

        var newBarbellSet: [String: Double] = [String: Double]()
        var newBarbellSetUnits: [String: String] = [String: String]()
        var newBarbellSetValue: [String: Double] = [String: Double]()
        if currentBarNames.count > 0 {
            for i in 0...currentBarNames.count-1 {
                newBarbellSet[currentBarNames[i]] = currentBarValues[i]
                newBarbellSetUnits[currentBarNames[i]] = currentBarUnits[i]
            }
        }
        newBarbellSet["No barbell"] = 0
        newBarbellSetUnits["No barbell"] = "lbs"
        newBarbellSetValue["No barbell"] = 0
        if newBarbellSet.count <= 1 || newBarbellSet[oldBarName] == nil {
            GlobalVariables.sharedInstance.currentBarName = "No barbell"
            GlobalVariables.sharedInstance.currentBarWeight = newBarbellSet["No barbell"]!
        }
        for i in currentBarNames {
            newBarbellSetValue[i] = newBarbellSet[i]!
        }
        GlobalVariables.sharedInstance.currentBarbellSet = newBarbellSet
        GlobalVariables.sharedInstance.barbellsList = newBarbellSetValue
        GlobalVariables.sharedInstance.barbellsListUnits = newBarbellSetUnits
        if GlobalVariables.sharedInstance.units == "Kg" {
            var barbellsNew: [String: Double] = [String: Double]()
            for (key,value) in GlobalVariables.sharedInstance.barbellsList {
                if GlobalVariables.sharedInstance.barbellsListUnits[key] == "Kg" {
                    barbellsNew[key] = value.roundToPlaces(GlobalVariables.sharedInstance.kgDecimalPlaces)
                }
                else {
                    barbellsNew[key] = (value * 0.453592).roundToPlaces(GlobalVariables.sharedInstance.kgDecimalPlaces)
                }
            }
            GlobalVariables.sharedInstance.currentBarbellSet = barbellsNew
        }
        else {
            var barbellsNew: [String: Double] = [String: Double]()
            for (key,value) in GlobalVariables.sharedInstance.barbellsList {
                if GlobalVariables.sharedInstance.barbellsListUnits[key] == "Kg" {
                    barbellsNew[key] = (value / 0.453592).roundToPlaces(GlobalVariables.sharedInstance.lbDecimalPlaces)
                }
                else {
                    barbellsNew[key] = value.roundToPlaces(GlobalVariables.sharedInstance.lbDecimalPlaces)
                }
            }
            GlobalVariables.sharedInstance.currentBarbellSet = barbellsNew
        }
        GlobalVariables.sharedInstance.currentBarWeight = GlobalVariables.sharedInstance.currentBarbellSet[GlobalVariables.sharedInstance.currentBarName]!
        GlobalVariables.sharedInstance.weightToLift = GlobalVariables.sharedInstance.weightToLift - oldBarbellWeight + GlobalVariables.sharedInstance.currentBarWeight
        self.delegate?.updatePageProtocol()
        DataAccess.sharedInstance.saveEverything()
        #if os(iOS)
            PublicClasses.wcSendArrayOfStrings(["currentBarName","currentBarbellSet","currentBarWeight","barbellsList","barbellsListUnits","units"])
        #endif
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
        return false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        #if os(iOS)
        self.hideKeyboardWhenTappedAround()
        let bigLabel: UILabel = UILabel()
        bigLabel.text = NSLocalizedString("Barbells", comment: "")
        bigLabel.backgroundColor = UIColor.clear
        bigLabel.textColor = GlobalVariables.sharedInstance.secondaryTextColor
        bigLabel.font = GlobalVariables.sharedInstance.fontTitle!
        bigLabel.adjustsFontSizeToFitWidth = true
        bigLabel.sizeToFit()
        navigationController?.navigationBar.setTitleVerticalPositionAdjustment(GlobalVariables.sharedInstance.titleVerticalAdjustment, for: .default)
        self.tableView.superview?.backgroundColor = UIColor.white
        self.navigationItem.titleView = bigLabel;
        self.tableView.delaysContentTouches = false
        self.view.layoutSubviews()
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([ NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard], for: UIControlState.normal)
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([ NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard], for: UIControlState.normal)
        navigationItem.rightBarButtonItem?.tintColor = GlobalVariables.sharedInstance.mainColor
        navigationItem.leftBarButtonItem?.tintColor = GlobalVariables.sharedInstance.mainColor
        navigationController!.navigationBar.barTintColor = GlobalVariables.sharedInstance.secondaryColor
        #endif
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.rowHeight = cellHeight
        tableView.delegate = self
        tableView.dataSource = self
            NotificationCenter.default.addObserver(self, selector: #selector(dismissHere), name: NSNotification.Name(rawValue: "Reset Pages"), object: nil)
        }
        @objc func dismissHere() {
            dismiss(animated: true, completion: nil)
        }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sortedAlready == false {
            for keys in GlobalVariables.sharedInstance.barbellsList.keys.sorted(by: {$0 < $1}) {
                if keys != "No barbell" {
                    currentBarNames += [keys]
                    currentBarValues += [GlobalVariables.sharedInstance.barbellsList[keys]!]
                    currentBarUnits += [GlobalVariables.sharedInstance.barbellsListUnits[keys]!]
                }
            }
            sortedAlready = true
        }
        if currentBarNames.count == 0 {
            #if os(iOS)
            self.tableView.isScrollEnabled = false
            addLabel = UILabel(frame: self.view.bounds)
            self.view.addSubview(addLabel)
            addLabel.numberOfLines = 2
            addLabel.text = NSLocalizedString("Add a barbell", comment: "")
            addLabel.textAlignment = NSTextAlignment.center
            addLabel.font = GlobalVariables.sharedInstance.fontAddX
            addLabel.textColor = GlobalVariables.sharedInstance.secondaryColor
            addLabel.sizeToFit()
            addLabel.adjustsFontSizeToFitWidth = true
            addLabel.tag = 91248124
            addLabel.alpha = 0
            UIView.transition(with: addLabel, duration: GlobalVariables.sharedInstance.platesFadeDuration, options: [.transitionCrossDissolve], animations: {
                self.addLabel.alpha = 1
                //                self.tableView.alpha = 0
                }, completion: nil)
            let addLabelVerticalContraints = NSLayoutConstraint(item: addLabel, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: -44)
            let addLabelHorizontalContraints = NSLayoutConstraint(item: addLabel, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
            let addLabelWidth = NSLayoutConstraint(item: addLabel, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.9, constant: 0)
            addLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([addLabelVerticalContraints,addLabelHorizontalContraints,addLabelWidth])
            #endif
        }
        else {
            self.tableView.isScrollEnabled = true
            for view in self.view.subviews {
                if view.tag == 91248124 {
                    UIView.transition(with: view, duration: GlobalVariables.sharedInstance.platesFadeDuration, options: [.transitionCrossDissolve], animations: {
                        view.alpha = 0
                        }, completion: { (finished: Bool) -> Void in
                            view.removeFromSuperview()
                    })
                }
            }
        }
        #if os(iOS)
            return currentBarNames.count
        #else
            return currentBarNames.count + 2
        #endif
    }

    #if os(iOS)
    func keyboardWillShow(_ notification: Notification) {
        if let userInfo = (notification as NSNotification).userInfo {
            if let keyboardSize: CGSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size {
                let contentInset = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height,  0.0);
                self.tableView.contentInset = contentInset
                self.tableView.scrollIndicatorInsets = contentInset

                self.tableView.contentOffset = CGPoint(x: self.tableView.contentOffset.x, y: 0 + keyboardSize.height) //set zero instead self.scrollView.contentOffset.y

            }
        }
    }

    func keyboardWillHide(_ notification: Notification) {
        if let userInfo = (notification as NSNotification).userInfo {
            if let _: CGSize =  (userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size {
                let contentInset = UIEdgeInsets.zero;
                self.tableView.contentInset = contentInset
                self.tableView.scrollIndicatorInsets = contentInset
                self.tableView.contentOffset = CGPoint(x: self.tableView.contentOffset.x, y: self.tableView.contentOffset.y)
            }
        }
    }
    #endif


    #if os(tvOS)
    override func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row >= currentBarNames.count {
            return true
        }
    return false
    }
    #endif


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            currentBarNames.remove(at: (indexPath as NSIndexPath).row)
            currentBarValues.remove(at: (indexPath as NSIndexPath).row)
            currentBarUnits.remove(at: (indexPath as NSIndexPath).row)
            updateGlobals()
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        let row = (indexPath as NSIndexPath).row
        if currentBarNames[row] != "No barbell"  {
            return UITableViewCellEditingStyle.delete
        }
        return UITableViewCellEditingStyle.none
    }


    @objc func segmentValueChanged(_ sender: UISegmentedControl) {
        segmentedControlSwitched(sender.selectedSegmentIndex, tag: sender.tag)
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 1 {
        }
        else if textField.tag == 2 {
            let placeholderText = textField.text
            if placeholderText?.characters.count > 0 {
                textField.text = PublicClasses.removeUnitsFromText(placeholderText!)
            }
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        var placeholderText = textField.text
        let cell = textField.superview?.superview as! BarbellAdvancedSettingTableViewCell
        let row = cell.tag
        let oldBarName = currentBarNames[row]
        let currentBarIndexFromGlobal = currentBarNames.index(of: GlobalVariables.sharedInstance.currentBarName)
        if textField.tag == 1 {
            placeholderText = placeholderText!.trimmingCharacters(in: CharacterSet.whitespaces)
            if placeholderText?.characters.count == 0 {
                placeholderText = findNextName()
            }
            if placeholderText == "No barbell" {
                placeholderText = "No barbells"
            }
            if row == currentBarIndexFromGlobal {
                let oldCurrentBarbellSetSpot = GlobalVariables.sharedInstance.currentBarbellSet[oldBarName]
                let oldBarbellsListSpot = GlobalVariables.sharedInstance.barbellsList[oldBarName]
                let oldBarbellsListUnitsSpot = GlobalVariables.sharedInstance.barbellsListUnits[oldBarName]
                GlobalVariables.sharedInstance.currentBarbellSet.removeValue(forKey: oldBarName)
                GlobalVariables.sharedInstance.barbellsList.removeValue(forKey: oldBarName)
                GlobalVariables.sharedInstance.barbellsListUnits.removeValue(forKey: oldBarName)
                GlobalVariables.sharedInstance.currentBarName = placeholderText!
                GlobalVariables.sharedInstance.currentBarbellSet[GlobalVariables.sharedInstance.currentBarName] = oldCurrentBarbellSetSpot
                GlobalVariables.sharedInstance.barbellsList[GlobalVariables.sharedInstance.currentBarName] = oldBarbellsListSpot
                GlobalVariables.sharedInstance.barbellsListUnits[GlobalVariables.sharedInstance.currentBarName] = oldBarbellsListUnitsSpot
            }
            currentBarNames[row] = placeholderText!
            textField.text = placeholderText
        }
        else if textField.tag == 2 {
            if placeholderText?.characters.count > 0 {
                currentBarValues[row] = PublicClasses.numberFormatterDecimal.number(from: textField.text!)!.doubleValue
                placeholderText = PublicClasses.removeUnitsFromText(placeholderText!)
                let index = cell.segmentedControl.selectedSegmentIndex
                if index == 0 {
                    currentBarUnits[row] = "Kg"
                    currentBarValues[row] = PublicClasses.numberFormatterDecimal.number(from: placeholderText!)!.doubleValue.roundToPlaces(GlobalVariables.sharedInstance.kgDecimalPlaces)
                    cell.valueTextField.text = PublicClasses.massFormatter.string(fromValue: currentBarValues[cell.tag], unit: MassFormatter.Unit.kilogram)
                }
                else if index == 1 {
                    currentBarUnits[row] = "lbs"
                    currentBarValues[row] = PublicClasses.numberFormatterDecimal.number(from: placeholderText!)!.doubleValue.roundToPlaces(GlobalVariables.sharedInstance.lbDecimalPlaces)
                    cell.valueTextField.text = PublicClasses.massFormatter.string(fromValue: currentBarValues[cell.tag], unit: MassFormatter.Unit.pound)
                }
            }
            else {
                textField.text = "0"
                currentBarValues[row] = 0
            }
        }
        self.updateGlobals()
    }


    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { // return NO to not change text
        var result = true
        if textField.tag == 1 {
            GlobalVariables.sharedInstance.keyPadUsedNow = false
            let prospectiveText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            if string.characters.count > 0 {
                let disallowedCharacterSet = CharacterSet(charactersIn: "%")
                let replacementStringIsLegal = string.rangeOfCharacter(from: disallowedCharacterSet) == nil
                let resultingStringLengthIsLegal = prospectiveText.characters.count <= 40
                result = replacementStringIsLegal && resultingStringLengthIsLegal
            }
        }
        else if textField.tag == 2 {
            var maxDecimalPlaces = 2
            let cell = textField.superview?.superview as! BarbellAdvancedSettingTableViewCell
            let unitSelected = cell.segmentedControl.titleForSegment(at: cell.segmentedControl.selectedSegmentIndex)!
            let unitToPass: MassFormatter.Unit = MassFormatter.Unit.kilogram
            if unitSelected == PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.pound) {
                maxDecimalPlaces = GlobalVariables.sharedInstance.lbDecimalPlaces
            }
            else if unitSelected == PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.kilogram) {
                maxDecimalPlaces = GlobalVariables.sharedInstance.kgDecimalPlaces
            }
            result = PublicClasses.textFieldDecimalVerification(textField, range: range, string: string, maxDecimalPlaces: maxDecimalPlaces, maxIntegerPlaces: 3, unit: unitToPass, percentageMode: GlobalVariables.sharedInstance.percentageModeActive)
        }
        return result
    }

    override func viewDidDisappear(_ animated: Bool) {
        #if os(iOS)
            delegate!.presentCustomizedPrompt()
        #endif
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = (indexPath as NSIndexPath).row
        print(row)
        if row <= currentBarNames.count-1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! BarbellAdvancedSettingTableViewCell
        cell.tag = row
//            cell.valueTextField.hidden = true
        cell.nameTextField.text = NSLocalizedString(currentBarNames[row], comment: "")
        cell.valueTextField.text = PublicClasses.numberFormatterDecimal.string(from: currentBarValues[row] as NSNumber)
            cell.nameTextField.placeholder = NSLocalizedString("Barbell name", comment: "")
            cell.valueTextField.placeholder = NSLocalizedString("Barbell weight", comment: "")
        #if os(iOS)
            cell.nameTextField.placeholderFont = GlobalVariables.sharedInstance.fontStandard
            cell.nameTextField.placeholderColor = GlobalVariables.sharedInstance.placeholderColor
            cell.nameTextField.lineColor = GlobalVariables.sharedInstance.secondaryColor
            cell.nameTextField.selectedLineColor = GlobalVariables.sharedInstance.secondaryColor
            cell.valueTextField.placeholderFont = GlobalVariables.sharedInstance.fontStandard
            cell.valueTextField.placeholderColor = GlobalVariables.sharedInstance.placeholderColor
            cell.valueTextField.lineColor = GlobalVariables.sharedInstance.secondaryColor
            cell.valueTextField.selectedLineColor = GlobalVariables.sharedInstance.secondaryColor
            cell.nameTextField.title = ""
            cell.valueTextField.title = ""
            cell.nameTextField.setTitleVisible(false)
            cell.valueTextField.setTitleVisible(false)
        #endif
        if currentBarUnits[row] == "Kg" {
            cell.segmentedControl.selectedSegmentIndex = 0
        }
        else {
            cell.segmentedControl.selectedSegmentIndex = 1
        }
        let unitSelected = cell.segmentedControl.titleForSegment(at: cell.segmentedControl.selectedSegmentIndex)!
        var unitToPass: MassFormatter.Unit = MassFormatter.Unit.kilogram
        if unitSelected == PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.pound) {
            unitToPass = MassFormatter.Unit.pound
        }
        else if unitSelected == PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.kilogram) {
            unitToPass = MassFormatter.Unit.kilogram
        }
        var placeholderText =  cell.valueTextField.text
        placeholderText = PublicClasses.removeUnitsFromText(placeholderText!)
        cell.valueTextField.text = PublicClasses.massFormatter.string(fromValue: PublicClasses.numberFormatterDecimal.number(from: placeholderText!)!.doubleValue, unit: unitToPass)

        cell.segmentedControl.addTarget(self, action: #selector(BarbellAdvancedSettings.segmentValueChanged(_:)), for: .valueChanged)
        cell.nameTextField.tag = 1
        cell.valueTextField.tag = 2
        cell.nameTextField.delegate = self
        cell.valueTextField.delegate = self
        cell.segmentedControl.tag = row
        cell.nameTextField.sizeToFit()
        cell.valueTextField.sizeToFit()
        cell.segmentedControl.sizeToFit()
        cell.setNeedsLayout()
            return cell
    }
        else {
            #if os(tvOS)
                let cellAddSub = tableView.dequeueReusableCell(withIdentifier: "addSubtractCell", for: indexPath) as! advancedSettingTableViewCellAddSubtract
                //                cellAddSub.addButton.addTarget(self, action: #selector(addButtonAction(_:)), forControlEvents: .PrimaryActionTriggered)
                //                cellAddSub.removeButton.addTarget(self, action: #selector(removeButtonAction), forControlEvents: .PrimaryActionTriggered)

                cellAddSub.label.textColor = GlobalVariables.sharedInstance.defaultTextColor
                cellAddSub.label.text = NSLocalizedString("Add", comment: "")
                if indexPath.row == currentBarNames.count + 1 && currentBarNames.count > 0  {
                    cellAddSub.label.textColor = GlobalVariables.sharedInstance.errorColor
                    cellAddSub.label.text = NSLocalizedString("Remove", comment: "")
                }
                return cellAddSub
            #else
                return UITableViewCell()
            #endif
        }
    }

    #if os(tvOS)
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 120
        }
        return 44
    }
    #endif

    #if os(tvOS)
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            if currentBarNames.count == 0 {
                return NSLocalizedString("Add a barbell", comment: "")
            }
            return NSLocalizedString("Edit barbells", comment: "")
        default:
            return ""
        }
    }
    #endif

    #if os(tvOS)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row >= currentBarNames.count + 1 {
            removeButtonAction()
        }
        if indexPath.row >= currentBarNames.count {
            addButtonRunner()
        }
    }
    #endif

    #if os(tvOS)
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row >= currentBarNames.count  {
            return 88
        }
        return cellHeight
    }
    #endif

    #if os(tvOS)
    func removeButtonAction() {
        self.view.endEditing(true)
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RemoveBarbellModal") as! RemoveButtonBarbell
        //            vc.modalPresentationStyle = UIModalPresentationStyle.
        //            vc.delegate = self.delegate
        //            self.presentViewController(vc, animated: true, completion:nil)
        self.show(vc, sender: self)
    }
    #endif


    override func viewWillDisappear(_ animated: Bool) {
        if needToUploadChanges == true {
        DataAccess.sharedInstance.saveEverything()
        DataAccess.sharedInstance.iCloudSave()
        }
    }
    
}
