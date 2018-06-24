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
    let gradientLayer: CAGradientLayer = CAGradientLayer()
    
    func setupInitialViews() {
        //KEYBOARD SETUP
        //                        self.hideKeyboardWhenTappedAround()//CHECK
        NotificationCenter.default.addObserver(self, selector: #selector(KeyPadViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(KeyPadViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        //VIEW SETUP
        self.barTextInput.layer.cornerRadius = 0.5 * GoButton.bounds.size.height
        self.barTextInput.clipsToBounds = true
        //BACKGROUND
        self.setupGradientLayer()
        //NAVIGATION BAR SETUP
        self.navBarSetup()
        //BUTTON SETUP
        self.setupButtons()
        
        //        PublicClasses.updateTextViewFont(platesLabel,maxTextSize: app.visuals.currentMaxFont)
        //        let tintedImage = UIImage(named: "settingsIcon")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate) //CHECK
        //                hiddenHeightKeepingLabel.titleLabel?.font = app.visuals.fontStandard.withSize(app.visuals.currentMaxFont) //CHECK
        //                        hiddenHeightKeepingLabel.isHidden = true //CHECK
        //        self.view.backgroundColor=app.visuals.mainColor //CHECK
        //        barTextInput.backgroundColor = UIColor.white //CHECK
        
        //PLATES LABEL
        self.platesLabel.text = ""
        self.platesLabel.font = app.visuals.fontStandard
        self.platesLabel.textColor = app.visuals.secondaryTextColor
        self.platesLabel.isUserInteractionEnabled = false
        
        
        
        //WEGIHT ENTRY TEXT FIELD
        self.view.addSubview(weightEntryTextField)
        self.weightEntryTextField.keyboardType = .decimalPad
        self.weightEntryTextField.delegate = self
        self.weightEntryTextField.tag = 1 //CHECK
        PublicClasses.setToWeightTextField(self.weightEntryTextField, platesView: platesView)
        self.weightEntryTextField.font =  app.visuals.fontStandard
        self.weightEntryTextField.floatingLabelFont = app.visuals.fontTextFieldRiser
        self.weightEntryTextField.floatingLabel.adjustsFontSizeToFitWidth = true
        self.weightEntryTextField.textColor = app.visuals.secondaryTextColor
        self.weightEntryTextField.tintColor = app.visuals.placeholderColor
        self.weightEntryTextField.placeholderColor = app.visuals.placeholderColor
        self.weightEntryTextField.floatingLabelActiveTextColor = app.visuals.secondaryColor
        self.weightEntryTextField.floatingLabelTextColor = app.visuals.secondaryColor
        //        //        weightEntryTextField.lineColor = GlobalVariables.sharedInstance.secondaryColor
        //        //        weightEntryTextField.selectedLineColor = GlobalVariables.sharedInstance.secondaryTextColor
        //        //        weightEntryTextField.titleFadeInDuration = GlobalVariables.sharedInstance.animationTime
        //        //        weightEntryTextField.titleFadeOutDuration = GlobalVariables.sharedInstance.animationTime
        //        //        weightEntryTextField.errorColor = app.visuals.errorColor
        self.weightEntryTextField.floatingLabelYPadding = -22 //FIX
        
        //VIEW ORDER
        self.barTextInput.superview?.bringSubview(toFront: barTextInput)
        self.weightEntryTextField.superview?.bringSubview(toFront: weightEntryTextField)
        self.GoButton.superview?.bringSubview(toFront: GoButton)
        self.view.bringSubview(toFront: GoButton)//CHECK
        
        //CONSTRAINTS
        let goButtonBottomContraints = NSLayoutConstraint(item: self.GoButton, attribute: .bottom, relatedBy: .equal, toItem: self.weightEntryTextField, attribute: .bottom, multiplier: 1.0, constant: 3)
        horizonalLeftContraints = NSLayoutConstraint(item: self.weightEntryTextField, attribute: .leadingMargin, relatedBy: .equal, toItem: self.barTextInput, attribute: .leadingMargin, multiplier: 1.0, constant: 20)
        let horizonalRightContraints = NSLayoutConstraint(item: self.weightEntryTextField, attribute: .trailingMargin, relatedBy: .equal, toItem: self.GoButton, attribute: .leadingMargin, multiplier: 1.0, constant: -30)
        let weightEntryTextFieldBottom = NSLayoutConstraint(item: self.weightEntryTextField, attribute: .bottom, relatedBy: .equal, toItem: self.One_One_View, attribute: .top, multiplier: 1, constant: -10)
        let platesLabelTextField = NSLayoutConstraint(item: self.platesLabel, attribute: .bottom, relatedBy: NSLayoutRelation.equal, toItem: self.weightEntryTextField, attribute: .top, multiplier: 1, constant: 0)
        let expectSize = self.weightEntryTextField.sizeThatFits(CGSize(width: self.weightEntryTextField.frame.size.width, height: CGFloat(MAXFLOAT)));
        weightEntryTextFieldHeight = NSLayoutConstraint(item: self.weightEntryTextField, attribute: .height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: expectSize.height+8) //CHECK
        self.barTextInput.translatesAutoresizingMaskIntoConstraints = false
        self.GoButton.translatesAutoresizingMaskIntoConstraints = false
        self.platesLabel.translatesAutoresizingMaskIntoConstraints = false
        self.weightEntryTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([weightEntryTextFieldHeight,platesLabelTextField,goButtonBottomContraints,horizonalLeftContraints, horizonalRightContraints,weightEntryTextFieldBottom])
        
        
        maximizeLabelFonts()
        self.view.layoutIfNeeded()
    }
    
    func setupButtons() {
        PublicClasses.switchUnitsTo(app.profile.chosenUnit.unit, weightEntryTextField: weightEntryTextField, FiftyFiveLbsButton: FiftyFiveLbsButton, FortyFiveLbsButton: FortyFiveLbsButton, ThirtyFiveLbsButton: ThirtyFiveLbsButton, TwentyFiveLbsButton: TwentyFiveLbsButton, FifteenLbsButton: FifteenLbsButton, TenLbsButton: TenLbsButton, FiveLbsButton: FiveLbsButton, TwoPointFiveLbsButton: TwoPointFiveLbsButton, OnePointTwoFiveLbsButton: OnePointTwoFiveLbsButton, UnitsButton: UnitsButton, platesLabel: platesLabel, platesView: platesView, GoButton: GoButton)
        let keyPadButtonBackgroundViewList = [
            self.One_One_View,             self.One_Two_View,            self.One_Three_View,
            self.One_Four_View,            self.Two_One_View,            self.Two_Two_View,
            self.Two_Three_View,            self.Two_Four_View,            self.Three_One_View,
            self.Three_Two_View,            self.Three_Three_View,            self.Three_Four_View,
            self.Four_One_View,            self.Four_Two_View,            self.Four_Three_View,
            self.Four_Four_View
        ]
        for (_, element) in keyPadButtonBackgroundViewList.enumerated() {
            element?.backgroundColor = app.visuals.textPadColor
        }
        
        let keyPadButtonList = [
            self.FiftyFiveLbsButton,            self.FortyFiveLbsButton,            self.ThirtyFiveLbsButton,
            self.TwentyFiveLbsButton,            self.FifteenLbsButton,            self.TenLbsButton,
            self.FiveLbsButton,            self.TwoPointFiveLbsButton,            self.OnePointTwoFiveLbsButton,
            self.RemoveButton,
            self.PercentButton,
            self.ClearButton,
            self.BarbellButton,
            self.CollarsButton,
            self.InventoryButton,
            self.UnitsButton
        ]
        for (_, element) in keyPadButtonList.enumerated() {
            element?.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
            element?.titleLabel!.font = app.visuals.fontStandard
            element?.titleLabel!.adjustsFontSizeToFitWidth = true;
            element?.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
            element?.setTitleColor(app.visuals.defaultTextColor, for: UIControlState.normal)
            element?.setTitleColor(app.visuals.placeholderColor, for: UIControlState.disabled)
        }
        self.BarbellButton.setTitle(NSLocalizedString("Bar", comment: ""), for: .normal) //FIX
        self.PercentButton.setTitle(PublicClasses.numberFormatterDecimal.percentSymbol, for: .normal)
        self.ClearButton.setTitle(NSLocalizedString("Clear", comment: ""), for: .normal)
        self.CollarsButton.setTitle(NSLocalizedString("Collar", comment: ""), for: .normal)
        self.InventoryButton.setTitle(NSLocalizedString("Gym", comment: ""), for: .normal)
        
        //GO BUTTON
        self.GoButton.setTitle(NSLocalizedString("Calculate", comment: ""), for: .normal)
        self.GoButton.setTitleColor(app.visuals.secondaryTextColor, for: UIControlState.normal)
        self.GoButton.titleLabel?.allowsDefaultTighteningForTruncation = true
        self.GoButton.titleLabel?.adjustsFontSizeToFitWidth = true
        self.GoButton.titleLabel?.minimumScaleFactor = 0.01
        self.GoButton.titleLabel?.font = app.visuals.fontStandard
        self.GoButton.isEnabled = false
        self.GoButton.backgroundColor = app.visuals.secondaryColor
        self.GoButton.layer.cornerRadius = 0.5 * GoButton.bounds.size.height
        self.GoButton.clipsToBounds = true
        self.GoButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        self.GoButton.contentVerticalAlignment = UIControlContentVerticalAlignment.center
    }
    func navBarSetup() {
        self.navigationController?.navigationBar.setTitleVerticalPositionAdjustment(app.visuals.titleVerticalAdjustment, for: .default)
        let titleLabelView: UILabel = UILabel() //CHECK
        titleLabelView.text = NSLocalizedString("Plates", comment: "")
        titleLabelView.backgroundColor = UIColor.clear
        titleLabelView.textColor = app.visuals.secondaryColor
        titleLabelView.font = app.visuals.fontTitle
        titleLabelView.adjustsFontSizeToFitWidth = true
        titleLabelView.sizeToFit()
        self.navigationItem.titleView = titleLabelView
        //                navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: GlobalVariables.sharedInstance.secondaryColor, NSFontAttributeName: GlobalVariables.sharedInstance.fontTitle!] //CHECK
        //                navBarButton.setImage(tintedImage, for: UIControlState.normal) //CHECK
        //                navBarButton.addTarget(self, action: #selector(KeyPadViewController.rightBarButtonPressed), for: UIControlEvents.touchUpInside) //CHECK
        navigationController!.navigationBar.barTintColor = app.visuals.textPadColor
        keyPadBackgroundView.backgroundColor = app.visuals.keyPadBackgroundViewColor
        navBarButton.tintColor =  app.visuals.secondaryColor
        navBarButton.frame = CGRect(x:0, y: 0,width: 31, height: 31)
        navBarButton.titleLabel?.adjustsFontSizeToFitWidth = true
        navBarButton.setTitle("", for: .normal)
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
        let pointSizeTotal: CGFloat = app.visuals.defaultFontSize
        let GoButtonTemp: UIButton = GoButton
        if NSLocalizedString("Optimize", comment: "").count >  NSLocalizedString("Calculate", comment: "").count {
            GoButtonTemp.setTitle(NSLocalizedString("Optimize", comment: ""), for: .normal)
        }
        else {
            GoButtonTemp.setTitle(NSLocalizedString("Calculate", comment: ""), for: .normal)
        }
        let viewsToMaximizeBottomFour: [UIButton] = [InventoryButton, BarbellButton, CollarsButton, ClearButton]
        var pointSizesFour: [CGFloat] = [app.visuals.defaultFontSize,app.visuals.defaultFontSize,app.visuals.defaultFontSize,app.visuals.defaultFontSize]
        for viewToMaximize in viewsToMaximizeBottomFour {
            let frameToUse = CGRect(x: viewToMaximize.frame.minX, y: viewToMaximize.frame.minY, width: self.view.frame.width/4-10, height: min(viewToMaximize.frame.height,44))
            let pointSizeTest = PublicClasses.getFontSizeToFitFrameOfLabel(viewToMaximize, maxTextSize: pointSizeTotal, frameToFit: frameToUse)
            if pointSizeTest >= min(pointSizeTotal * 0.9, pointSizeTotal - 2)  {//CHECK
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
        hiddenHeightKeepingLabel.titleLabel?.font = app.visuals.fontStandard //CHECK
        let textViewSize = self.weightEntryTextField.frame.size;
        let expectSize = self.weightEntryTextField.sizeThatFits(CGSize(width: textViewSize.width, height: CGFloat(MAXFLOAT)));
        weightEntryTextFieldHeight.constant = expectSize.height+8
        self.view.layoutIfNeeded()
        let expectSizeGoButton = GoButtonTemp.sizeThatFits(CGSize(width: CGFloat(MAXFLOAT), height: GoButtonTemp.frame.size.height));
        goButtonWidthConstraint.constant = min(max(expectSizeGoButton.width + 20, UIScreen.main.bounds.width/4),UIScreen.main.bounds.width/2-20)
        horizonalLeftContraints.constant = 0.5 * GoButton.bounds.size.height
        weightEntryTextFinder()
        barTextInput.layer.cornerRadius = 0.5 * GoButton.bounds.size.height
        GoButton.layer.cornerRadius = 0.5 * GoButton.bounds.size.height
    }
    
}

