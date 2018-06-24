//
//  BarbellAdvancedSettings.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 4/29/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//
import AppKit

class CollarAdvancedSettingsOSX: AdvancedSettingViewController, TextFieldDelegate, NSTableViewDelegate  {
    let textCellIdentifier = "TextCell"
    weak var delegate: MainDelegate?
    var sortedAlready = false
    var currentCollarNames: [String] = [String]()
    var currentCollarUnits: [String] = [String]()
    var currentCollarValues: [Double] = [Double]()
    var needToUploadChanges = false
    var cellHeight: CGFloat = 51
    @IBOutlet weak var tableView: TableView!
    //    @IBOutlet weak var navigationBar: UINavigationItem!
    //    @IBOutlet weak var doneButton: UIBarButtonItem!
    //    @IBOutlet weak var addButton: UIBarButtonItem!
    
    
    var addLabel = Label()
    func segmentedControlSwitched(index: Int, tag: Int) {
        let row = tag
        let cell = tableView.viewAtColumn(0, row: tag, makeIfNecessary: false) as! CollarAdvancedSettingTableViewCell
        var placeholderText =  cell.valueTextField.stringValue
        placeholderText = PublicClasses.removeUnitsFromText(placeholderText)
        if index == 0 {
            currentCollarUnits[row] = "Kg"
            currentCollarValues[row] = PublicClasses.numberFormatterDecimal.numberFromString(placeholderText)!.doubleValue.roundToPlaces(GlobalVariables.sharedInstance.kgDecimalPlaces)
            cell.valueTextField.stringValue = PublicClasses.massFormatter.stringFromValue(currentCollarValues[row], unit: NSMassFormatterUnit.Kilogram)
        }
        else if index == 1 {
            currentCollarUnits[row] = "lbs"
            currentCollarValues[row] = PublicClasses.numberFormatterDecimal.numberFromString(placeholderText)!.doubleValue.roundToPlaces(GlobalVariables.sharedInstance.lbDecimalPlaces)
            cell.valueTextField.stringValue = PublicClasses.massFormatter.stringFromValue(currentCollarValues[row], unit: NSMassFormatterUnit.Pound)
        }
        GlobalVariables.sharedInstance.collarsSetUnits[currentCollarNames[tag]] = currentCollarUnits[tag]
        updateGlobals()
    }
    
    
    @IBAction func doneButtonAction(sender: AnyObject) {
        //        self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func findNextName() -> String {
        var minNum = 1
        var numArray: [Int] = [Int]()
        if currentCollarNames.count > 0 {
            for i in 0...currentCollarNames.count-1 {
                let collarNameToSplit: String = currentCollarNames[i]
                let collarSubstring = NSLocalizedString("Collar", comment: "").stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                if collarNameToSplit.characters.count >= collarSubstring.characters.count {
                    let substringTest = "\(collarNameToSplit.substringWithRange(collarSubstring.startIndex..<max(collarSubstring.endIndex,collarSubstring.startIndex)))".stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                    let index = currentCollarNames[i].stringByReplacingOccurrencesOfString(collarSubstring, withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                    if substringTest == collarSubstring && Int(index) != nil {
                        numArray += [(PublicClasses.numberFormatterDecimal.numberFromString(index)?.integerValue)!]
                    }
                }
            }
        }
        if numArray.count == 0 {
            numArray = [0]
        }
        for i in 1...numArray.maxElement()!+1 {
            if numArray.contains(i) == false {
                minNum = i
                break
            }
        }
        return "\(NSLocalizedString("Collar", comment: "")) \(minNum)"
    }
    
    @IBAction func addButtonAction(sender: AnyObject) {
        addButtonRunner()
    }
    func addButtonRunner() {
        if currentCollarNames.count < 8 {
            currentCollarNames += [findNextName()]
            currentCollarValues += [0]
            let isMetric = NSLocale.currentLocale().objectForKey(NSLocaleUsesMetricSystem) as! Bool
            if isMetric == true {
                currentCollarUnits += ["Kg"]
            }
            else if isMetric == false {
                currentCollarUnits += ["lbs"]
            }
            self.tableView.reloadData()
        }
        updateGlobals()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.tableView.tableFooterView = View(frame: CGRectZero)
        //        #if os(iOS)
        //            self.hideKeyboardWhenTappedAround()
        //            let bigLabel: UILabel = UILabel()
        //            bigLabel.stringValue = NSLocalizedString("Collars", comment: "")
        //            bigLabel.backgroundColor = UIColor.clearColor()
        //            bigLabel.textColor = GlobalVariables.sharedInstance.secondaryTextColor
        //            bigLabel.font = GlobalVariables.sharedInstance.fontTitle!
        //            bigLabel.adjustsFontSizeToFitWidth = true
        //            bigLabel.sizeToFit()
        //            navigationController?.navigationBar.setTitleVerticalPositionAdjustment(GlobalVariables.sharedInstance.titleVerticalAdjustment, forBarMetrics: .Default)
        //            self.tableView.superview?.backgroundColor = UIColor.whiteColor()
        //            self.navigationItem.titleView = bigLabel;
        //            let yourLabel: UILabel = UILabel()
        //            navigationController!.navigationBar.barTintColor = GlobalVariables.sharedInstance.secondaryColor
        //            self.tableView.delaysContentTouches = false
        //            navigationItem.leftBarButtonItem?.setTitleTextAttributes([ NSFontAttributeName: GlobalVariables.sharedInstance.fontStandard], forState: UIControlState.Normal)
        //            navigationItem.rightBarButtonItem?.setTitleTextAttributes([ NSFontAttributeName: GlobalVariables.sharedInstance.fontStandard], forState: UIControlState.Normal)
        //            navigationItem.rightBarButtonItem?.tintColor = GlobalVariables.sharedInstance.mainColor
        //            navigationItem.leftBarButtonItem?.tintColor = GlobalVariables.sharedInstance.mainColor
        //            self.view.layoutSubviews()
        //        #endif
        self.tableView.rowHeight = cellHeight
        //        tableView.delegate = self
        //        tableView.dataSource = self
    }
    
    func updateGlobals() {
        needToUploadChanges = true
        let oldCollarName = GlobalVariables.sharedInstance.currentCollarName
        let oldCollarWeight = GlobalVariables.sharedInstance.currentCollarWeight
        var newCollarSet: [String: Double] = [String: Double]()
        var newCollarSetUnits: [String: String] = [String: String]()
        var newCollarSetValue: [String: Double] = [String: Double]()
        if currentCollarNames.count > 0 {
            for i in 0...currentCollarNames.count-1 {
                newCollarSet[currentCollarNames[i]] = currentCollarValues[i]
                newCollarSetUnits[currentCollarNames[i]] = currentCollarUnits[i]
            }
        }
        newCollarSet["No collar"] = 0
        newCollarSetUnits["No collar"] = "lbs"
        newCollarSetValue["No collar"] = 0
        if newCollarSet.count <= 1 || newCollarSet[oldCollarName] == nil {
            GlobalVariables.sharedInstance.currentCollarName = "No collar"
            GlobalVariables.sharedInstance.currentCollarWeight = newCollarSet["No collar"]!
        }
        for i in currentCollarNames {
            newCollarSetValue[i] = newCollarSet[i]!
        }
        GlobalVariables.sharedInstance.currentCollarSet = newCollarSet
        GlobalVariables.sharedInstance.collarsSetValues = newCollarSetValue
        GlobalVariables.sharedInstance.collarsSetUnits = newCollarSetUnits
        if GlobalVariables.sharedInstance.units == "Kg" {
            var collarsNew: [String: Double] = [String: Double]()
            for (key,value) in GlobalVariables.sharedInstance.collarsSetValues {
                if GlobalVariables.sharedInstance.collarsSetUnits[key] == "Kg" {
                    collarsNew[key] = value.roundToPlaces(GlobalVariables.sharedInstance.kgDecimalPlaces)
                }
                else {
                    collarsNew[key] = (value * 0.453592).roundToPlaces(GlobalVariables.sharedInstance.kgDecimalPlaces)
                }
            }
            GlobalVariables.sharedInstance.currentCollarSet = collarsNew
        }
        else {
            var collarsNew: [String: Double] = [String: Double]()
            for (key,value) in GlobalVariables.sharedInstance.collarsSetValues {
                if GlobalVariables.sharedInstance.collarsSetUnits[key] == "Kg" {
                    collarsNew[key] = (value / 0.453592).roundToPlaces(GlobalVariables.sharedInstance.lbDecimalPlaces)
                }
                else {
                    collarsNew[key] = value.roundToPlaces(GlobalVariables.sharedInstance.lbDecimalPlaces)
                }
            }
            GlobalVariables.sharedInstance.currentCollarSet = collarsNew
        }
        GlobalVariables.sharedInstance.currentCollarWeight = GlobalVariables.sharedInstance.currentCollarSet[GlobalVariables.sharedInstance.currentCollarName]!
        GlobalVariables.sharedInstance.weightToLift = GlobalVariables.sharedInstance.weightToLift - oldCollarWeight + GlobalVariables.sharedInstance.currentCollarWeight
        delegate?.updatePageProtocol()
        DataAccess.sharedInstance.saveEverything()
    }
    
    //
    //    func textFieldShouldReturn(textField: UITextField) -> Bool {
    //        self.resignFirstResponder()
    //        return false
    //    }
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        if sortedAlready == false {
            for keys in GlobalVariables.sharedInstance.collarsSetValues.keys.sort({$0 < $1}) {
                if keys != "No collar" {
                    currentCollarNames += [keys]
                    currentCollarValues += [GlobalVariables.sharedInstance.collarsSetValues[keys]!]
                    currentCollarUnits += [GlobalVariables.sharedInstance.collarsSetUnits[keys]!]
                }
            }
            sortedAlready = true
        }
        return currentCollarNames.count
    }
    
    
    //    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    //        if editingStyle == .Delete {
    //            currentCollarNames.removeAtIndex(indexPath.row)
    //            currentCollarValues.removeAtIndex(indexPath.row)
    //            currentCollarUnits.removeAtIndex(indexPath.row)
    //            updateGlobals()
    //            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    //            self.tableView.reloadData()
    //        } else if editingStyle == .Insert {
    //            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    //        }
    //    }
    
    //    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
    //        let row = indexPath.row
    //        if currentCollarNames[row] != "No collar"  {
    //            return UITableViewCellEditingStyle.Delete
    //        }
    //        return UITableViewCellEditingStyle.None
    //    }
    
    
    func segmentValueChanged(sender: SegmentedControl) {
        segmentedControlSwitched(sender.selectedSegment, tag: sender.tag)
    }
    
    override func controlTextDidBeginEditing(obj: NSNotification) {
        if let textField = obj.object as? TextField {
            if textField.tag == 1 {
            }
            else if textField.tag == 2{
                let placeholderText = textField.stringValue
                if placeholderText.characters.count > 0 {
                    textField.stringValue = PublicClasses.removeUnitsFromText(placeholderText)
                }
            }
        }
    }
    
    override func controlTextDidEndEditing(obj: NSNotification) {
        print("controlTextDidEndEditing")
        print(obj)
        if let textField = obj.object as? TextField {
            var placeholderText = textField.stringValue
            let cell = textField.superview as! CollarAdvancedSettingTableViewCell
            let row = tableView.rowForView(cell)
            cell.wantsLayer = true
            cell.layer?.backgroundColor = Color.greenColor().CGColor
            
            textField.wantsLayer = true
            textField.layer?.backgroundColor = Color.blueColor().CGColor
            let currentCollarIndexFromGlobal = currentCollarNames.indexOf(GlobalVariables.sharedInstance.currentCollarName)
            print(row)
            let oldCollarName = currentCollarNames[row]
            if textField.tag == 1 {
                placeholderText = placeholderText.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
                if placeholderText.characters.count == 0 {
                    placeholderText = findNextName()
                }
                if placeholderText == "No collar" {
                    placeholderText = "No collars"
                }
                if row == currentCollarIndexFromGlobal {
                    let oldCurrentCollarSetSpot = GlobalVariables.sharedInstance.currentCollarSet[oldCollarName]
                    let oldCollarsListSpot = GlobalVariables.sharedInstance.collarsSetValues[oldCollarName]
                    let oldCollarsListUnitsSpot = GlobalVariables.sharedInstance.collarsSetUnits[oldCollarName]
                    GlobalVariables.sharedInstance.currentCollarSet.removeValueForKey(oldCollarName)
                    GlobalVariables.sharedInstance.collarsSetValues.removeValueForKey(oldCollarName)
                    GlobalVariables.sharedInstance.collarsSetUnits.removeValueForKey(oldCollarName)
                    GlobalVariables.sharedInstance.currentCollarName = placeholderText
                    GlobalVariables.sharedInstance.currentCollarSet[GlobalVariables.sharedInstance.currentCollarName] = oldCurrentCollarSetSpot
                    GlobalVariables.sharedInstance.collarsSetValues[GlobalVariables.sharedInstance.currentCollarName] = oldCollarsListSpot
                    GlobalVariables.sharedInstance.collarsSetUnits[GlobalVariables.sharedInstance.currentCollarName] = oldCollarsListUnitsSpot
                }
                currentCollarNames[row] = placeholderText
                
                textField.stringValue = placeholderText
            }
            else if textField.tag == 2 {
                if placeholderText.characters.count > 0 {
                    placeholderText = PublicClasses.removeUnitsFromText(placeholderText)
                    currentCollarValues[row] = (PublicClasses.numberFormatterDecimal.numberFromString(placeholderText)?.doubleValue)!
                    let index = cell.segmentedControl.selectedSegment
                    if index == 0 {
                        currentCollarUnits[row] = "Kg"
                        currentCollarValues[row] = PublicClasses.numberFormatterDecimal.numberFromString(placeholderText)!.doubleValue.roundToPlaces(GlobalVariables.sharedInstance.kgDecimalPlaces)
                        cell.valueTextField.stringValue = PublicClasses.massFormatter.stringFromValue(currentCollarValues[row], unit: NSMassFormatterUnit.Kilogram)
                    }
                    else if index == 1 {
                        currentCollarUnits[row] = "lbs"
                        currentCollarValues[row] = PublicClasses.numberFormatterDecimal.numberFromString(placeholderText)!.doubleValue.roundToPlaces(GlobalVariables.sharedInstance.lbDecimalPlaces)
                        cell.valueTextField.stringValue = PublicClasses.massFormatter.stringFromValue(currentCollarValues[row], unit: NSMassFormatterUnit.Pound)
                    }
                }
                else {
                    textField.stringValue = "0"
                    currentCollarValues[row] = 0
                }
                
            }
            updateGlobals()
        }
    }
    
    
    //    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool { // return NO to not change text
    //        var result = true
    //        if textField.tag == 1 {
    //            GlobalVariables.sharedInstance.keyPadUsedNow = false
    //            let prospectiveText = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
    //            if string.characters.count > 0 {
    //                let disallowedCharacterSet = NSCharacterSet(charactersInString: "%")
    //                let replacementStringIsLegal = string.rangeOfCharacterFromSet(disallowedCharacterSet) == nil
    //                let resultingStringLengthIsLegal = prospectiveText.characters.count <= 40
    //                result = replacementStringIsLegal && resultingStringLengthIsLegal
    //            }
    //        }
    //        else if textField.tag == 2 {
    //            let cell = textField.superview?.superview as! CollarAdvancedSettingTableViewCell
    //            let unitSelected = cell.segmentedControl.titleForSegmentAtIndex(cell.segmentedControl.selectedSegmentIndex)!
    //            let unitToPass: NSMassFormatterUnit = NSMassFormatterUnit.Kilogram
    //            var maxDecimalPlaces = GlobalVariables.sharedInstance.currentDecimalPlaces
    //            if unitSelected == PublicClasses.massFormatter.unitStringFromValue(0, unit: NSMassFormatterUnit.Pound) {
    //                maxDecimalPlaces = GlobalVariables.sharedInstance.lbDecimalPlaces
    //            }
    //            else if unitSelected == PublicClasses.massFormatter.unitStringFromValue(0, unit: NSMassFormatterUnit.Kilogram) {
    //                maxDecimalPlaces = GlobalVariables.sharedInstance.kgDecimalPlaces
    //            }
    //            result = PublicClasses.textFieldDecimalVerification(textField, range: range, string: string, maxDecimalPlaces: maxDecimalPlaces, maxIntegerPlaces: 3, unit: unitToPass, percentageMode: GlobalVariables.sharedInstance.percentageModeActive)
    //        }
    //        return result
    //    }
    
    func controlWasTouched(textField: NSTextField) {
        print("controlWasTouched")
//        print(sender.stringValue)
//        let textField = sender.view
        //        if let textField = sender.object as? String {
        //            print("Casted to String")
        //        }
        //        if let textField = sender.object as? TextField {
        //            print("Casted to TextField")
        //            textField.stringValue = PublicClasses.removeUnitsFromText(textField.stringValue)
        //        }
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if row <= currentCollarNames.count-1 {
            if let cell = tableView.makeViewWithIdentifier("textCell", owner: nil) as? CollarAdvancedSettingTableViewCell {
                //                                cell.tag = row
                cell.nameTextField.stringValue = NSLocalizedString(currentCollarNames[row], comment: "")
                cell.valueTextField.stringValue = PublicClasses.numberFormatterDecimal.stringFromNumber(currentCollarValues[row])!
                cell.nameTextField.placeholderString = NSLocalizedString("Collar name", comment: "")
                cell.valueTextField.placeholderString = NSLocalizedString("Collar weight", comment: "")
                var unitToPass = NSMassFormatterUnit.Kilogram
                var unitSelected = "Kg"
                cell.segmentedControl.segmentCount = 2
                cell.segmentedControl.setLabel(PublicClasses.massFormatter.unitStringFromValue(0, unit: NSMassFormatterUnit.Kilogram), forSegment: 0)
                cell.segmentedControl.setLabel(PublicClasses.massFormatter.unitStringFromValue(0, unit: NSMassFormatterUnit.Pound), forSegment: 1)
                if currentCollarUnits[row] == "Kg" {
                    cell.segmentedControl.selectedSegment = 0
//                    cell.segmentedControl.setSelected(true, forSegment: 0)
                    unitSelected = "Kg"
                    unitToPass = NSMassFormatterUnit.Kilogram
                }
                else {
                    cell.segmentedControl.selectedSegment = 1
//                    cell.segmentedControl.setSelected(true, forSegment: 1)
                    unitSelected = "lbs"
                    unitToPass = NSMassFormatterUnit.Pound
                }
                var placeholderText = PublicClasses.removeUnitsFromText(cell.valueTextField.stringValue)
                cell.valueTextField.stringValue = PublicClasses.massFormatter.stringFromValue(PublicClasses.numberFormatterDecimal.numberFromString(placeholderText)!.doubleValue, unit: unitToPass)
                cell.segmentedControl.action = #selector(segmentValueChanged(_:))
                
                cell.nameTextField.tag = 1
                cell.valueTextField.tag = 2
                cell.nameTextField.delegate = self
                cell.valueTextField.delegate = self
                cell.segmentedControl.tag = row
//                cell.nameTextField.sizeToFit()
//                cell.valueTextField.sizeToFit()
//                cell.segmentedControl.sizeToFit()
                let gesture = NSClickGestureRecognizer()
                gesture.target = self
                gesture.buttonMask = 0x1
                gesture.numberOfClicksRequired = 1
                gesture.action = #selector(controlWasTouched(_:))
                cell.valueTextField.addGestureRecognizer(gesture)
                return cell
            }
            return TableViewCell()
        }
        else {
            #if os(tvOS)
                let cellAddSub = tableView.dequeueReusableCellWithIdentifier("addSubtractCell", forIndexPath: indexPath) as! advancedSettingTableViewCellAddSubtract
                //                cellAddSub.addButton.addTarget(self, action: #selector(addButtonAction(_:)), forControlEvents: .PrimaryActionTriggered)
                //                cellAddSub.removeButton.addTarget(self, action: #selector(removeButtonAction), forControlEvents: .PrimaryActionTriggered)
                
                cellAddSub.label.textColor = GlobalVariables.sharedInstance.defaultTextColor
                cellAddSub.label.stringValue = NSLocalizedString("Add", comment: "")
                if indexPath.row == currentCollarNames.count + 1 && currentCollarNames.count > 0  {
                    cellAddSub.label.textColor = GlobalVariables.sharedInstance.errorColor
                    cellAddSub.label.stringValue = NSLocalizedString("Remove", comment: "")
                }
                return cellAddSub
            #else
                return TableViewCell()
            #endif
        }
    }
    
    func tableView(tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        if row >= currentCollarNames.count  {
            return true
        }
        return false
    }
    
    
   
    
    func removeButtonAction() {
        //    self.view.endEditing(true)
        //    let storyboard : NSStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //    let vc = storyboard.instantiateViewControllerWithIdentifier("RemoveCollarModal") as! RemoveButtonCollar
        //    self.showViewController(vc, sender: self)
    }
    
    override func viewWillDisappear() {
        if needToUploadChanges == true {
            DataAccess.sharedInstance.saveEverything()
            DataAccess.sharedInstance.iCloudSave()
        }
    }
    
}
