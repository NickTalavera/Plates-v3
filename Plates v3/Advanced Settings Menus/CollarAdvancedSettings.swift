//
//  collarAdvancedSettings.swift
//  Bar - collar Plate Weight Calculator
//
//  Created by Nick Talavera on 6/20/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//
////
////    @IBAction func addButtonAction(_ sender: AnyObject) {
////        addButtonRunner()
////    }
////    func addButtonRunner() {
////        if currentCollarNames.count < 8 {
////            currentCollarValues += [0]
////            let isMetric = Locale.current.usesMetricSystem
////            if isMetric == true {
////            }
////            else if isMetric == false {
////                currentCollarUnits += ["lbs"]
////            }
////            self.tableView.reloadData()
////        }
////        updateGlobals()
////    }
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
////        #if os(iOS)
////            self.hideKeyboardWhenTappedAround()
////            let bigLabel: UILabel = UILabel()
////            bigLabel.text = NSLocalizedString("Collars", comment: "")
////            bigLabel.backgroundColor = UIColor.clear
////            bigLabel.textColor = GlobalVariables.sharedInstance.secondaryTextColor
////            bigLabel.font = GlobalVariables.sharedInstance.fontTitle!
////            bigLabel.adjustsFontSizeToFitWidth = true
////            bigLabel.sizeToFit()
////            navigationController?.navigationBar.setTitleVerticalPositionAdjustment(GlobalVariables.sharedInstance.titleVerticalAdjustment, for: .default)
////            self.tableView.superview?.backgroundColor = UIColor.white
////            self.navigationItem.titleView = bigLabel;
////            navigationController!.navigationBar.barTintColor = GlobalVariables.sharedInstance.secondaryColor
////            self.tableView.delaysContentTouches = false
////            navigationItem.leftBarButtonItem?.setTitleTextAttributes([ NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard], for: UIControlState.normal)
////            navigationItem.rightBarButtonItem?.setTitleTextAttributes([ NSAttributedStringKey.font: GlobalVariables.sharedInstance.fontStandard], for: UIControlState.normal)
////            navigationItem.rightBarButtonItem?.tintColor = GlobalVariables.sharedInstance.mainColor
////            navigationItem.leftBarButtonItem?.tintColor = GlobalVariables.sharedInstance.mainColor
////            self.view.layoutSubviews()
////        #endif
////        self.tableView.rowHeight = cellHeight
////        tableView.delegate = self
////        tableView.dataSource = self
////            NotificationCenter.default.addObserver(self, selector: #selector(dismissHere), name: NSNotification.Name(rawValue: "Reset Pages"), object: nil)
////        }
////
////        @objc func dismissHere() {
////            dismiss(animated: true, completion: nil)
////        }
////
////    func updateGlobals() {
////        needToUploadChanges = true
////        let oldCollarName = GlobalVariables.sharedInstance.currentCollarName
////        let oldCollarWeight = GlobalVariables.sharedInstance.currentCollarWeight
////        var newCollarSet: [String: Double] = [String: Double]()
////        var newCollarSetUnits: [String: String] = [String: String]()
////        var newCollarSetValue: [String: Double] = [String: Double]()
////        if currentCollarNames.count > 0 {
////            for i in 0...currentCollarNames.count-1 {
////                newCollarSet[currentCollarNames[i]] = currentCollarValues[i]
////                newCollarSetUnits[currentCollarNames[i]] = currentCollarUnits[i]
////            }
////        }
////        newCollarSet["No collar"] = 0
////        newCollarSetUnits["No collar"] = "lbs"
////        newCollarSetValue["No collar"] = 0
////        if newCollarSet.count <= 1 || newCollarSet[oldCollarName] == nil {
////            GlobalVariables.sharedInstance.currentCollarName = "No collar"
////            GlobalVariables.sharedInstance.currentCollarWeight = newCollarSet["No collar"]!
////        }
////        for i in currentCollarNames {
////            newCollarSetValue[i] = newCollarSet[i]!
////        }
////        GlobalVariables.sharedInstance.currentCollarSet = newCollarSet
////        GlobalVariables.sharedInstance.collarsSetValues = newCollarSetValue
////        GlobalVariables.sharedInstance.collarsSetUnits = newCollarSetUnits
////        if GlobalVariables.sharedInstance.units == "Kg" {
////            var collarsNew: [String: Double] = [String: Double]()
////            for (key,value) in GlobalVariables.sharedInstance.collarsSetValues {
////                if GlobalVariables.sharedInstance.collarsSetUnits[key] == "Kg" {
////                    collarsNew[key] = value.roundToPlaces(GlobalVariables.sharedInstance.kgDecimalPlaces)
////                }
////                else {
////                    collarsNew[key] = (value * 0.453592).roundToPlaces(GlobalVariables.sharedInstance.kgDecimalPlaces)
////                }
////            }
////            GlobalVariables.sharedInstance.currentCollarSet = collarsNew
////        }
////        else {
////            var collarsNew: [String: Double] = [String: Double]()
////            for (key,value) in app.profile.collarsSetValues {
////                if GlobalVariables.sharedInstance.collarsSetUnits[key] == "Kg" {
////                    collarsNew[key] = (value / 0.453592).roundToPlaces(GlobalVariables.sharedInstance.lbDecimalPlaces)
////                }
////                else {
////                    collarsNew[key] = value.roundToPlaces(GlobalVariables.sharedInstance.lbDecimalPlaces)
////                }
////            }
////            app.profile.currentCollarSet = collarsNew
////        }
////        GlobalVariables.sharedInstance.currentCollarWeight = GlobalVariables.sharedInstance.currentCollarSet[GlobalVariables.sharedInstance.currentCollarName]!
////        GlobalVariables.sharedInstance.weightToLift = GlobalVariables.sharedInstance.weightToLift - oldCollarWeight + GlobalVariables.sharedInstance.currentCollarWeight
////        delegate?.updatePageProtocol()
////        DataAccess.sharedInstance.saveEverything()
////        #if os(iOS)
////        PublicClasses.wcSendArrayOfStrings(["currentCollarName","currentCollarSet","currentCollarWeight","collarsSetValues","collarsSetUnits","units"])
////        #endif
////    }
////
////    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
////        self.resignFirstResponder()
////        return false
////    }
////
////    override func viewWillAppear(_ animated: Bool) {
////        super.viewWillAppear(false)
////
////    }
////
////    override func numberOfSections(in tableView: UITableView) -> Int {
////        return 1
////    }
////
////    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        if sortedAlready == false {
////            for keys in GlobalVariables.sharedInstance.collarsSetValues.keys.sorted(by: {$0 < $1}) {
////                if keys != "No collar" {
////                    currentCollarNames += [keys]
////                    currentCollarValues += [GlobalVariables.sharedInstance.collarsSetValues[keys]!]
////                    currentCollarUnits += [GlobalVariables.sharedInstance.collarsSetUnits[keys]!]
////                }
////            }
////            sortedAlready = true
////        }
////        #if os(iOS)
////            if currentCollarNames.count == 0 {
////                self.tableView.isScrollEnabled = false
////                addLabel = UILabel(frame: self.view.bounds)
////                self.view.addSubview(addLabel)
////                addLabel.numberOfLines = 2
////                addLabel.text = NSLocalizedString("Add a collar", comment: "")
////                addLabel.textAlignment = NSTextAlignment.center
////                addLabel.font = GlobalVariables.sharedInstance.fontAddX
////                addLabel.textColor = GlobalVariables.sharedInstance.secondaryColor
////                addLabel.sizeToFit()
////                addLabel.tag = 91248124
////                addLabel.adjustsFontSizeToFitWidth = true
////                addLabel.alpha = 0
////                UIView.transition(with: addLabel, duration: GlobalVariables.sharedInstance.platesFadeDuration, options: [.transitionCrossDissolve], animations: {
////                    self.addLabel.alpha = 1
////                    //            self.tableView.alpha = 0
////                    }, completion: nil)
////
////                let addLabelVerticalContraints = NSLayoutConstraint(item: addLabel, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: -44)
////                let addLabelHorizontalContraints = NSLayoutConstraint(item: addLabel, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
////                let addLabelWidth = NSLayoutConstraint(item: addLabel, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.9, constant: 0)
////                addLabel.translatesAutoresizingMaskIntoConstraints = false
////                NSLayoutConstraint.activate([addLabelVerticalContraints,addLabelHorizontalContraints,addLabelWidth])
////            }
////            else {
////                self.tableView.isScrollEnabled = true
////                for view in self.view.subviews {
////                    if view.tag == 91248124 {
////                        UIView.transition(with: view, duration: GlobalVariables.sharedInstance.platesFadeDuration, options: [.transitionCrossDissolve], animations: {
////                            view.alpha = 0
////                            }, completion: { (finished: Bool) -> Void in
////                                view.removeFromSuperview()
////                        })
////                    }
////                }
////            }
////            return currentCollarNames.count
////        #else
////            return currentCollarNames.count + 2
////        #endif
////    }
////
////    #if os(iOS)
////    func keyboardWillShow(_ notification: Notification) {
////    if let userInfo = (notification as NSNotification).userInfo {
////    if let keyboardSize: CGSize =    (userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size {
////    let contentInset = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height,  0.0);
////    self.tableView.contentInset = contentInset
////    self.tableView.scrollIndicatorInsets = contentInset
////
////    self.tableView.contentOffset = CGPoint(x: self.tableView.contentOffset.x, y: 0 + keyboardSize.height) //set zero instead self.scrollView.contentOffset.y
////
////    }
////    }
////    }
////
////    func keyboardWillHide(_ notification: Notification) {
////    if let userInfo = (notification as NSNotification).userInfo {
////    if let _: CGSize =  (userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size {
////    let contentInset = UIEdgeInsets.zero;
////    self.tableView.contentInset = contentInset
////    self.tableView.scrollIndicatorInsets = contentInset
////    self.tableView.contentOffset = CGPoint(x: self.tableView.contentOffset.x, y: self.tableView.contentOffset.y)
////    }
////    }
////    }
////    #endif
////
////
////
////    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
////        if editingStyle == .delete {
////            currentCollarNames.remove(at: (indexPath as NSIndexPath).row)
////            currentCollarValues.remove(at: (indexPath as NSIndexPath).row)
////            currentCollarUnits.remove(at: (indexPath as NSIndexPath).row)
////            updateGlobals()
////            tableView.deleteRows(at: [indexPath], with: .fade)
////            self.tableView.reloadData()
////        } else if editingStyle == .insert {
////            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
////        }
////    }
////
////    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
////        let row = (indexPath as NSIndexPath).row
////        if currentCollarNames[row] != "No collar"  {
////            return UITableViewCellEditingStyle.delete
////        }
////        return UITableViewCellEditingStyle.none
////    }
////
////
////    @objc func segmentValueChanged(_ sender: UISegmentedControl) {
////        segmentedControlSwitched(sender.selectedSegmentIndex, tag: sender.tag)
////    }
////
////    func textFieldDidBeginEditing(_ textField: UITextField) {
////        if textField.tag == 1 {
////        }
////        else if textField.tag == 2{
////            let placeholderText = textField.text
////            if placeholderText?.count > 0 {
////                textField.text = PublicClasses.removeUnitsFromText(placeholderText!)
////            }
////        }
////    }
////
////    func textFieldDidEndEditing(_ textField: UITextField) {
////        var placeholderText = textField.text
////        let cell = textField.superview?.superview as! CollarAdvancedSettingTableViewCell
////        let row = cell.tag
////        let currentCollarIndexFromGlobal = currentCollarNames.index(of: GlobalVariables.sharedInstance.currentCollarName)
////        let oldCollarName = currentCollarNames[row]
////        if textField.tag == 1 {
////            placeholderText = placeholderText!.trimmingCharacters(in: CharacterSet.whitespaces)
////            if placeholderText?.count == 0 {
////                placeholderText = findNextName()
////            }
////            if placeholderText == "No collar" {
////                placeholderText = "No collars"
////            }
////            if row == currentCollarIndexFromGlobal {
////                let oldCurrentCollarSetSpot = GlobalVariables.sharedInstance.currentCollarSet[oldCollarName]
////                let oldCollarsListSpot = GlobalVariables.sharedInstance.collarsSetValues[oldCollarName]
////                let oldCollarsListUnitsSpot = GlobalVariables.sharedInstance.collarsSetUnits[oldCollarName]
////                GlobalVariables.sharedInstance.currentCollarSet.removeValue(forKey: oldCollarName)
////                GlobalVariables.sharedInstance.collarsSetValues.removeValue(forKey: oldCollarName)
////                GlobalVariables.sharedInstance.collarsSetUnits.removeValue(forKey: oldCollarName)
////                GlobalVariables.sharedInstance.currentCollarName = placeholderText!
////                GlobalVariables.sharedInstance.currentCollarSet[GlobalVariables.sharedInstance.currentCollarName] = oldCurrentCollarSetSpot
////                GlobalVariables.sharedInstance.collarsSetValues[GlobalVariables.sharedInstance.currentCollarName] = oldCollarsListSpot
////                GlobalVariables.sharedInstance.collarsSetUnits[GlobalVariables.sharedInstance.currentCollarName] = oldCollarsListUnitsSpot
////            }
////            currentCollarNames[row] = placeholderText!
////
////            textField.text = placeholderText
////        }
////        else if textField.tag == 2 {
////            if placeholderText?.count > 0 {
////                currentCollarValues[row] = PublicClasses.numberFormatterDecimal.number(from: textField.text!)!.doubleValue
////                placeholderText = PublicClasses.removeUnitsFromText(placeholderText!)
////                let index = cell.segmentedControl.selectedSegmentIndex
////                if index == 0 {
////                    currentCollarUnits[row] = "Kg"
////                    currentCollarValues[row] = PublicClasses.numberFormatterDecimal.number(from: placeholderText!)!.doubleValue.roundToPlaces(GlobalVariables.sharedInstance.kgDecimalPlaces)
////                    cell.valueTextField.text = PublicClasses.massFormatter.string(fromValue: currentCollarValues[row], unit: MassFormatter.Unit.kilogram)
////                }
////                else if index == 1 {
////                    currentCollarUnits[row] = "lbs"
////                    currentCollarValues[row] = PublicClasses.numberFormatterDecimal.number(from: placeholderText!)!.doubleValue.roundToPlaces(GlobalVariables.sharedInstance.lbDecimalPlaces)
////                    cell.valueTextField.text = PublicClasses.massFormatter.string(fromValue: currentCollarValues[row], unit: MassFormatter.Unit.pound)
////                }
////            }
////            else {
////                textField.text = "0"
////                currentCollarValues[row] = 0
////            }
////
////        }
////        updateGlobals()
////    }
////
////    override func viewDidDisappear(_ animated: Bool) {
////        #if os(iOS)
////            delegate!.presentCustomizedPrompt()
////        #endif
////    }
////
////    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { // return NO to not change text
////        var result = true
////        if textField.tag == 1 {
////            GlobalVariables.sharedInstance.keyPadUsedNow = false
////            let prospectiveText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
////            if string.count > 0 {
////                let disallowedCharacterSet = CharacterSet(charactersIn: "%")
////                let replacementStringIsLegal = string.rangeOfCharacter(from: disallowedCharacterSet) == nil
////                let resultingStringLengthIsLegal = prospectiveText.count <= 40
////                result = replacementStringIsLegal && resultingStringLengthIsLegal
////            }
////        }
////        else if textField.tag == 2 {
////            let cell = textField.superview?.superview as! CollarAdvancedSettingTableViewCell
////            let unitSelected = cell.segmentedControl.titleForSegment(at: cell.segmentedControl.selectedSegmentIndex)!
////            let unitToPass: MassFormatter.Unit = MassFormatter.Unit.kilogram
////            var maxDecimalPlaces = GlobalVariables.sharedInstance.currentDecimalPlaces
////            if unitSelected == PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.pound) {
////                maxDecimalPlaces = GlobalVariables.sharedInstance.lbDecimalPlaces
////            }
////            else if unitSelected == PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.kilogram) {
////                maxDecimalPlaces = GlobalVariables.sharedInstance.kgDecimalPlaces
////            }
////            result = PublicClasses.textFieldDecimalVerification(textField, range: range, string: string, maxDecimalPlaces: maxDecimalPlaces, maxIntegerPlaces: 3, unit: unitToPass, percentageMode: GlobalVariables.sharedInstance.percentageModeActive)
////        }
////        return result
////    }
////
////
////
////    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let row = (indexPath as NSIndexPath).row
////        if row <= currentCollarNames.count-1 {
////            let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! CollarAdvancedSettingTableViewCell
////            print(row)
////            cell.tag = row
////            cell.nameTextField.text = NSLocalizedString(currentCollarNames[row], comment: "")
////            cell.valueTextField.text = PublicClasses.numberFormatterDecimal.string(from: currentCollarValues[row] as NSNumber)
////            cell.nameTextField.placeholder = NSLocalizedString("Collar name", comment: "")
////            cell.valueTextField.placeholder = NSLocalizedString("Collar weight", comment: "")
////            #if os(iOS)
////                cell.nameTextField.placeholderFont = GlobalVariables.sharedInstance.fontStandard
////                cell.nameTextField.placeholderColor = GlobalVariables.sharedInstance.placeholderColor
////                cell.nameTextField.lineColor = GlobalVariables.sharedInstance.secondaryColor
////                cell.nameTextField.selectedLineColor = GlobalVariables.sharedInstance.secondaryColor
////                cell.valueTextField.placeholderFont = GlobalVariables.sharedInstance.fontStandard
////                cell.valueTextField.placeholderColor = GlobalVariables.sharedInstance.placeholderColor
////                cell.valueTextField.lineColor = GlobalVariables.sharedInstance.secondaryColor
////                cell.valueTextField.selectedLineColor = GlobalVariables.sharedInstance.secondaryColor
////                cell.nameTextField.title = ""
////                cell.valueTextField.title = ""
////                cell.nameTextField.setTitleVisible(false)
////                cell.valueTextField.setTitleVisible(false)
////            #endif
////            if currentCollarUnits[row] == "Kg" {
////                cell.segmentedControl.selectedSegmentIndex = 0
////            }
////            else {
////                cell.segmentedControl.selectedSegmentIndex = 1
////            }
////            let unitSelected = cell.segmentedControl.titleForSegment(at: cell.segmentedControl.selectedSegmentIndex)!
////            var unitToPass: MassFormatter.Unit = MassFormatter.Unit.kilogram
////            if unitSelected == PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.pound) {
////                unitToPass = MassFormatter.Unit.pound
////            }
////            else if unitSelected == PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.kilogram) {
////                unitToPass = MassFormatter.Unit.kilogram
////            }
////            var placeholderText =  cell.valueTextField.text
////            placeholderText = PublicClasses.removeUnitsFromText(placeholderText!)
////            cell.valueTextField.text = PublicClasses.massFormatter.string(fromValue: PublicClasses.numberFormatterDecimal.number(from: placeholderText!)!.doubleValue, unit: unitToPass)
////            cell.segmentedControl.addTarget(self, action: #selector(CollarAdvancedSettings.segmentValueChanged(_:)), for: .valueChanged)
////            cell.nameTextField.tag = 1
////            cell.valueTextField.tag = 2
////            cell.nameTextField.delegate = self
////            cell.valueTextField.delegate = self
////            cell.segmentedControl.tag = row
////            cell.nameTextField.sizeToFit()
////            cell.valueTextField.sizeToFit()
////            cell.segmentedControl.sizeToFit()
////            cell.setNeedsLayout()
////            return cell
////        }
////        else {
////            #if os(tvOS)
////                let cellAddSub = tableView.dequeueReusableCell(withIdentifier: "addSubtractCell", for: indexPath) as! advancedSettingTableViewCellAddSubtract
////                //                cellAddSub.addButton.addTarget(self, action: #selector(addButtonAction(_:)), forControlEvents: .PrimaryActionTriggered)
////                //                cellAddSub.removeButton.addTarget(self, action: #selector(removeButtonAction), forControlEvents: .PrimaryActionTriggered)
////
////                cellAddSub.label.textColor = GlobalVariables.sharedInstance.defaultTextColor
////                cellAddSub.label.text = NSLocalizedString("Add", comment: "")
////                if indexPath.row == currentCollarNames.count + 1 && currentCollarNames.count > 0  {
////                    cellAddSub.label.textColor = GlobalVariables.sharedInstance.errorColor
////                    cellAddSub.label.text = NSLocalizedString("Remove", comment: "")
////                }
////                return cellAddSub
////            #else
////                return UITableViewCell()
////            #endif
////        }
////    }
////
////    //FIX THIS
//////    #if os(tvOS)
//////    override func tableView(tableView: UITableView, canFocusRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//////    if indexPath.row >= currentCollarNames.count  {
//////    return true
//////    }
//////    return false
//////    }
//////    #endif
//////
//////    #if os(tvOS)
//////    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//////    if section == 0 {
//////    return 120
//////    }
//////    return 44
//////    }
//////    #endif
//////
//////    #if os(tvOS)
//////    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//////    switch section {
//////    case 0:
//////    if currentCollarNames.count == 0 {
//////    return NSLocalizedString("Add a collar", comment: "")
//////    }
//////    return NSLocalizedString("Edit collars", comment: "")
//////    default:
//////    return ""
//////    }
//////    }
//////    #endif
//////
//////    #if os(tvOS)
//////    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//////    if indexPath.row >= currentCollarNames.count + 1 {
//////    removeButtonAction()
//////    }
//////    if indexPath.row >= currentCollarNames.count {
//////    addButtonRunner()
//////    }
//////    }
//////    #endif
//////
//////    #if os(tvOS)
//////    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//////    if indexPath.row >= currentCollarNames.count  {
//////    return 88
//////    }
//////    return cellHeight
//////    }
//////    #endif
////
////    #if os(tvOS)
////    func removeButtonAction() {
////    self.view.endEditing(true)
////    let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
////    let vc = storyboard.instantiateViewController(withIdentifier: "RemoveCollarModal") as! RemoveButtonCollar
////    //            vc.modalPresentationStyle = UIModalPresentationStyle.
////    //            vc.delegate = self.delegate
////    //            self.presentViewController(vc, animated: true, completion:nil)
////    self.show(vc, sender: self)
////    }
////    #endif
////
////    override func viewWillDisappear(_ animated: Bool) {
////        if needToUploadChanges == true {
////            DataAccess.sharedInstance.saveEverything()
////            DataAccess.sharedInstance.iCloudSave()
////        }
////    }
////
//}
            self.updateGlobals()
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.reloadData()
        }
        return [delete]
    }
}
