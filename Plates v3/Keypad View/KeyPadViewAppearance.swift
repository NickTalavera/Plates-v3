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

class KeyPadViewController: UIViewController, UITextFieldDelegate, UIPopoverPresentationControllerDelegate, MainDelegate {

    //Delegates
    weak var delegate:MainDelegate?
    //Storyboard links
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
    @IBOutlet weak var navigationBar: UINavigationItem!
    //Constants
    var weightEntryTextField: JVFloatLabeledTextField = JVFloatLabeledTextField(frame: CGRect(x: 150, y: 10, width: 300, height: 45))
    //    let managedObjectContext = DataAccess.sharedInstance.managedObjectContext
    var weightEntryTextFieldHeight: NSLayoutConstraint = NSLayoutConstraint()
    var horizonalLeftContraints: NSLayoutConstraint = NSLayoutConstraint()
    let gradientLayer: CAGradientLayer = CAGradientLayer() //CHECK?
    
    //CHECK
    //    let keyPadViewIdentifier: String = "keyPadIdentifier" //CHECK?
    //    var titleLabel: UILabel = UILabel() //CHECK?
    //    var saveFile : NSManagedObject! //CHECK?
    //    var percentageModeActive: Bool = false //CHECK?
    
    
    func setupInitialViews() {
//        //LAYOUT SETUP
//        barTextInput.layer.cornerRadius = 0.5 * GoButton.bounds.size.height
//        GoButton.layer.cornerRadius = 0.5 * GoButton.bounds.size.height
//        barTextInput.clipsToBounds = true
//        GoButton.clipsToBounds = true
//        //BUTTON SETUP
//        PublicClasses.switchUnitsTo(app.profile.chosenUnit.unit, weightEntryTextField: weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton)
//        self.setupGradientLayer()
//        self.view.backgroundColor = app.visuals.gradientColor1
//        weightEntryTextField.alwaysShowFloatingLabel = true
//        //        PublicClasses.updateTextViewFont(platesLabel,maxTextSize: GlobalVariables.sharedInstance.currentMaxFont)
//        self.view.backgroundColor=app.visuals.mainColor
//        var titleFontName = "Helvetica"
//        print(NSLocale.preferredLanguages as [String])
//        let preferredLanguage = NSLocale.preferredLanguages[0] as String
//        app.visuals.titleVerticalAdjustment = 3.5
//        if preferredLanguage == "ja" {
//            app.visuals.titleVerticalAdjustment = -1
//            //            titleFontName = "HiraginoSans-W6"
//        }
//        else if preferredLanguage == "ru" {
//            app.visuals.titleVerticalAdjustment = 3.5
//            //            titleFontName = "StampborGrunge"
//        }
//        //        else if preferredLanguage == "ko" {
//        //            titleFontName = "HelveticaNeue-CondensedBold"
//        //        }
//        //        else if preferredLanguage == "zh-Hans" {
//        //            titleFontName = "HelveticaNeue-CondensedBold"
//        //        }
//        app.visuals.fontTitle = UIFont.init(name: titleFontName, size: 28)!
//        let bigLabel: UILabel = UILabel()
//        bigLabel.text = NSLocalizedString("Plates", comment: "")
//        bigLabel.backgroundColor = UIColor.clear
//        bigLabel.textColor = app.visuals.secondaryColor
//        bigLabel.font = app.visuals.fontTitle
//        bigLabel.adjustsFontSizeToFitWidth = true
//        bigLabel.sizeToFit()
//        self.navigationItem.titleView = bigLabel
//
//
//
//        navigationController?.navigationBar.setTitleVerticalPositionAdjustment(app.visuals.titleVerticalAdjustment, for: .default)
//        //        self.navigationController?.hidesNavigationBarHairline = true
//        let tintedImage = UIImage(named: "settingsIcon")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
//        //                navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: GlobalVariables.sharedInstance.secondaryColor, NSFontAttributeName: GlobalVariables.sharedInstance.fontTitle!]
//        navigationController!.navigationBar.barTintColor = app.visuals.textPadColor
//        One_One_View.backgroundColor = app.visuals.textPadColor
//        One_Two_View.backgroundColor = app.visuals.textPadColor
//        One_Three_View.backgroundColor = app.visuals.textPadColor
//        One_Four_View.backgroundColor = app.visuals.textPadColor
//        Two_One_View.backgroundColor = app.visuals.textPadColor
//        Two_Two_View.backgroundColor = app.visuals.textPadColor
//        Two_Three_View.backgroundColor = app.visuals.textPadColor
//        Two_Four_View.backgroundColor = app.visuals.textPadColor
//        Three_One_View.backgroundColor = app.visuals.textPadColor
//        Three_Two_View.backgroundColor = app.visuals.textPadColor
//        Three_Three_View.backgroundColor = app.visuals.textPadColor
//        Three_Four_View.backgroundColor = app.visuals.textPadColor
//        Four_One_View.backgroundColor = app.visuals.textPadColor
//        Four_Two_View.backgroundColor = app.visuals.textPadColor
//        Four_Three_View.backgroundColor = app.visuals.textPadColor
//        Four_Four_View.backgroundColor = app.visuals.textPadColor
//        FiftyFiveLbsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
//        FortyFiveLbsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
//        ThirtyFiveLbsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
//        TwentyFiveLbsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
//        FifteenLbsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
//        TenLbsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
//        RemoveButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
//        FiveLbsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
//        TwoPointFiveLbsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
//        OnePointTwoFiveLbsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
//        PercentButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
//        ClearButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
//        BarbellButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
//        CollarsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
//        InventoryButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
//        UnitsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
//        GoButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
//        keyPadBackgroundView.backgroundColor = app.visuals.keyPadBackgroundViewColor
//        navBarButton.setImage(tintedImage, for: UIControlState.normal)
//        navBarButton.tintColor =  app.visuals.secondaryColor
//        //        navBarButton.addTarget(self, action: #selector(KeyPadViewController.rightBarButtonPressed), for: UIControlEvents.touchUpInside)
//        navBarButton.frame = CGRect(x:0, y: 0,width: 31, height: 31)
//        navBarButton.titleLabel?.adjustsFontSizeToFitWidth = true
//        navBarButton.setTitle("", for: .normal)
//        barTextInput.backgroundColor = UIColor.white
//        platesLabel.text = ""
//        platesLabel.accessibilityLabel = "Plate calculation output"
//        platesLabel.accessibilityHint = "Output showing the plates needed on each side"
//        platesLabel.font = app.visuals.fontStandard
//        platesLabel.textColor = app.visuals.secondaryTextColor
//        platesLabel.isUserInteractionEnabled = false
//        hiddenHeightKeepingLabel.titleLabel?.font = app.visuals.fontStandard.withSize(app.visuals.currentMaxFont)
//        //        hiddenHeightKeepingLabel.isHidden = true
//        GoButton.setTitleColor(app.visuals.secondaryTextColor, for: UIControlState.normal)
//        GoButton.backgroundColor = app.visuals.secondaryColor
//        GoButton.titleLabel?.allowsDefaultTighteningForTruncation = true
//        GoButton.titleLabel?.adjustsFontSizeToFitWidth = true
//        GoButton.isEnabled = false
//        GoButton.titleLabel?.minimumScaleFactor = 0.01
//        GoButton.titleLabel?.font = app.visuals.fontStandard
//        GoButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
//        GoButton.setTitle(NSLocalizedString("Calculate", comment: ""), for: .normal)
//        GoButton.contentVerticalAlignment = UIControlContentVerticalAlignment.center
//        FiftyFiveLbsButton.titleLabel!.font = app.visuals.fontStandard
//        FiftyFiveLbsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
//        FiftyFiveLbsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
//        FiftyFiveLbsButton.setTitleColor(app.visuals.defaultTextColor, for: UIControlState.normal)
//        FiftyFiveLbsButton.setTitleColor(app.visuals.placeholderColor, for: UIControlState.disabled)
//        FortyFiveLbsButton.titleLabel!.font = app.visuals.fontStandard
//        FortyFiveLbsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
//        FortyFiveLbsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
//        FortyFiveLbsButton.setTitleColor(app.visuals.defaultTextColor, for: UIControlState.normal)
//        FortyFiveLbsButton.setTitleColor(app.visuals.placeholderColor, for: UIControlState.disabled)
//        ThirtyFiveLbsButton.titleLabel!.font = app.visuals.fontStandard
//        ThirtyFiveLbsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
//        ThirtyFiveLbsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
//        ThirtyFiveLbsButton.setTitleColor(app.visuals.defaultTextColor, for: UIControlState.normal)
//        ThirtyFiveLbsButton.setTitleColor(app.visuals.placeholderColor, for: UIControlState.disabled)
//        TwentyFiveLbsButton.titleLabel!.font = app.visuals.fontStandard
//        TwentyFiveLbsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
//        TwentyFiveLbsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
//        TwentyFiveLbsButton.setTitleColor(app.visuals.defaultTextColor, for: UIControlState.normal)
//        TwentyFiveLbsButton.setTitleColor(app.visuals.placeholderColor, for: UIControlState.disabled)
//        FifteenLbsButton.titleLabel!.font = app.visuals.fontStandard
//        FifteenLbsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
//        FifteenLbsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
//        FifteenLbsButton.setTitleColor(app.visuals.defaultTextColor, for: UIControlState.normal)
//        FifteenLbsButton.setTitleColor(app.visuals.placeholderColor, for: UIControlState.disabled)
//        TenLbsButton.titleLabel!.font = app.visuals.fontStandard
//        TenLbsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
//        TenLbsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
//        TenLbsButton.setTitleColor(app.visuals.defaultTextColor, for: UIControlState.normal)
//        TenLbsButton.setTitleColor(app.visuals.placeholderColor, for: UIControlState.disabled)
//        RemoveButton.titleLabel!.font = app.visuals.fontStandard
//        RemoveButton.titleLabel!.adjustsFontSizeToFitWidth = true;
//        RemoveButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
//        RemoveButton.setTitleColor(app.visuals.defaultTextColor, for: UIControlState.normal)
//        RemoveButton.setTitleColor(app.visuals.placeholderColor, for: UIControlState.disabled)
//        FiveLbsButton.titleLabel!.font = app.visuals.fontStandard
//        FiveLbsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
//        FiveLbsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
//        FiveLbsButton.setTitleColor(app.visuals.defaultTextColor, for: UIControlState.normal)
//        FiveLbsButton.setTitleColor(app.visuals.placeholderColor, for: UIControlState.disabled)
//        TwoPointFiveLbsButton.titleLabel!.font = app.visuals.fontStandard
//        TwoPointFiveLbsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
//        TwoPointFiveLbsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
//        TwoPointFiveLbsButton.setTitleColor(app.visuals.defaultTextColor, for: UIControlState.normal)
//        TwoPointFiveLbsButton.setTitleColor(app.visuals.placeholderColor, for: UIControlState.disabled)
//        OnePointTwoFiveLbsButton.titleLabel!.font = app.visuals.fontStandard
//        OnePointTwoFiveLbsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
//        OnePointTwoFiveLbsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
//        OnePointTwoFiveLbsButton.setTitleColor(app.visuals.defaultTextColor, for: UIControlState.normal)
//        OnePointTwoFiveLbsButton.setTitleColor(app.visuals.placeholderColor, for: UIControlState.disabled)
//        //        PercentButton.setTitle(PublicClasses.numberFormatterDecimal.percentSymbol, for: .normal)
//        PercentButton.titleLabel!.font = app.visuals.fontStandard
//        PercentButton.titleLabel!.adjustsFontSizeToFitWidth = true;
//        PercentButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
//        PercentButton.contentVerticalAlignment = .center
//        PercentButton.contentHorizontalAlignment = .center
//        PercentButton.setTitleColor(app.visuals.defaultTextColor, for: UIControlState.normal)
//        PercentButton.setTitleColor(app.visuals.placeholderColor, for: UIControlState.disabled)
//        ClearButton.titleLabel!.font = app.visuals.fontStandard
//        ClearButton.titleLabel!.adjustsFontSizeToFitWidth = true;
//        ClearButton.setTitle(NSLocalizedString("Clear", comment: ""), for: .normal)
//        ClearButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
//        ClearButton.contentVerticalAlignment = .center
//        ClearButton.contentHorizontalAlignment = .center
//        ClearButton.setTitleColor(app.visuals.defaultTextColor, for: UIControlState.normal)
//        ClearButton.setTitleColor(app.visuals.placeholderColor, for: UIControlState.disabled)
//        BarbellButton.titleLabel!.font = app.visuals.fontStandard
//        BarbellButton.titleLabel!.adjustsFontSizeToFitWidth = true;
//        BarbellButton.setTitleColor(app.visuals.defaultTextColor, for: UIControlState.normal)
//        BarbellButton.setTitleColor(app.visuals.placeholderColor, for: UIControlState.disabled)
//        BarbellButton.setTitle(NSLocalizedString("Bar", comment: ""), for: .normal)
//        BarbellButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
//        BarbellButton.contentVerticalAlignment = .center
//        PercentButton.contentHorizontalAlignment = .center
//        CollarsButton.titleLabel!.font = app.visuals.fontStandard
//        CollarsButton.setTitle(NSLocalizedString("Collar", comment: ""), for: .normal)
//        CollarsButton.contentVerticalAlignment = .center
//        CollarsButton.contentHorizontalAlignment = .center
//        CollarsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
//        CollarsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
//        CollarsButton.setTitleColor(app.visuals.defaultTextColor, for: UIControlState.normal)
//        CollarsButton.setTitleColor(app.visuals.placeholderColor, for: UIControlState.disabled)
//        InventoryButton.titleLabel!.font = app.visuals.fontStandard
//        InventoryButton.titleLabel!.adjustsFontSizeToFitWidth = true;
//        InventoryButton.contentVerticalAlignment = .center
//        InventoryButton.contentHorizontalAlignment = .center
//        InventoryButton.setTitle(NSLocalizedString("Gym", comment: ""), for: .normal)
//        InventoryButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
//        InventoryButton.setTitleColor(app.visuals.defaultTextColor, for: UIControlState.normal)
//        InventoryButton.setTitleColor(app.visuals.placeholderColor, for: UIControlState.disabled)
//        UnitsButton.titleLabel!.font = app.visuals.fontStandard
//        UnitsButton.contentVerticalAlignment = .center
//        UnitsButton.contentHorizontalAlignment = .center
//        UnitsButton.titleLabel!.adjustsFontSizeToFitWidth = true;
//        UnitsButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
//        UnitsButton.setTitleColor(app.visuals.defaultTextColor, for: UIControlState.normal)
//        UnitsButton.setTitleColor(app.visuals.placeholderColor, for: UIControlState.disabled)
//        weightEntryTextField.text = ""
//        weightEntryTextField.textColor = app.visuals.secondaryTextColor
//        //        weightEntryTextField.errorColor = app.visuals.errorColor
//        weightEntryTextField.delegate = self
//        weightEntryTextField.tag = 1
//        //        PublicClasses.setToWeightTextField(weightEntryTextField, platesView: platesView)
//        weightEntryTextField.font =  app.visuals.fontStandard
//        //        weightEntryTextField.placeholderFont =  app.visuals.fontStandard
//        //        weightEntryTextField.iconFont =  app.visuals.fontStandard
//        //        weightEntryTextField.titleLabel.font = app.visuals.fontTextFieldRiser
//        //        weightEntryTextField.minimumFontSize = 0.01
//        //        weightEntryTextField.titleLabel.minimumScaleFactor = 0.01
//        //        weightEntryTextField.titleLabel.adjustsFontSizeToFitWidth = true
//        //        weightEntryTextField.selectedIconColor = app.visuals.defaultTextColor
//        weightEntryTextField.placeholderColor = app.visuals.placeholderColor
//        //        weightEntryTextField.lineColor = GlobalVariables.sharedInstance.secondaryColor
//        weightEntryTextField.tintColor = app.visuals.placeholderColor
//        weightEntryTextField.accessibilityLabel = "Weight entry"
//        weightEntryTextField.accessibilityHint = "Shows the current weight to lift. Tap to type in another weight to calculate. If the percent button is active, type in the percent you want to multiply the current weight to lift by."
//        weightEntryTextField.floatingLabelActiveTextColor = app.visuals.secondaryColor
//        weightEntryTextField.floatingLabelTextColor = app.visuals.secondaryColor
//        //        weightEntryTextField.selectedLineColor = GlobalVariables.sharedInstance.secondaryTextColor
//        //        weightEntryTextField.titleFadeInDuration = GlobalVariables.sharedInstance.animationTime
//        //        weightEntryTextField.titleFadeOutDuration = GlobalVariables.sharedInstance.animationTime
//        weightEntryTextField.keyboardType = .decimalPad
//
//        barTextInput.superview?.bringSubview(toFront: barTextInput)
//        weightEntryTextField.superview?.bringSubview(toFront: weightEntryTextField)
//        GoButton.superview?.bringSubview(toFront: GoButton)
//
//        //        self.platesLabel.addShadow(offset: CGSize(width: 0, height: 0), color: UIColor.black, radius: 4, opacity: 0.4)
//        //        self.barTextInput.addShadow(offset: CGSize(width: 0, height: 0), color: UIColor.black, radius: 4, opacity: 0.4)
//        //        self.keyPadBackgroundView.addShadow(offset: CGSize(width: 0, height: 0), color: UIColor.black, radius: 4, opacity: 0.4)
//        //        self.platesView.addShadow(offset: CGSize(width: 0, height: 0), color: UIColor.black, radius: 4, opacity: 0.4)
//
//
//        self.view.addSubview(weightEntryTextField)
//
//        self.view.bringSubview(toFront: GoButton)
//        let goButtonBottomContraints = NSLayoutConstraint(item: self.GoButton, attribute: .bottom, relatedBy: .equal, toItem: self.weightEntryTextField, attribute: .bottom, multiplier: 1.0, constant: 3)
//        horizonalLeftContraints = NSLayoutConstraint(item: self.weightEntryTextField, attribute: .leadingMargin, relatedBy: .equal, toItem: self.barTextInput, attribute: .leadingMargin, multiplier: 1.0, constant: 20)
//        let horizonalRightContraints = NSLayoutConstraint(item: self.weightEntryTextField, attribute: .trailingMargin, relatedBy: .equal, toItem: self.GoButton, attribute: .leadingMargin, multiplier: 1.0, constant: -30)
//        let weightEntryTextFieldBottom = NSLayoutConstraint(item: self.weightEntryTextField, attribute: .bottom, relatedBy: .equal, toItem: self.One_One_View, attribute: .top, multiplier: 1, constant: -10)
//        let platesLabelTextField = NSLayoutConstraint(item: self.platesLabel, attribute: .bottom, relatedBy: NSLayoutRelation.equal, toItem: self.weightEntryTextField, attribute: .top, multiplier: 1, constant: 0)
//        let expectSize = self.weightEntryTextField.sizeThatFits(CGSize(width: self.weightEntryTextField.frame.size.width, height: CGFloat(MAXFLOAT)));
//        weightEntryTextFieldHeight = NSLayoutConstraint(item: self.weightEntryTextField, attribute: .height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: expectSize.height*2)
//        self.barTextInput.translatesAutoresizingMaskIntoConstraints = false
//        self.GoButton.translatesAutoresizingMaskIntoConstraints = false
//        self.platesLabel.translatesAutoresizingMaskIntoConstraints = false
//        self.weightEntryTextField.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([weightEntryTextFieldHeight,platesLabelTextField,goButtonBottomContraints,horizonalLeftContraints, horizonalRightContraints,weightEntryTextFieldBottom])
//        self.view.layoutIfNeeded()
//        //KEYBOARD SETUP
//        //        self.hideKeyboardWhenTappedAround()
//        NotificationCenter.default.addObserver(self, selector: #selector(KeyPadViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(KeyPadViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    
    
    

    
    
    @objc func handleDisplayLink(_ displayLink: CADisplayLink) {
        self.view.endEditing(true)
        self.dismissPopovers()
        self.maximizeLabelFonts()
        self.setupGradientLayer()
        let origText: String = platesLabel.text
        //        let myText = PublicClasses.labelPlateOutputFromCurrentPlatesInUse(["25.0 Kg", "55.0 lbs", "45.0 lbs", "20.0 Kg", "1.5 Kg", "2.5 lbs", "1.25 lbs", "2.5 Kg"])
        let fontAttributes = [NSAttributedStringKey.font: app.visuals.fontStandard] // it says name, but a UIFont works
        //        let size = (myText as NSString).size(withAttributes: fontAttributes)
        if origText == "" {
            platesLabel.text = ""
        }
        else {
            platesLabel.text = origText
        }
        //        platesLabelWidthConstraint.constant = size.width + 20
        
        //        PublicClasses.updateTextViewFont(self.platesLabel, maxTextSize: app.visuals.currentMaxFont)
        //        PublicClasses.drawPlates(self.platesView)
        
        self.barTextInput.layer.cornerRadius = 0.5 * barTextInput.bounds.size.height
        self.GoButton.layer.cornerRadius = 0.5 * GoButton.bounds.size.height
    }

    
    
    func setupGradientLayer() {
        gradientLayer.removeFromSuperlayer()
        let topColor = app.visuals.gradientColor1.cgColor as CGColor
        let bottomColor =  app.visuals.gradientColor2.cgColor as CGColor
        let deviceScale = UIScreen.main.scale
        gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width * deviceScale, height: self.view.frame.size.height * deviceScale)
        gradientLayer.colors = [topColor, bottomColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.2, y: 0.2)
        gradientLayer.backgroundColor = app.visuals.gradientColor1.cgColor
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    func maximizeLabelFonts() {
        var pointSizeTotal: CGFloat = app.visuals.defaultFontSize
        let GoButtonTemp: UIButton = GoButton
        if NSLocalizedString("Optimize", comment: "").characters.count >  NSLocalizedString("Calculate", comment: "").characters.count {
            GoButtonTemp.setTitle(NSLocalizedString("Optimize", comment: ""), for: .normal)
        }
        else {
            GoButtonTemp.setTitle(NSLocalizedString("Calculate", comment: ""), for: .normal)
        }
        
        var viewsToMaximizeBottomFour: [UIButton] = [InventoryButton, BarbellButton, CollarsButton, ClearButton]
        var pointSizesFour: [CGFloat] = [app.visuals.defaultFontSize,app.visuals.defaultFontSize,app.visuals.defaultFontSize,app.visuals.defaultFontSize]
        for viewToMaximize in viewsToMaximizeBottomFour {
            let frameToUse = CGRect(x: viewToMaximize.frame.minX, y: viewToMaximize.frame.minY, width: self.view.frame.width/4-10, height: min(viewToMaximize.frame.height,44))
            let pointSizeTest = PublicClasses.getFontSizeToFitFrameOfLabel(viewToMaximize, maxTextSize: pointSizeTotal, frameToFit: frameToUse)
            if pointSizeTest >= min(pointSizeTotal * 0.9, pointSizeTotal - 2)  {
            }
            else {
                let minPointSize = min(pointSizesFour.min()!, pointSizeTest)
                pointSizesFour[viewsToMaximizeBottomFour.index(of: viewToMaximize)!] = minPointSize
            }
        }
        if viewsToMaximizeBottomFour.count >= 0 {
            print("smallerThanCount test success")
            for viewToMaximize in viewsToMaximizeBottomFour {
                viewToMaximize.titleLabel!.font = UIFont.systemFont(ofSize: pointSizesFour[viewsToMaximizeBottomFour.index(of: viewToMaximize)!], weight: UIFont.Weight.thin)
            }
        }
        weightEntryTextField.font = app.visuals.fontStandard
        weightEntryTextField.floatingLabelFont = app.visuals.fontTextFieldRiser
        hiddenHeightKeepingLabel.titleLabel?.font = app.visuals.fontStandard
        print(hiddenHeightKeepingLabel.frame.size)
        
        let textViewSize = self.weightEntryTextField.frame.size;
        let expectSize = self.weightEntryTextField.sizeThatFits(CGSize(width: textViewSize.width, height: CGFloat(MAXFLOAT)));
        //        weightEntryTextFieldHeight.constant = expectSize.height+8
        self.view.layoutIfNeeded()
        let expectSizeGoButton = GoButtonTemp.sizeThatFits(CGSize(width: CGFloat(MAXFLOAT), height: GoButtonTemp.frame.size.height));
        goButtonWidthConstraint.constant = min(max(expectSizeGoButton.width + 20, UIScreen.main.bounds.width/4),UIScreen.main.bounds.width/2-20)
        //                horizonalLeftContraints.constant = 0.5 * GoButton.bounds.size.height
        weightEntryTextFinder()
        barTextInput.layer.cornerRadius = 0.5 * GoButton.bounds.size.height
        GoButton.layer.cornerRadius = 0.5 * GoButton.bounds.size.height
    }
    
    
    
}

