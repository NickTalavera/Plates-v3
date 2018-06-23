//
//  KeyPadDumpingGround.swift
//  Plates v3
//
//  Created by Nicholas Talavera on 6/23/18.
//  Copyright © 2018 Nicholas Talavera. All rights reserved.
//

import CoreData
import UIKit
import JVFloatLabeledText

class KeyPadViewController: UIViewController, UITextFieldDelegate, UIPopoverPresentationControllerDelegate {//, MainDelegate {
//    weak var delegate:MainDelegate?
    @IBOutlet weak var keyPadBackgroundView: UIView!
    @IBOutlet weak var platesView: UIView!
    @IBOutlet weak var platesLabelWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var hiddenHeightKeepingLabel: UIButton!
    @IBOutlet weak var goButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var collarButtonAnchor: UIView!
    @IBOutlet weak var gymButtonAnchor: UIView!
    @IBOutlet weak var barbellButtonAnchor: UIView!
    @IBOutlet weak var navBarButton: UIButton!
    @IBOutlet weak var barbuttonitem: UIBarButtonItem!
    @IBOutlet weak var fourTwoWidthZero: NSLayoutConstraint!
    @IBOutlet weak var fourTwoWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var barTextInput: UIView!
    @IBOutlet weak var barTextInputShadow: UIView!
    @IBOutlet weak var NavigationItem: UINavigationItem!
    @IBOutlet weak var platesLabel: UITextView!
    @IBOutlet weak var One_Two_View: UIView!
    @IBOutlet weak var GoButton: UIButton!
    @IBOutlet weak var One_One_View: UIView!
    @IBOutlet weak var One_Three_View: UIView!
    @IBOutlet weak var One_Four_View: UIView!
    @IBOutlet weak var Two_One_View: UIView!
    @IBOutlet weak var Two_Two_View: UIView!
    @IBOutlet weak var Two_Three_View: UIView!
    @IBOutlet weak var Two_Four_View: UIView!
    @IBOutlet weak var Three_One_View: UIView!
    @IBOutlet weak var Three_Two_View: UIView!
    @IBOutlet weak var Three_Three_View: UIView!
    @IBOutlet weak var Three_Four_View: UIView!
    @IBOutlet weak var Four_One_View: UIView!
    @IBOutlet weak var Four_Two_View: UIView!
    @IBOutlet weak var Four_Three_View: UIView!
    @IBOutlet weak var Four_Four_View: UIView!
    @IBOutlet weak var FiftyFiveLbsButton: UIButton!
    @IBOutlet weak var FortyFiveLbsButton: UIButton!
    @IBOutlet weak var ThirtyFiveLbsButton: UIButton!
    @IBOutlet weak var TwentyFiveLbsButton: UIButton!
    @IBOutlet weak var FifteenLbsButton: UIButton!
    @IBOutlet weak var TenLbsButton: UIButton!
    @IBOutlet weak var FiveLbsButton: UIButton!
    @IBOutlet weak var TwoPointFiveLbsButton: UIButton!
    @IBOutlet weak var OnePointTwoFiveLbsButton: UIButton!
    @IBOutlet weak var PercentButton: UIButton!
    @IBOutlet weak var RemoveButton: UIButton!
    @IBOutlet weak var InventoryButton: UIButton!
    @IBOutlet weak var BarbellButton: UIButton!
    @IBOutlet weak var CollarsButton: UIButton!
    @IBOutlet weak var ClearButton: UIButton!
    @IBOutlet weak var UnitsButton: UIButton!
    var weightEntryTextFieldHeight: NSLayoutConstraint = NSLayoutConstraint()
    var horizonalLeftContraints: NSLayoutConstraint = NSLayoutConstraint()
    let keyPadViewIdentifier: String = "keyPadIdentifier"
    let gradientLayer: CAGradientLayer = CAGradientLayer()
    var titleLabel: UILabel = UILabel()
    var saveFile : NSManagedObject!
    var moved = false
//    let managedObjectContext = DataAccess.sharedInstance.managedObjectContext
    var weightEntryTextField: JVFloatLabeledTextField = JVFloatLabeledTextField(frame: CGRect(x: 150, y: 10, width: 300, height: 45))
    var weightOutputLabel: UILabel = UILabel()
    var percentageModeActive: Bool = false
    var keyboardHeight: CGFloat = 0
    var appVisuals = AppVisuals()
    var appCalcs = AppCalcs()
    var appStatus = AppStatus()
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appStatus.didLoad = true
//        DataAccess.sharedInstance.delegate = self
//        NotificationCenter.default.addObserver(self, selector: #selector(iCloudOverwroteData), name: NSNotification.Name(rawValue: "iCloudOverwroteData"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(iCloudNewDataFetched), name: NSNotification.Name(rawValue: "iCloudNewDataFetched"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(iCloudNewDataFetchedNeedsReset), name: NSNotification.Name(rawValue: "iCloudNewDataFetchedNeedsReset"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(updatePageProtocol), name: NSNotification.Name(rawValue: "iCloudWeightNeedsReset"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(iCloudFirstTime), name: NSNotification.Name(rawValue: "iCloudFirstTime"), object: nil)
//        self.hideKeyboardWhenTappedAround()
//        PublicClasses.switchUnitsToWrap(GlobalVariables.sharedInstance.units, weightEntryTextField: weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton, titleLabel: nil, overwriteValues: false)
//        barTextInput.layer.cornerRadius = 0.5 * GoButton.bounds.size.height
//        GoButton.layer.cornerRadius = 0.5 * GoButton.bounds.size.height
//        barTextInput.clipsToBounds = true
//        GoButton.clipsToBounds = true
//        let gradColor = UIColor.flatWatermelonDark
//        GlobalVariables.sharedInstance.gradientColor1 = gradColor.lighten(byPercentage: 0.07)! as UIColor
//        GlobalVariables.sharedInstance.gradientColor2 = gradColor.darken(byPercentage: 0)! as UIColor
//        var shortcutArray: [UIApplicationShortcutItem] = [UIApplicationShortcutItem(type: "calculatorOnlyItem", localizedTitle: NSLocalizedString("Calculator only", comment: ""), localizedSubtitle: "", icon: .none, userInfo: nil)]
//        if GlobalVariables.sharedInstance.gymsChosen.count >= 1 {
//            let shortcut2 = UIApplicationShortcutItem(type: "gymIndex0", localizedTitle: GlobalVariables.sharedInstance.gymsChosen[0], localizedSubtitle: "", icon: .none, userInfo: nil)
//            shortcutArray.append(shortcut2)
//        }
//        if GlobalVariables.sharedInstance.gymsChosen.count >= 2 {
//            let shortcut3 = UIApplicationShortcutItem(type: "gymIndex1", localizedTitle: GlobalVariables.sharedInstance.gymsChosen[1], localizedSubtitle: "", icon: .none, userInfo: nil)
//            shortcutArray.append(shortcut3)
//        }
//        if GlobalVariables.sharedInstance.gymsChosen.count >= 3 {
//            let shortcut4 = UIApplicationShortcutItem(type: "gymIndex2", localizedTitle: GlobalVariables.sharedInstance.gymsChosen[2], localizedSubtitle: "", icon: .none, userInfo: nil)
//            shortcutArray.append(shortcut4)
//        }
//        UIApplication.shared.shortcutItems = shortcutArray
        self.setupInitialViews()
//        NotificationCenter.default.addObserver(self, selector: #selector(KeyPadViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(KeyPadViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
//
//

    @objc func keyboardWillShow(_ notification: NSNotification) {
//        if self.view.isTopViewInWindow() == true {
//            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//                //            self.view.frame.origin.y -= keyboardSize.height
//                if keyboardSize.height >= weightEntryTextField.frame.minY {
//                    moved = true
//                    self.view.frame.origin.y -= keyboardSize.height - weightEntryTextField.frame.minY
//                }
//                self.keyboardHeight = keyboardSize.height
//            }
//        }
    }

    
    @objc func keyboardWillHide(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if moved == true {
                var keyBoardHeightT: CGFloat = keyboardSize.height
                if keyboardSize.height == 0 {
                    keyBoardHeightT = self.keyboardHeight
                }
//                self.view.frame.origin.y += keyBoardHeightT - weightEntryTextField.frame.minY
                moved = false
            }
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        maximizeLabelFonts()

        let fontAttributes = [NSAttributedStringKey.font: appVisuals.fontStandard]
//        let myText = PublicClasses.labelPlateOutputFromCurrentPlatesInUse(["25.0 Kg", "55.0 lbs", "45.0 lbs", "20.0 Kg", "1.5 Kg", "2.5 lbs", "1.25 lbs", "2.5 Kg"])
//        print("myText")
//        print(myText)
//        let size = (myText as NSString).size(withAttributes: fontAttributes)

//        platesLabelWidthConstraint.constant = size.width + 20

        platesLabel.text = ""
        weightEntryTextFinder()
    }

    override func viewDidAppear(_ animated: Bool) {
        platesLabel.frame = CGRect(x: platesLabel.frame.minX, y: platesLabel.frame.minY, width: 200, height: platesLabel.frame.height)
//        GlobalVariables.sharedInstance.didLoad = true
//        GlobalVariables.sharedInstance.firstTime = true
        weightEntryTextFinder()
    }

    override func viewWillDisappear(_ animated: Bool) {
//        DataAccess.sharedInstance.saveEverything()
    }

   

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//        let displayLink = CADisplayLink(target: self, selector: #selector(KeyPadViewController.handleDisplayLink(_:)))
//        displayLink.add(to: RunLoop.main, forMode: RunLoopMode.commonModes)
//        coordinator.animate(alongsideTransition: nil, completion: {
//            _ in
//            displayLink.invalidate()
//        })
    }


    @objc func handleDisplayLink(_ displayLink: CADisplayLink) {
        self.view.endEditing(true)
        self.dismissPopovers()
        self.maximizeLabelFonts()
        self.setupGradientLayer()
        let origText: String = platesLabel.text
//        let myText = PublicClasses.labelPlateOutputFromCurrentPlatesInUse(["25.0 Kg", "55.0 lbs", "45.0 lbs", "20.0 Kg", "1.5 Kg", "2.5 lbs", "1.25 lbs", "2.5 Kg"])
//        let fontAttributes = [NSAttributedStringKey.font: appVisuals.fontStandard] // it says name, but a UIFont works
//        let size = (myText as NSString).size(withAttributes: fontAttributes)
        if origText == "" {
            platesLabel.text = ""
        }
        else {
            platesLabel.text = origText
        }
//        platesLabelWidthConstraint.constant = size.width + 20
//
//        PublicClasses.updateTextViewFont(self.platesLabel, maxTextSize: GlobalVariables.sharedInstance.currentMaxFont)
//        PublicClasses.drawPlates(self.platesView)

        self.barTextInput.layer.cornerRadius = 0.5 * barTextInput.bounds.size.height
        self.GoButton.layer.cornerRadius = 0.5 * GoButton.bounds.size.height
    }


    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        UIView.animate(withDuration: 0.1, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.platesView.alpha = 0
        }, completion: nil)
    }

    @IBAction func RemoveButtonAction(_ sender: AnyObject) {
        self.view.endEditing(true)
//        PublicClasses.removeButtonAction(weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton, titleLabel: nil)
    }

    @IBAction func PercentButtonAction(_ sender: AnyObject) {
//        PublicClasses.percentButtonAction(weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton, titleLabel: nil)
    }
//
    func setToWeightTextField() {
//        weightEntryTextField.floatingLabel.attributedText = NSLocalizedString("Total weight", comment: "")
        weightEntryTextField.placeholder = appCalcs.weightToLiftString
        weightEntryTextField.keyboardType = .decimalPad
    }

    @IBAction func GoButtonAction(_ sender: AnyObject) {
//        PublicClasses.goButtonAction(weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton, titleLabel: nil)
    }

    func dismissPopovers() {
        if presentedViewController?.isViewLoaded == true {
            self.presentedViewController!.dismiss(animated: false, completion: nil)
            self.presentedViewController!.navigationController?.popViewController(animated: true)
        }
    }

    @objc func iCloudOverwroteData() {
//        //        print("iCloudOverwroteData")
//        //         PublicClasses.switchUnitsToWrap(GlobalVariables.sharedInstance.units, weightEntryTextField: weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton, titleLabel: nil)
//        //        PublicClasses.resetEverything(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil, animate: true)
    }

    @objc func iCloudFirstTime() {
//        //        print("iCloudFirstTime")
//        //        PublicClasses.switchUnitsToWrap(GlobalVariables.sharedInstance.units, weightEntryTextField: weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton, titleLabel: nil, overwriteValues: false)
//        //        self.updatePageProtocol()
    }

    @objc func updatePageProtocol() {
//        PublicClasses.switchUnitsToWrap(GlobalVariables.sharedInstance.units, weightEntryTextField: weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton, titleLabel: nil, overwriteValues: false)
//        PublicClasses.updatePage(weightEntryTextField, platesView: platesView, platesLabel: platesLabel)
//        PublicClasses.setPlatesButtonsEnabledStatus(self.platesLabel, FiftyFiveLbsButton: self.FiftyFiveLbsButton, FortyFiveLbsButton: self.FortyFiveLbsButton, ThirtyFiveLbsButton: self.ThirtyFiveLbsButton, TwentyFiveLbsButton: self.TwentyFiveLbsButton, FifteenLbsButton: self.FifteenLbsButton, TenLbsButton: self.TenLbsButton, FiveLbsButton: self.FiveLbsButton, TwoPointFiveLbsButton: self.TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: self.OnePointTwoFiveLbsButton, weightEntryTextField: self.weightEntryTextField, platesView: self.platesView)
//        platesLabel.text = PublicClasses.labelPlateOutputFromCurrentPlatesInUse(GlobalVariables.sharedInstance.currentPlatesInUse)
//        PublicClasses.setToWeightTextField(weightEntryTextField, platesView: platesView)
    }

    @objc func iCloudNewDataFetched() {
//        //        print("iCloudNewDataFetched")
//        //        PublicClasses.switchUnitsToWrap(GlobalVariables.sharedInstance.units, weightEntryTextField: weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton, titleLabel: nil, overwriteValues: false)
    }

    @objc func iCloudNewDataFetchedNeedsReset() {
//        //print("iCloudNewDataFetchedNeedsReset")
//        //        PublicClasses.switchUnitsToWrap(GlobalVariables.sharedInstance.units, weightEntryTextField: weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton, titleLabel: nil)
//        //        PublicClasses.resetEverything(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil, animate: true)
    }
//




    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
//        presentCustomizedPrompt()
    }




    func textFieldDidEndEditing(_ textField: UITextField) {
//        var placeholderText: String = textField.text!
//        placeholderText = PublicClasses.removeUnitsFromText(placeholderText)
//        if placeholderText.characters.count > 0 {
//            if GlobalVariables.sharedInstance.percentageModeActive == true {
//                textField.text = PublicClasses.numberFormatterPercent.string(from: (PublicClasses.numberFormatterDecimal.number(from: placeholderText)!.doubleValue/100).roundToPlaces(2) as NSNumber)
//            }
//            else {
//                textField.text = PublicClasses.massFormatter.string(fromValue: PublicClasses.numberFormatterDecimal.number(from: placeholderText)!.doubleValue.roundToPlaces(GlobalVariables.sharedInstance.currentDecimalPlaces), unit: GlobalVariables.sharedInstance.unitsFormatter)
//            }
//        }
//        else {
//            weightEntryTextField.placeholder = GlobalVariables.sharedInstance.weightToLiftString
//            weightEntryTextField.setTitleVisible(false, animated: true, animationCompletion: { (Bool) in
//                PublicClasses.setToWeightTextField(self.weightEntryTextField, platesView: self.platesView)
//            })
//        }
    }
//
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let placeholderText: String = textField.text!
//        weightEntryTextField.setTitleVisible(true, animated: true)
//        textField.text = PublicClasses.removeUnitsFromText(placeholderText)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { // return NO to not change
        var result: Bool = false
        if appStatus.percentageModeActive == true {
//            result = PublicClasses.textFieldDecimalVerification(textField, range: range, string: string, GoButton: GoButton, maxDecimalPlaces: 0, maxIntegerPlaces: 3, percentageMode: GlobalVariables.sharedInstance.percentageModeActive)
        }
        else {
//            result = PublicClasses.textFieldDecimalVerification(textField, range: range, string: string, GoButton: GoButton, maxDecimalPlaces: GlobalVariables.sharedInstance.currentDecimalPlaces, maxIntegerPlaces: 4, percentageMode: GlobalVariables.sharedInstance.percentageModeActive)
//            self.weightEntryTextField.title = NSLocalizedString("Total weight", comment: "")
            //            GlobalVariables.sharedInstance.weightToLift = GlobalVariables.sharedInstance.currentBarWeight + GlobalVariables.sharedInstance.currentCollarWeight
            //            GlobalVariables.sharedInstance.currentPlatesInUse = [Double]()
            //            PublicClasses.drawPlates(self.platesView)
        }
        if result == true && self.platesLabel.alpha != 0 {
            self.platesLabel.alpha = 1
            self.platesView.alpha = 1
            UIView.animate(withDuration: appVisuals.platesFadeDuration, delay: 0.0, options: [], animations: {
                self.platesLabel.alpha = 0
                self.platesView.alpha = 0
            }, completion: {
                (value: Bool) in
                self.platesLabel.text = ""
            })

            appStatus.errorState = false
//            self.weightEntryTextField.errorMessage = ""
            //            PublicClasses.setPlatesButtonsEnabledStatus(self.platesLabel, FiftyFiveLbsButton: self.FiftyFiveLbsButton, FortyFiveLbsButton: self.FortyFiveLbsButton, ThirtyFiveLbsButton: self.ThirtyFiveLbsButton, TwentyFiveLbsButton: self.TwentyFiveLbsButton, FifteenLbsButton: self.FifteenLbsButton, TenLbsButton: self.TenLbsButton, FiveLbsButton: self.FiveLbsButton, TwoPointFiveLbsButton: self.TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: self.OnePointTwoFiveLbsButton, weightEntryTextField: self.weightEntryTextField, platesView: self.platesView)
        }
        return result
    }

    func switchUnitsToWrapDelegate(_ unit: String) {
//        PublicClasses.switchUnitsToWrap(unit, weightEntryTextField: weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton, titleLabel: nil)
    }
//
    func setupGradientLayer() {
        gradientLayer.removeFromSuperlayer()
        let topColor = appVisuals.gradientColor1.cgColor as CGColor
        let bottomColor =  appVisuals.gradientColor2.cgColor as CGColor
        let deviceScale = UIScreen.main.scale
        gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width * deviceScale, height: self.view.frame.size.height * deviceScale)
        gradientLayer.colors = [topColor, bottomColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.2, y: 0.2)
        //        gradientLayer.backgroundColor = GlobalVariables.sharedInstance.gradientColor1.CGColor
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }




    func setupInitialViews() {
        self.setupGradientLayer()
        self.view.backgroundColor = appVisuals.gradientColor1
//        PublicClasses.updateTextViewFont(platesLabel,maxTextSize: GlobalVariables.sharedInstance.currentMaxFont)
        self.view.backgroundColor=appVisuals.mainColor
        var titleFontName = "Helvetica"
        print(NSLocale.preferredLanguages as [String])
        let preferredLanguage = NSLocale.preferredLanguages[0] as String
        appVisuals.titleVerticalAdjustment = 3.5
        if preferredLanguage == "ja" {
            appVisuals.titleVerticalAdjustment = -1
//            titleFontName = "HiraginoSans-W6"
        }
        else if preferredLanguage == "ru" {
            appVisuals.titleVerticalAdjustment = 3.5
//            titleFontName = "StampborGrunge"
        }
//        else if preferredLanguage == "ko" {
//            titleFontName = "HelveticaNeue-CondensedBold"
//        }
//        else if preferredLanguage == "zh-Hans" {
//            titleFontName = "HelveticaNeue-CondensedBold"
//        }
        appVisuals.fontTitle = UIFont.init(name: titleFontName, size: 28)!
        let bigLabel: UILabel = UILabel()
        bigLabel.text = NSLocalizedString("Plates", comment: "")
        bigLabel.backgroundColor = UIColor.clear
        bigLabel.textColor = appVisuals.secondaryColor
        bigLabel.font = appVisuals.fontTitle
        bigLabel.adjustsFontSizeToFitWidth = true
        bigLabel.sizeToFit()
        self.navigationItem.titleView = bigLabel



        navigationController?.navigationBar.setTitleVerticalPositionAdjustment(appVisuals.titleVerticalAdjustment, for: .default)
//        self.navigationController?.hidesNavigationBarHairline = true
        let tintedImage = UIImage(named: "settingsIcon")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
//                navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: GlobalVariables.sharedInstance.secondaryColor, NSFontAttributeName: GlobalVariables.sharedInstance.fontTitle!]
        navigationController!.navigationBar.barTintColor = appVisuals.textPadColor
        One_One_View.backgroundColor = appVisuals.textPadColor
        One_Two_View.backgroundColor = appVisuals.textPadColor
        One_Three_View.backgroundColor = appVisuals.textPadColor
        One_Four_View.backgroundColor = appVisuals.textPadColor
        Two_One_View.backgroundColor = appVisuals.textPadColor
        Two_Two_View.backgroundColor = appVisuals.textPadColor
        Two_Three_View.backgroundColor = appVisuals.textPadColor
        Two_Four_View.backgroundColor = appVisuals.textPadColor
        Three_One_View.backgroundColor = appVisuals.textPadColor
        Three_Two_View.backgroundColor = appVisuals.textPadColor
        Three_Three_View.backgroundColor = appVisuals.textPadColor
        Three_Four_View.backgroundColor = appVisuals.textPadColor
        Four_One_View.backgroundColor = appVisuals.textPadColor
        Four_Two_View.backgroundColor = appVisuals.textPadColor
        Four_Three_View.backgroundColor = appVisuals.textPadColor
        Four_Four_View.backgroundColor = appVisuals.textPadColor
        FiftyFiveLbsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        FortyFiveLbsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        ThirtyFiveLbsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        TwentyFiveLbsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        FifteenLbsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        TenLbsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        RemoveButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        FiveLbsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        TwoPointFiveLbsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        OnePointTwoFiveLbsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        PercentButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        ClearButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        BarbellButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        CollarsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        InventoryButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        UnitsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        GoButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        keyPadBackgroundView.backgroundColor = appVisuals.keyPadBackgroundViewColor
        navBarButton.setImage(tintedImage, for: UIControlState.normal)
        navBarButton.tintColor =  appVisuals.secondaryColor
//        navBarButton.addTarget(self, action: #selector(KeyPadViewController.rightBarButtonPressed), for: UIControlEvents.touchUpInside)
        navBarButton.frame = CGRect(x:0, y: 0,width: 31, height: 31)
        navBarButton.titleLabel?.adjustsFontSizeToFitWidth = true
        navBarButton.setTitle("", for: .normal)
        barTextInput.backgroundColor = UIColor.white
        platesLabel.text = ""
        platesLabel.accessibilityLabel = "Plate calculation output"
        platesLabel.accessibilityHint = "Output showing the plates needed on each side"
        platesLabel.font = appVisuals.fontStandard
        platesLabel.textColor = appVisuals.secondaryTextColor
        platesLabel.isUserInteractionEnabled = false
        hiddenHeightKeepingLabel.titleLabel?.font = appVisuals.fontStandard.withSize(appVisuals.currentMaxFont)
        //        hiddenHeightKeepingLabel.isHidden = true
        GoButton.setTitleColor(appVisuals.secondaryTextColor, for: UIControlState.normal)
        GoButton.backgroundColor = appVisuals.secondaryColor
        GoButton.titleLabel?.allowsDefaultTighteningForTruncation = true
        GoButton.titleLabel?.adjustsFontSizeToFitWidth = true
        GoButton.isEnabled = false
        GoButton.titleLabel?.minimumScaleFactor = 0.01
        GoButton.titleLabel?.font = appVisuals.fontStandard
        GoButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        GoButton.setTitle(NSLocalizedString("Calculate", comment: ""), for: .normal)
        GoButton.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        FiftyFiveLbsButton.titleLabel!.font = appVisuals.fontStandard
        FiftyFiveLbsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
        FiftyFiveLbsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        FiftyFiveLbsButton.setTitleColor(appVisuals.defaultTextColor, for: UIControlState.normal)
        FiftyFiveLbsButton.setTitleColor(appVisuals.placeholderColor, for: UIControlState.disabled)
        FortyFiveLbsButton.titleLabel!.font = appVisuals.fontStandard
        FortyFiveLbsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
        FortyFiveLbsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        FortyFiveLbsButton.setTitleColor(appVisuals.defaultTextColor, for: UIControlState.normal)
        FortyFiveLbsButton.setTitleColor(appVisuals.placeholderColor, for: UIControlState.disabled)
        ThirtyFiveLbsButton.titleLabel!.font = appVisuals.fontStandard
        ThirtyFiveLbsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
        ThirtyFiveLbsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        ThirtyFiveLbsButton.setTitleColor(appVisuals.defaultTextColor, for: UIControlState.normal)
        ThirtyFiveLbsButton.setTitleColor(appVisuals.placeholderColor, for: UIControlState.disabled)
        TwentyFiveLbsButton.titleLabel!.font = appVisuals.fontStandard
        TwentyFiveLbsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
        TwentyFiveLbsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        TwentyFiveLbsButton.setTitleColor(appVisuals.defaultTextColor, for: UIControlState.normal)
        TwentyFiveLbsButton.setTitleColor(appVisuals.placeholderColor, for: UIControlState.disabled)
        FifteenLbsButton.titleLabel!.font = appVisuals.fontStandard
        FifteenLbsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
        FifteenLbsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        FifteenLbsButton.setTitleColor(appVisuals.defaultTextColor, for: UIControlState.normal)
        FifteenLbsButton.setTitleColor(appVisuals.placeholderColor, for: UIControlState.disabled)
        TenLbsButton.titleLabel!.font = appVisuals.fontStandard
        TenLbsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
        TenLbsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        TenLbsButton.setTitleColor(appVisuals.defaultTextColor, for: UIControlState.normal)
        TenLbsButton.setTitleColor(appVisuals.placeholderColor, for: UIControlState.disabled)
        RemoveButton.titleLabel!.font = appVisuals.fontStandard
        RemoveButton.titleLabel!.adjustsFontSizeToFitWidth = true;
        RemoveButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        RemoveButton.setTitleColor(appVisuals.defaultTextColor, for: UIControlState.normal)
        RemoveButton.setTitleColor(appVisuals.placeholderColor, for: UIControlState.disabled)
        FiveLbsButton.titleLabel!.font = appVisuals.fontStandard
        FiveLbsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
        FiveLbsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        FiveLbsButton.setTitleColor(appVisuals.defaultTextColor, for: UIControlState.normal)
        FiveLbsButton.setTitleColor(appVisuals.placeholderColor, for: UIControlState.disabled)
        TwoPointFiveLbsButton.titleLabel!.font = appVisuals.fontStandard
        TwoPointFiveLbsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
        TwoPointFiveLbsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        TwoPointFiveLbsButton.setTitleColor(appVisuals.defaultTextColor, for: UIControlState.normal)
        TwoPointFiveLbsButton.setTitleColor(appVisuals.placeholderColor, for: UIControlState.disabled)
        OnePointTwoFiveLbsButton.titleLabel!.font = appVisuals.fontStandard
        OnePointTwoFiveLbsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
        OnePointTwoFiveLbsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        OnePointTwoFiveLbsButton.setTitleColor(appVisuals.defaultTextColor, for: UIControlState.normal)
        OnePointTwoFiveLbsButton.setTitleColor(appVisuals.placeholderColor, for: UIControlState.disabled)
//        PercentButton.setTitle(PublicClasses.numberFormatterDecimal.percentSymbol, for: .normal)
        PercentButton.titleLabel!.font = appVisuals.fontStandard
        PercentButton.titleLabel!.adjustsFontSizeToFitWidth = true;
        PercentButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        PercentButton.contentVerticalAlignment = .center
        PercentButton.contentHorizontalAlignment = .center
        PercentButton.setTitleColor(appVisuals.defaultTextColor, for: UIControlState.normal)
        PercentButton.setTitleColor(appVisuals.placeholderColor, for: UIControlState.disabled)
        ClearButton.titleLabel!.font = appVisuals.fontStandard
        ClearButton.titleLabel!.adjustsFontSizeToFitWidth = true;
        ClearButton.setTitle(NSLocalizedString("Clear", comment: ""), for: .normal)
        ClearButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        ClearButton.contentVerticalAlignment = .center
        ClearButton.contentHorizontalAlignment = .center
        ClearButton.setTitleColor(appVisuals.defaultTextColor, for: UIControlState.normal)
        ClearButton.setTitleColor(appVisuals.placeholderColor, for: UIControlState.disabled)
        BarbellButton.titleLabel!.font = appVisuals.fontStandard
        BarbellButton.titleLabel!.adjustsFontSizeToFitWidth = true;
        BarbellButton.setTitleColor(appVisuals.defaultTextColor, for: UIControlState.normal)
        BarbellButton.setTitleColor(appVisuals.placeholderColor, for: UIControlState.disabled)
        BarbellButton.setTitle(NSLocalizedString("Bar", comment: ""), for: .normal)
        BarbellButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        BarbellButton.contentVerticalAlignment = .center
        PercentButton.contentHorizontalAlignment = .center
        CollarsButton.titleLabel!.font = appVisuals.fontStandard
        CollarsButton.setTitle(NSLocalizedString("Collar", comment: ""), for: .normal)
        CollarsButton.contentVerticalAlignment = .center
        CollarsButton.contentHorizontalAlignment = .center
        CollarsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
        CollarsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        CollarsButton.setTitleColor(appVisuals.defaultTextColor, for: UIControlState.normal)
        CollarsButton.setTitleColor(appVisuals.placeholderColor, for: UIControlState.disabled)
        InventoryButton.titleLabel!.font = appVisuals.fontStandard
        InventoryButton.titleLabel!.adjustsFontSizeToFitWidth = true;
        InventoryButton.contentVerticalAlignment = .center
        InventoryButton.contentHorizontalAlignment = .center
        InventoryButton.setTitle(NSLocalizedString("Gym", comment: ""), for: .normal)
        InventoryButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        InventoryButton.setTitleColor(appVisuals.defaultTextColor, for: UIControlState.normal)
        InventoryButton.setTitleColor(appVisuals.placeholderColor, for: UIControlState.disabled)
        UnitsButton.titleLabel!.font = appVisuals.fontStandard
        UnitsButton.contentVerticalAlignment = .center
        UnitsButton.contentHorizontalAlignment = .center
        UnitsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
        UnitsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        UnitsButton.setTitleColor(appVisuals.defaultTextColor, for: UIControlState.normal)
        UnitsButton.setTitleColor(appVisuals.placeholderColor, for: UIControlState.disabled)
        weightEntryTextField.text = ""
        weightEntryTextField.textColor = appVisuals.secondaryTextColor
//        weightEntryTextField.errorColor = appVisuals.errorColor
        weightEntryTextField.delegate = self
        weightEntryTextField.tag = 1
        setToWeightTextField()
        weightEntryTextField.font =  appVisuals.fontStandard
//        weightEntryTextField.placeholderFont =  appVisuals.fontStandard
        //        weightEntryTextField.iconFont =  appVisuals.fontStandard
//        weightEntryTextField.titleLabel.font = appVisuals.fontTextFieldRiser
        //        weightEntryTextField.minimumFontSize = 0.01
//        weightEntryTextField.titleLabel.minimumScaleFactor = 0.01
//        weightEntryTextField.titleLabel.adjustsFontSizeToFitWidth = true
        //        weightEntryTextField.selectedIconColor = appVisuals.defaultTextColor
        weightEntryTextField.placeholderColor = appVisuals.placeholderColor
//        weightEntryTextField.lineColor = GlobalVariables.sharedInstance.secondaryColor
        weightEntryTextField.tintColor = appVisuals.placeholderColor
        weightEntryTextField.accessibilityLabel = "Weight entry"
        weightEntryTextField.accessibilityHint = "Shows the current weight to lift. Tap to type in another weight to calculate. If the percent button is active, type in the percent you want to multiply the current weight to lift by."
        weightEntryTextField.floatingLabelActiveTextColor = appVisuals.secondaryColor
        weightEntryTextField.floatingLabelTextColor = appVisuals.secondaryColor
//        weightEntryTextField.selectedLineColor = GlobalVariables.sharedInstance.secondaryTextColor
//        weightEntryTextField.titleFadeInDuration = GlobalVariables.sharedInstance.animationTime
//        weightEntryTextField.titleFadeOutDuration = GlobalVariables.sharedInstance.animationTime
        weightEntryTextField.keyboardType = .decimalPad

        barTextInput.superview?.bringSubview(toFront: barTextInput)
        weightEntryTextField.superview?.bringSubview(toFront: weightEntryTextField)
        GoButton.superview?.bringSubview(toFront: GoButton)

//        self.platesLabel.addShadow(offset: CGSize(width: 0, height: 0), color: UIColor.black, radius: 4, opacity: 0.4)
//        self.barTextInput.addShadow(offset: CGSize(width: 0, height: 0), color: UIColor.black, radius: 4, opacity: 0.4)
//        self.keyPadBackgroundView.addShadow(offset: CGSize(width: 0, height: 0), color: UIColor.black, radius: 4, opacity: 0.4)
//        self.platesView.addShadow(offset: CGSize(width: 0, height: 0), color: UIColor.black, radius: 4, opacity: 0.4)


        self.view.addSubview(weightEntryTextField)

        self.view.addSubview(weightOutputLabel)
        self.view.bringSubview(toFront: GoButton)
        let goButtonBottomContraints = NSLayoutConstraint(item: self.GoButton, attribute: .bottom, relatedBy: .equal, toItem: self.weightEntryTextField, attribute: .bottom, multiplier: 1.0, constant: 3)
        horizonalLeftContraints = NSLayoutConstraint(item: self.weightEntryTextField, attribute: .leadingMargin, relatedBy: .equal, toItem: self.barTextInput, attribute: .leadingMargin, multiplier: 1.0, constant: 20)
        let horizonalRightContraints = NSLayoutConstraint(item: self.weightEntryTextField, attribute: .trailingMargin, relatedBy: .equal, toItem: self.GoButton, attribute: .leadingMargin, multiplier: 1.0, constant: -30)
        let weightEntryTextFieldBottom = NSLayoutConstraint(item: self.weightEntryTextField, attribute: .bottom, relatedBy: .equal, toItem: self.One_One_View, attribute: .top, multiplier: 1, constant: -10)
        let platesLabelTextField = NSLayoutConstraint(item: self.platesLabel, attribute: .bottom, relatedBy: NSLayoutRelation.equal, toItem: self.weightEntryTextField, attribute: .top, multiplier: 1, constant: 0)
        let expectSize = self.weightEntryTextField.sizeThatFits(CGSize(width: self.weightEntryTextField.frame.size.width, height: CGFloat(MAXFLOAT)));
        weightEntryTextFieldHeight = NSLayoutConstraint(item: self.weightEntryTextField, attribute: .height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: expectSize.height+8)
        self.barTextInput.translatesAutoresizingMaskIntoConstraints = false
        self.GoButton.translatesAutoresizingMaskIntoConstraints = false
        self.platesLabel.translatesAutoresizingMaskIntoConstraints = false
        self.weightEntryTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([weightEntryTextFieldHeight,platesLabelTextField,goButtonBottomContraints,horizonalLeftContraints, horizonalRightContraints,weightEntryTextFieldBottom])
        self.view.layoutIfNeeded()
    }

    func maximizeLabelFonts() {
//        var pointSizeTotal: CGFloat = GlobalVariables.sharedInstance.defaultFontSize
//        let GoButtonTemp: UIButton = GoButton
//        if NSLocalizedString("Optimize", comment: "").characters.count >  NSLocalizedString("Calculate", comment: "").characters.count {
//            GoButtonTemp.setTitle(NSLocalizedString("Optimize", comment: ""), for: .normal)
//        }
//        else {
//            GoButtonTemp.setTitle(NSLocalizedString("Calculate", comment: ""), for: .normal)
//        }
//
//        var viewsToMaximizeBottomFour: [UIButton] = [InventoryButton, BarbellButton, CollarsButton, ClearButton]
//        var pointSizesFour: [CGFloat] = [GlobalVariables.sharedInstance.defaultFontSize,GlobalVariables.sharedInstance.defaultFontSize,GlobalVariables.sharedInstance.defaultFontSize,GlobalVariables.sharedInstance.defaultFontSize]
//        for viewToMaximize in viewsToMaximizeBottomFour {
//            let frameToUse = CGRect(x: viewToMaximize.frame.minX, y: viewToMaximize.frame.minY, width: self.view.frame.width/4-10, height: min(viewToMaximize.frame.height,44))
//            let pointSizeTest = PublicClasses.getFontSizeToFitFrameOfLabel(viewToMaximize, maxTextSize: pointSizeTotal, frameToFit: frameToUse)
//            if pointSizeTest >= min(pointSizeTotal * 0.9, pointSizeTotal - 2)  {
//            }
//            else {
//                let minPointSize = min(pointSizesFour.min()!, pointSizeTest)
//                pointSizesFour[viewsToMaximizeBottomFour.index(of: viewToMaximize)!] = minPointSize
//            }
//        }
//        if viewsToMaximizeBottomFour.count >= 0 {
//            print("smallerThanCount test success")
//            for viewToMaximize in viewsToMaximizeBottomFour {
//                viewToMaximize.titleLabel!.font = Font.systemFont(ofSize: pointSizesFour[viewsToMaximizeBottomFour.index(of: viewToMaximize)!], weight: UIFont.Weight.thin)
//            }
//        }
//        weightEntryTextField.font = appVisuals.fontStandard
//        weightEntryTextField.placeholderFont = appVisuals.fontStandard
//        weightEntryTextField.titleLabel.font = GlobalVariables.sharedInstance.fontTextFieldRiser
//
//
//
//
//        hiddenHeightKeepingLabel.titleLabel?.font = appVisuals.fontStandard
//        print(hiddenHeightKeepingLabel.frame.size)
//
//        let textViewSize = self.weightEntryTextField.frame.size;
//        let expectSize = self.weightEntryTextField.sizeThatFits(CGSize(width: textViewSize.width, height: CGFloat(MAXFLOAT)));
//        weightEntryTextFieldHeight.constant = expectSize.height+8
//        self.view.layoutIfNeeded()
//        let expectSizeGoButton = GoButtonTemp.sizeThatFits(CGSize(width: CGFloat(MAXFLOAT), height: GoButtonTemp.frame.size.height));
//        goButtonWidthConstraint.constant = min(max(expectSizeGoButton.width + 20, UIScreen.main.bounds.width/4),UIScreen.main.bounds.width/2-20)
//        //                horizonalLeftContraints.constant = 0.5 * GoButton.bounds.size.height
//        weightEntryTextFinder()
//        barTextInput.layer.cornerRadius = 0.5 * GoButton.bounds.size.height
//        GoButton.layer.cornerRadius = 0.5 * GoButton.bounds.size.height
    }

    func weightEntryTextFinder() {
//        let weightEntryTextFieldButtonTemp = UIButton(frame: weightEntryTextField.frame)
//        weightEntryTextFieldButtonTemp.setTitle(NSLocalizedString("Weight to lift", comment: ""), for: .normal)
//        weightEntryTextFieldButtonTemp.titleLabel?.font = Font.systemFont(ofSize: GlobalVariables.sharedInstance.currentMaxFont, weight: UIFont.Weight.thin)
//        let pointSizeWeightEntryTextField = PublicClasses.getFontSizeToFitFrameOfLabel(weightEntryTextFieldButtonTemp, maxTextSize: GlobalVariables.sharedInstance.currentMaxFont, frameToFit: weightEntryTextField.frame)
//        if pointSizeWeightEntryTextField < GlobalVariables.sharedInstance.currentMaxFont {
//            GlobalVariables.sharedInstance.weightToLiftString = NSLocalizedString("Weight", comment: "")
//        }
//        else {
//            GlobalVariables.sharedInstance.weightToLiftString = NSLocalizedString("Weight to lift", comment: "")
//        }
//        weightEntryTextField.placeholder = GlobalVariables.sharedInstance.weightToLiftString
    }

    func updateButtonsEnabledProtocol() {
//        PublicClasses.setPlatesButtonsEnabledStatus(self.platesLabel, FiftyFiveLbsButton: self.FiftyFiveLbsButton, FortyFiveLbsButton: self.FortyFiveLbsButton, ThirtyFiveLbsButton: self.ThirtyFiveLbsButton, TwentyFiveLbsButton: self.TwentyFiveLbsButton, FifteenLbsButton: self.FifteenLbsButton, TenLbsButton: self.TenLbsButton, FiveLbsButton: self.FiveLbsButton, TwoPointFiveLbsButton: self.TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: self.OnePointTwoFiveLbsButton, weightEntryTextField: self.weightEntryTextField, platesView: self.platesView)
    }

    func drawPlatesProtocol() {
//        PublicClasses.drawPlates(self.platesView)
    }
    
    func resetEverythingProtocol() {
//        PublicClasses.resetEverything(platesLabel, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, weightEntryTextField: weightEntryTextField, platesView: platesView, GoButton: GoButton, titleLabel: nil)
//        PublicClasses.switchUnitsToWrap(GlobalVariables.sharedInstance.units, weightEntryTextField: weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton, titleLabel: nil)
    }

}

