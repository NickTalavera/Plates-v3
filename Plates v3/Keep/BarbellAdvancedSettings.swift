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
                .roundToPlaces(UnitOfWeight(unit: UnitOfWeight.unitType.kg).decimalPlaces)
            cell.valueTextField.text = PublicClasses.massFormatter.string(fromValue: currentBarValues[cell.tag], unit: MassFormatter.Unit.kilogram)
        }
        else if index == 1 {
            currentBarUnits[tag] = "lbs"
            currentBarValues[cell.tag] = PublicClasses.numberFormatterDecimal.number(from: placeholderText!)!.doubleValue.roundToPlaces(UnitOfWeight(unit: UnitOfWeight.unitType.lb).decimalPlaces)
            cell.valueTextField.text = PublicClasses.massFormatter.string(fromValue: currentBarValues[cell.tag], unit: MassFormatter.Unit.pound)
        }
//        app.profile.barbellsListUnits[currentBarNames[tag]] = currentBarUnits[tag]
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
                if barbellNameToSplit.count >= barbellSubstring.count {
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
//        needToUploadChanges = true
//        let oldBarName = app.profile.currentBarName
//        let oldBarbellWeight = app.profile.currentBarWeight
//
//        var newBarbellSet: [String: Double] = [String: Double]()
//        var newBarbellSetUnits: [String: String] = [String: String]()
//        var newBarbellSetValue: [String: Double] = [String: Double]()
//        if currentBarNames.count > 0 {
//            for i in 0...currentBarNames.count-1 {
//                newBarbellSet[currentBarNames[i]] = currentBarValues[i]
//                newBarbellSetUnits[currentBarNames[i]] = currentBarUnits[i]
//            }
//        }
//        newBarbellSet["No barbell"] = 0
//        newBarbellSetUnits["No barbell"] = "lbs"
//        newBarbellSetValue["No barbell"] = 0
//        if newBarbellSet.count <= 1 || newBarbellSet[oldBarName] == nil {
//            app.profile.currentBarName = "No barbell"
//            app.profile.currentBarWeight = newBarbellSet["No barbell"]!
//        }
//        for i in currentBarNames {
//            newBarbellSetValue[i] = newBarbellSet[i]!
//        }
//        app.profile.currentBarbellSet = newBarbellSet
//        app.profile.barbellsList = newBarbellSetValue
//        app.profile.barbellsListUnits = newBarbellSetUnits
//        if app.profile.units == "Kg" {
//            var barbellsNew: [String: Double] = [String: Double]()
//            for (key,value) in app.profile.barbellsList {
//                if app.profile.barbellsListUnits[key] == "Kg" {
//                    barbellsNew[key] = value.roundToPlaces(app.profile.kgDecimalPlaces)
//                }
//                else {
//                    barbellsNew[key] = (value * 0.453592).roundToPlaces(app.profile.kgDecimalPlaces)
//                }
//            }
//            app.profile.currentBarbellSet = barbellsNew
//        }
//        else {
//            var barbellsNew: [String: Double] = [String: Double]()
//            for (key,value) in app.profile.barbellsList {
//                if app.profile.barbellsListUnits[key] == "Kg" {
//                    barbellsNew[key] = (value / 0.453592).roundToPlaces(app.profile.lbDecimalPlaces)
//                }
//                else {
//                    barbellsNew[key] = value.roundToPlaces(app.profile.lbDecimalPlaces)
//                }
//            }
//            app.profile.currentBarbellSet = barbellsNew
//        }
//        app.profile.currentBarWeight = app.profile.currentBarbellSet[app.profile.currentBarName]!
//        app.profile.weightToLift = app.profile.weightToLift - oldBarbellWeight + app.profile.currentBarWeight
//        self.delegate?.updatePageProtocol()
//        DataAccess.sharedInstance.saveEverything()
//        #if os(iOS)
//            PublicClasses.wcSendArrayOfStrings(["currentBarName","currentBarbellSet","currentBarWeight","barbellsList","barbellsListUnits","units"])
//        #endif
    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.resignFirstResponder()
//        return false
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(false)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.hideKeyboardWhenTappedAround()
//        let bigLabel: UILabel = UILabel()
//        bigLabel.text = NSLocalizedString("Barbells", comment: "")
//        bigLabel.backgroundColor = UIColor.clear
//        bigLabel.textColor = app.visuals.secondaryTextColor
//        bigLabel.font = app.visuals.fontTitle!
//        bigLabel.adjustsFontSizeToFitWidth = true
//        bigLabel.sizeToFit()
//        navigationController?.navigationBar.setTitleVerticalPositionAdjustment(app.profile.titleVerticalAdjustment, for: .default)
//        self.tableView.superview?.backgroundColor = UIColor.white
//        self.navigationItem.titleView = bigLabel;
//        self.tableView.delaysContentTouches = false
//        self.view.layoutSubviews()
//        navigationItem.leftBarButtonItem?.setTitleTextAttributes([ NSAttributedStringKey.font: app.visuals.fontStandard], for: UIControlState.normal)
//        navigationItem.rightBarButtonItem?.setTitleTextAttributes([ NSAttributedStringKey.font: app.visuals.fontStandard], for: UIControlState.normal)
//        navigationItem.rightBarButtonItem?.tintColor = app.visuals.mainColor
//        navigationItem.leftBarButtonItem?.tintColor = app.visuals.mainColor
//        navigationController!.navigationBar.barTintColor = app.visuals.mainColor
//        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
//        self.tableView.rowHeight = cellHeight
//        tableView.delegate = self
//        tableView.dataSource = self
//            NotificationCenter.default.addObserver(self, selector: #selector(dismissHere), name: NSNotification.Name(rawValue: "Reset Pages"), object: nil)
//        }
//        @objc func dismissHere() {
//            dismiss(animated: true, completion: nil)
//        }
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if sortedAlready == false {
//            for keys in app.profile.barbellsList.keys.sorted(by: {$0 < $1}) {
//                if keys != "No barbell" {
//                    currentBarNames += [keys]
//                    currentBarValues += [GlobalVariables.sharedInstance.barbellsList[keys]!]
//                    currentBarUnits += [GlobalVariables.sharedInstance.barbellsListUnits[keys]!]
//                }
//            }
//            sortedAlready = true
//        }
//        if currentBarNames.count == 0 {
//            self.tableView.isScrollEnabled = false
//            addLabel = UILabel(frame: self.view.bounds)
//            self.view.addSubview(addLabel)
//            addLabel.numberOfLines = 2
//            addLabel.text = NSLocalizedString("Add a barbell", comment: "")
//            addLabel.textAlignment = NSTextAlignment.center
//            addLabel.font = app.visuals.fontAddX
//            addLabel.textColor = app.visuals.secondaryColor
//            addLabel.sizeToFit()
//            addLabel.adjustsFontSizeToFitWidth = true
//            addLabel.tag = 91248124
//            addLabel.alpha = 0
//            UIView.transition(with: addLabel, duration: app.visuals.platesFadeDuration, options: [.transitionCrossDissolve], animations: {
//                self.addLabel.alpha = 1
//                //                self.tableView.alpha = 0
//                }, completion: nil)
//            let addLabelVerticalContraints = NSLayoutConstraint(item: addLabel, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: -44)
//            let addLabelHorizontalContraints = NSLayoutConstraint(item: addLabel, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
//            let addLabelWidth = NSLayoutConstraint(item: addLabel, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.9, constant: 0)
//            addLabel.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([addLabelVerticalContraints,addLabelHorizontalContraints,addLabelWidth])
//        }
//        else {
//            self.tableView.isScrollEnabled = true
//            for view in self.view.subviews {
//                if view.tag == 91248124 {
//                    UIView.transition(with: view, duration: app.visuals.platesFadeDuration, options: [.transitionCrossDissolve], animations: {
//                        view.alpha = 0
//                        }, completion: { (finished: Bool) -> Void in
//                            view.removeFromSuperview()
//                    })
//                }
//            }
//        }
//            return currentBarNames.count
//    }
//
//    func keyboardWillShow(_ notification: Notification) {
//        if let userInfo = (notification as NSNotification).userInfo {
//            if let keyboardSize: CGSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size {
//                let contentInset = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height,  0.0);
//                self.tableView.contentInset = contentInset
//                self.tableView.scrollIndicatorInsets = contentInset
//
//                self.tableView.contentOffset = CGPoint(x: self.tableView.contentOffset.x, y: 0 + keyboardSize.height) //set zero instead self.scrollView.contentOffset.y
//
//            }
//        }
//    }
//
//    func keyboardWillHide(_ notification: Notification) {
//        if let userInfo = (notification as NSNotification).userInfo {
//            if let _: CGSize =  (userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size {
//                let contentInset = UIEdgeInsets.zero;
//                self.tableView.contentInset = contentInset
//                self.tableView.scrollIndicatorInsets = contentInset
//                self.tableView.contentOffset = CGPoint(x: self.tableView.contentOffset.x, y: self.tableView.contentOffset.y)
//            }
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            currentBarNames.remove(at: (indexPath as NSIndexPath).row)
//            currentBarValues.remove(at: (indexPath as NSIndexPath).row)
//            currentBarUnits.remove(at: (indexPath as NSIndexPath).row)
//            updateGlobals()
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            self.tableView.reloadData()
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
//        let row = (indexPath as NSIndexPath).row
//        if currentBarNames[row] != "No barbell"  {
//            return UITableViewCellEditingStyle.delete
//        }
//        return UITableViewCellEditingStyle.none
//    }
//
//
//    @objc func segmentValueChanged(_ sender: UISegmentedControl) {
//        segmentedControlSwitched(sender.selectedSegmentIndex, tag: sender.tag)
//    }
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if textField.tag == 1 {
//        }
//        else if textField.tag == 2 {
//            let placeholderText = textField.text
//            if placeholderText?.count > 0 {
//                textField.text = PublicClasses.removeUnitsFromText(placeholderText!)
//            }
//        }
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        var placeholderText = textField.text
//        let cell = textField.superview?.superview as! BarbellAdvancedSettingTableViewCell
//        let row = cell.tag
//        let oldBarName = currentBarNames[row]
//        let currentBarIndexFromGlobal = currentBarNames.index(of: GlobalVariables.sharedInstance.currentBarName)
//        if textField.tag == 1 {
//            placeholderText = placeholderText!.trimmingCharacters(in: CharacterSet.whitespaces)
//            if placeholderText?.count == 0 {
//                placeholderText = findNextName()
//            }
//            if placeholderText == "No barbell" {
//                placeholderText = "No barbells"
//            }
//            if row == currentBarIndexFromGlobal {
//                let oldCurrentBarbellSetSpot = GlobalVariables.sharedInstance.currentBarbellSet[oldBarName]
//                let oldBarbellsListSpot = GlobalVariables.sharedInstance.barbellsList[oldBarName]
//                let oldBarbellsListUnitsSpot = GlobalVariables.sharedInstance.barbellsListUnits[oldBarName]
//                GlobalVariables.sharedInstance.currentBarbellSet.removeValue(forKey: oldBarName)
//                GlobalVariables.sharedInstance.barbellsList.removeValue(forKey: oldBarName)
//                GlobalVariables.sharedInstance.barbellsListUnits.removeValue(forKey: oldBarName)
//                GlobalVariables.sharedInstance.currentBarName = placeholderText!
//                GlobalVariables.sharedInstance.currentBarbellSet[GlobalVariables.sharedInstance.currentBarName] = oldCurrentBarbellSetSpot
//                GlobalVariables.sharedInstance.barbellsList[GlobalVariables.sharedInstance.currentBarName] = oldBarbellsListSpot
//                GlobalVariables.sharedInstance.barbellsListUnits[GlobalVariables.sharedInstance.currentBarName] = oldBarbellsListUnitsSpot
//            }
//            currentBarNames[row] = placeholderText!
//            textField.text = placeholderText
//        }
//        else if textField.tag == 2 {
//            if placeholderText?.count > 0 {
//                currentBarValues[row] = PublicClasses.numberFormatterDecimal.number(from: textField.text!)!.doubleValue
//                placeholderText = PublicClasses.removeUnitsFromText(placeholderText!)
//                let index = cell.segmentedControl.selectedSegmentIndex
//                if index == 0 {
//                    currentBarUnits[row] = "Kg"
//                    currentBarValues[row] = PublicClasses.numberFormatterDecimal.number(from: placeholderText!)!.doubleValue.roundToPlaces(GlobalVariables.sharedInstance.kgDecimalPlaces)
//                    cell.valueTextField.text = PublicClasses.massFormatter.string(fromValue: currentBarValues[cell.tag], unit: MassFormatter.Unit.kilogram)
//                }
//                else if index == 1 {
//                    currentBarUnits[row] = "lbs"
//                    currentBarValues[row] = PublicClasses.numberFormatterDecimal.number(from: placeholderText!)!.doubleValue.roundToPlaces(GlobalVariables.sharedInstance.lbDecimalPlaces)
//                    cell.valueTextField.text = PublicClasses.massFormatter.string(fromValue: currentBarValues[cell.tag], unit: MassFormatter.Unit.pound)
//                }
//            }
//            else {
//                textField.text = "0"
//                currentBarValues[row] = 0
//            }
//        }
//        self.updateGlobals()
//    }
//
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { // return NO to not change text
//        var result = true
//        if textField.tag == 1 {
//            app.status.keyPadUsedNow = false
//            let prospectiveText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
//            if string.count > 0 {
//                let disallowedCharacterSet = CharacterSet(charactersIn: "%")
//                let replacementStringIsLegal = string.rangeOfCharacter(from: disallowedCharacterSet) == nil
//                let resultingStringLengthIsLegal = prospectiveText.count <= 40
//                result = replacementStringIsLegal && resultingStringLengthIsLegal
//            }
//        }
//        else if textField.tag == 2 {
//            var maxDecimalPlaces = 2
//            let cell = textField.superview?.superview as! BarbellAdvancedSettingTableViewCell
//            let unitSelected = cell.segmentedControl.titleForSegment(at: cell.segmentedControl.selectedSegmentIndex)!
//            let unitToPass: MassFormatter.Unit = MassFormatter.Unit.kilogram
//            if unitSelected == PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.pound) {
//                maxDecimalPlaces = app.profile.lbDecimalPlaces
//            }
//            else if unitSelected == PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.kilogram) {
//                maxDecimalPlaces =  app.profile.kgDecimalPlaces
//            }
//            result = PublicClasses.textFieldDecimalVerification(textField, range: range, string: string, maxDecimalPlaces: maxDecimalPlaces, maxIntegerPlaces: 3, unit: unitToPass, percentageMode: GlobalVariables.sharedInstance.percentageModeActive)
//        }
//        return result
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let row = (indexPath as NSIndexPath).row
//        print(row)
//        if row <= currentBarNames.count-1 {
//        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! BarbellAdvancedSettingTableViewCell
//        cell.tag = row
////            cell.valueTextField.hidden = true
//        cell.nameTextField.text = NSLocalizedString(currentBarNames[row], comment: "")
//        cell.valueTextField.text = PublicClasses.numberFormatterDecimal.string(from: currentBarValues[row] as NSNumber)
//            cell.nameTextField.placeholder = NSLocalizedString("Barbell name", comment: "")
//            cell.valueTextField.placeholder = NSLocalizedString("Barbell weight", comment: "")
//            cell.nameTextField.placeholderFont = app.visuals.fontStandard
//            cell.nameTextField.placeholderColor = app.visuals.placeholderColor
//            cell.nameTextField.lineColor = app.visuals.secondaryColor
//            cell.nameTextField.selectedLineColor = app.visuals.secondaryColor
//            cell.valueTextField.placeholderFont = app.visuals.fontStandard
//            cell.valueTextField.placeholderColor = app.visuals.placeholderColor
//            cell.valueTextField.lineColor = app.visuals.secondaryColor
//            cell.valueTextField.selectedLineColor = app.visuals.secondaryColor
//            cell.nameTextField.title = ""
//            cell.valueTextField.title = ""
//            cell.nameTextField.setTitleVisible(false)
//            cell.valueTextField.setTitleVisible(false)
//        if currentBarUnits[row] == "Kg" {
//            cell.segmentedControl.selectedSegmentIndex = 0
//        }
//        else {
//            cell.segmentedControl.selectedSegmentIndex = 1
//        }
//        let unitSelected = cell.segmentedControl.titleForSegment(at: cell.segmentedControl.selectedSegmentIndex)!
//        var unitToPass: MassFormatter.Unit = MassFormatter.Unit.kilogram
//        if unitSelected == PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.pound) {
//            unitToPass = MassFormatter.Unit.pound
//        }
//        else if unitSelected == PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.kilogram) {
//            unitToPass = MassFormatter.Unit.kilogram
//        }
//        var placeholderText =  cell.valueTextField.text
//        placeholderText = PublicClasses.removeUnitsFromText(placeholderText!)
//        cell.valueTextField.text = PublicClasses.massFormatter.string(fromValue: PublicClasses.numberFormatterDecimal.number(from: placeholderText!)!.doubleValue, unit: unitToPass)
//
//        cell.segmentedControl.addTarget(self, action: #selector(BarbellAdvancedSettings.segmentValueChanged(_:)), for: .valueChanged)
//        cell.nameTextField.tag = 1
//        cell.valueTextField.tag = 2
//        cell.nameTextField.delegate = self
//        cell.valueTextField.delegate = self
//        cell.segmentedControl.tag = row
//        cell.nameTextField.sizeToFit()
//        cell.valueTextField.sizeToFit()
//        cell.segmentedControl.sizeToFit()
//        cell.setNeedsLayout()
//            return cell
//    }
//        else {
//                return UITableViewCell()
//        }
//    }


    override func viewWillDisappear(_ animated: Bool) {
        if needToUploadChanges == true {
        DataAccess.sharedInstance.saveEverything()
//        DataAccess.sharedInstance.iCloudSave()
        }
    }
    
}
