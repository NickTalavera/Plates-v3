//
//  BarbellAdvancedSettings.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 6/20/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import UIKit


class BarbellAdvancedSettings: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    let textCellIdentifier = "TextCell"
    weak var delegate: MainDelegate?
    var madeChanges = false
    var addLabel = UILabel()
    var currentBarbellIndex = Int()
    
    @IBAction func addButtonAction(_ sender: AnyObject) {
        if app.profile.barbellCollection.list.count <= 8 {
            let newBarbell = AppData.Barbell(name: findNextName(), unitType:
                PublicClasses.currentLocaleUnit.unit, weight: 0)
            app.profile.barbellCollection.list.insert(newBarbell, at: 0)
            self.tableView.reloadData()
        }
        madeChanges = true
        DataAccess.sharedInstance.saveEverything()
    }
    
    @objc func segmentValueChanged(_ sender: UISegmentedControl) {
        self.view.endEditing(true)
        if sender.selectedSegmentIndex == 0 {
            app.profile.barbellCollection.list[sender.tag].unitType = UnitOfWeight.unitType.kg
        }
        else if sender.selectedSegmentIndex == 1 {
            app.profile.barbellCollection.list[sender.tag].unitType = UnitOfWeight.unitType.lb
        }
        updateGlobals()
        self.tableView.reloadData()
    }
    
    
    @IBAction func doneButtonAction(_ sender: AnyObject) {
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentBarbellIndex = app.profile.barbellCollection.list.index(where: {$0.equals(compareTo: app.profile.currentBarbell)})!
        print("Current Barbell Index: \(currentBarbellIndex)")
        self.hideKeyboardWhenTappedAround()
        let bigLabel: UILabel = UILabel()
        bigLabel.text = NSLocalizedString("Barbells", comment: "")
        bigLabel.backgroundColor = UIColor.clear
        bigLabel.textColor = app.visuals.secondaryTextColor
        bigLabel.font = app.visuals.fontTitle
        bigLabel.adjustsFontSizeToFitWidth = true
        bigLabel.sizeToFit()
        navigationController?.navigationBar.setTitleVerticalPositionAdjustment(app.visuals.titleVerticalAdjustment, for: .default)
        self.tableView.superview?.backgroundColor = UIColor.white
        self.navigationItem.titleView = bigLabel;
        self.tableView.delaysContentTouches = false
        self.view.layoutSubviews()
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([ NSAttributedStringKey.font: app.visuals.fontStandard], for: UIControlState.normal)
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([ NSAttributedStringKey.font: app.visuals.fontStandard], for: UIControlState.normal)
        navigationItem.rightBarButtonItem?.tintColor = app.visuals.mainColor
        navigationItem.leftBarButtonItem?.tintColor = app.visuals.mainColor
        navigationController!.navigationBar.barTintColor = app.visuals.secondaryColor
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.rowHeight = 88
        tableView.delegate = self
        tableView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(dismissHere), name: NSNotification.Name(rawValue: "Reset Pages"), object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
        return false
    }
    
    
    @objc func dismissHere() {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func findNextName() -> String {
        var minNum = 1
        var numArray: [Int] = [Int]()
        if app.profile.barbellCollection.list.count > 0 {
            for i in 0...app.profile.barbellCollection.list.count-1 {
                let barbellNameToSplit: String = app.profile.barbellCollection.list[i].name
                let barbellSubstring = NSLocalizedString("Barbell", comment: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                if barbellNameToSplit.count >= barbellSubstring.count {
                    let substringTest = "\(barbellNameToSplit.substring(with: barbellSubstring.startIndex..<barbellSubstring.endIndex))".trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                    let index = app.profile.barbellCollection.list[i].name.replacingOccurrences(of: barbellSubstring, with: "", options: NSString.CompareOptions.literal, range: nil).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
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
    
    
    func updateGlobals() {
        if (app.profile.barbellCollection.list.index(where: {$0.equals(compareTo: app.profile.currentBarbell)})) == nil {
            if !(app.profile.barbellCollection.list[currentBarbellIndex].name == app.profile.currentBarbell.name ||
                app.profile.barbellCollection.list[currentBarbellIndex].weight == app.profile.currentBarbell.weight) {
                self.currentBarbellIndex = app.profile.barbellCollection.list.endIndex-1
            }
        print(self.currentBarbellIndex)
            app.profile.currentBarbell = app.profile.barbellCollection.list[self.currentBarbellIndex]
            app.profile.chosenUnit.unit = app.profile.barbellCollection.list[self.currentBarbellIndex].unitType
            app.updateWeightToLift()
            self.delegate?.updatePageProtocol()
        }
        madeChanges = true
        DataAccess.sharedInstance.saveEverything()
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if app.profile.barbellCollection.list.count == 0 {
            self.tableView.isScrollEnabled = false
            addLabel = UILabel(frame: self.view.bounds)
            self.view.addSubview(addLabel)
            addLabel.numberOfLines = 2
            addLabel.text = NSLocalizedString("Add a barbell", comment: "")
            addLabel.textAlignment = NSTextAlignment.center
            addLabel.font = app.visuals.fontAddX
            addLabel.textColor = app.visuals.secondaryColor
            addLabel.sizeToFit()
            addLabel.adjustsFontSizeToFitWidth = true
            addLabel.tag = 91248124
            addLabel.alpha = 0
            UIView.transition(with: addLabel, duration: app.visuals.platesFadeDuration, options: [.transitionCrossDissolve], animations: {
                self.addLabel.alpha = 1
                //                self.tableView.alpha = 0
            }, completion: nil)
            let addLabelVerticalContraints = NSLayoutConstraint(item: addLabel, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: -44)
            let addLabelHorizontalContraints = NSLayoutConstraint(item: addLabel, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
            let addLabelWidth = NSLayoutConstraint(item: addLabel, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.9, constant: 0)
            addLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([addLabelVerticalContraints,addLabelHorizontalContraints,addLabelWidth])
        }
        else {
            self.tableView.isScrollEnabled = true
            for view in self.view.subviews {
                if view.tag == 91248124 {
                    UIView.transition(with: view, duration: app.visuals.platesFadeDuration, options: [.transitionCrossDissolve], animations: {
                        view.alpha = 0
                    }, completion: { (finished: Bool) -> Void in
                        view.removeFromSuperview()
                    })
                }
            }
        }
        return app.profile.barbellCollection.list.count
    }
    
    func keyboardWillShow(_ notification: Notification) {
        if let userInfo = (notification as NSNotification).userInfo {
            let keyboardSize: CGSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size
            let contentInset = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height,  0.0);
            self.tableView.contentInset = contentInset
            self.tableView.scrollIndicatorInsets = contentInset
            self.tableView.contentOffset = CGPoint(x: self.tableView.contentOffset.x, y: 0 + keyboardSize.height) //set zero instead self.scrollView.contentOffset.y
        }
    }
    
    func keyboardWillHide(_ notification: Notification) {
        if let userInfo = (notification as NSNotification).userInfo {
            let _: CGSize =  (userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size
            let contentInset = UIEdgeInsets.zero;
            self.tableView.contentInset = contentInset
            self.tableView.scrollIndicatorInsets = contentInset
            self.tableView.contentOffset = CGPoint(x: self.tableView.contentOffset.x, y: self.tableView.contentOffset.y)
        }
    }
    
    
    
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField.tag == 2) && ((textField.text?.count)! > 0) {
            textField.text = app.profile.barbellCollection.list[(textField.superview?.superview?.tag)!].weight.clean
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let cell = textField.superview?.superview as! BarbellAdvancedSettingTableViewCell
        let row = cell.tag
        if textField.tag == 1 { //Name textfield
            textField.text! = textField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
            if textField.text!.count == 0 {
                textField.text! = findNextName()
            }
            app.profile.barbellCollection.list[row].name = textField.text!
            textField.text = app.profile.barbellCollection.list[row].name
        }
        else if textField.tag == 2 { //Weight textfield
            var newWeight: Double = 0
            if textField.text!.count != 0 {
                newWeight = PublicClasses.numberFormatterDecimal.number(from: textField.text!)!.doubleValue
            }
            textField.text = PublicClasses.massFormatter.string(fromValue: newWeight, unit: UnitOfWeight(unit:  app.profile.barbellCollection.list[row].unitType).formatter)
            app.profile.barbellCollection.list[row].weight = newWeight
        }
        self.updateGlobals()
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var result = true
        if textField.tag == 1 {
            app.status.keyPadUsedNow = false
            let prospectiveText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            if string.count > 0 {
                let disallowedCharacterSet = CharacterSet(charactersIn: "%")
                let replacementStringIsLegal = string.rangeOfCharacter(from: disallowedCharacterSet) == nil
                let resultingStringLengthIsLegal = prospectiveText.count <= 40
                result = replacementStringIsLegal && resultingStringLengthIsLegal
            }
        }
        else if textField.tag == 2 {
            var maxDecimalPlaces = 2
            let cell = textField.superview?.superview as! BarbellAdvancedSettingTableViewCell
            let unitSelected = cell.segmentedControl.titleForSegment(at: cell.segmentedControl.selectedSegmentIndex)!
            let unitToPass: MassFormatter.Unit = MassFormatter.Unit.kilogram
            if unitSelected == PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.pound) {
                maxDecimalPlaces = UnitOfWeight(unit: UnitOfWeight.unitType.kg).decimalPlaces
            }
            else if unitSelected == PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.kilogram) {
                maxDecimalPlaces =  UnitOfWeight(unit: UnitOfWeight.unitType.kg).decimalPlaces
            }
            result = PublicClasses.textFieldDecimalVerification(textField, range: range, string: string, maxDecimalPlaces: maxDecimalPlaces, maxIntegerPlaces: 3, unit: unitToPass, percentageMode: app.status.percentageModeActive)
        }
        return result
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = (indexPath as NSIndexPath).row
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! BarbellAdvancedSettingTableViewCell
        if app.profile.barbellCollection.list[row].name != "No barbell" {
            cell.tag = row
            cell.nameTextField.text = NSLocalizedString(app.profile.barbellCollection.list[row].name, comment: "")
            cell.nameTextField.placeholder = NSLocalizedString("Barbell name", comment: "")
            cell.valueTextField.placeholder = NSLocalizedString("Barbell weight", comment: "")
            cell.nameTextField.placeholderFont = app.visuals.fontStandard
            cell.nameTextField.placeholderColor = app.visuals.placeholderColor
            cell.nameTextField.lineColor = app.visuals.secondaryColor
            cell.nameTextField.selectedLineColor = app.visuals.secondaryColor
            cell.valueTextField.placeholderFont = app.visuals.fontStandard
            cell.valueTextField.placeholderColor = app.visuals.placeholderColor
            cell.valueTextField.lineColor = app.visuals.secondaryColor
            cell.valueTextField.selectedLineColor = app.visuals.secondaryColor
            cell.nameTextField.title = ""
            cell.valueTextField.title = ""
            cell.nameTextField.setTitleVisible(false)
            cell.valueTextField.setTitleVisible(false)
            if app.profile.barbellCollection.list[row].unitType == UnitOfWeight.unitType.kg {
                cell.segmentedControl.selectedSegmentIndex = 0
            }
            else {
                cell.segmentedControl.selectedSegmentIndex = 1
            }
            cell.segmentedControl.addTarget(self, action: #selector(BarbellAdvancedSettings.segmentValueChanged(_:)), for: .valueChanged)
            
            let unitSelected = cell.segmentedControl.titleForSegment(at: cell.segmentedControl.selectedSegmentIndex)!
            var unitToPass: MassFormatter.Unit = MassFormatter.Unit.kilogram
            if unitSelected == PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.pound) {
                unitToPass = MassFormatter.Unit.pound
            }
            else if unitSelected == PublicClasses.massFormatter.unitString(fromValue: 0, unit: MassFormatter.Unit.kilogram) {
                unitToPass = MassFormatter.Unit.kilogram
            }
            cell.valueTextField.text = PublicClasses.massFormatter.string(fromValue: app.profile.barbellCollection.list[row].weight, unit: unitToPass)
            
            cell.nameTextField.tag = 1
            cell.valueTextField.tag = 2
            cell.nameTextField.delegate = self
            cell.valueTextField.delegate = self
            cell.segmentedControl.tag = row
            cell.nameTextField.sizeToFit()
            cell.valueTextField.sizeToFit()
            cell.segmentedControl.sizeToFit()
            
//            cell.nameTextField.isUserInteractionEnabled = false
//            cell.valueTextField.isUserInteractionEnabled = false
//            cell.segmentedControl.isUserInteractionEnabled = false
            cell.setNeedsLayout()
        }
        else {
            cell.isHidden = true
            cell.heightAnchor.constraint(equalToConstant: 0)
        }
        return cell
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        if madeChanges == true {
            DataAccess.sharedInstance.saveEverything()
            //                    DataAccess.sharedInstance.iCloudSave()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if app.profile.currentBarbell.name != "No barbell"  {
            return UITableViewCellEditingStyle.delete
        }
        return UITableViewCellEditingStyle.none
    }
  
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "delete") { (action, indexPath) in
            app.profile.barbellCollection.list.remove(at: (indexPath as NSIndexPath).row)
            self.updateGlobals()
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.reloadData()
        }
        return [delete]
    }
}
