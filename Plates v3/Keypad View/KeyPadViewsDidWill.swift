//
//  KeyPadDumpingGround.swift
//  Plates v3
//
//  Created by Nicholas Talavera on 6/23/18.
//  Copyright © 2018 Nicholas Talavera. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension KeyPadViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //SETUP
        app.status.didLoad = true
        //        DataAccess.sharedInstance.release = self
        //ICLOUD SETUP
        //        NotificationCenter.default.addObserver(self, selector: #selector(iCloudOverwroteData), name: NSNotification.Name(rawValue: "iCloudOverwroteData"), object: nil)
        //        NotificationCenter.default.addObserver(self, selector: #selector(iCloudNewDataFetched), name: NSNotification.Name(rawValue: "iCloudNewDataFetched"), object: nil)
        //        NotificationCenter.default.addObserver(self, selector: #selector(iCloudNewDataFetchedNeedsReset), name: NSNotification.Name(rawValue: "iCloudNewDataFetchedNeedsReset"), object: nil)
        //        NotificationCenter.default.addObserver(self, selector: #selector(updatePageProtocol), name: NSNotification.Name(rawValue: "iCloudWeightNeedsReset"), object: nil)
        //        NotificationCenter.default.addObserver(self, selector: #selector(iCloudFirstTime), name: NSNotification.Name(rawValue: "iCloudFirstTime"), object: nil)
        //VIEW SETUP
        self.setupInitialViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        maximizeLabelFonts()
//
//        let fontAttributes = [NSAttributedStringKey.font: app.visuals.fontStandard]
//        //        let myText = PublicClasses.labelPlateOutputFromCurrentPlatesInUse(["25.0 Kg", "55.0 lbs", "45.0 lbs", "20.0 Kg", "1.5 Kg", "2.5 lbs", "1.25 lbs", "2.5 Kg"])
//        //        print("myText")
//        //        print(myText)
//        //        let size = (myText as NSString).size(withAttributes: fontAttributes)
//
//        //        platesLabelWidthConstraint.constant = size.width + 20
//        PublicClasses.setToWeightTextField(weightEntryTextField, platesView: platesView)
//        weightEntryTextFinder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        platesLabel.frame = CGRect(x: platesLabel.frame.minX, y: platesLabel.frame.minY, width: 200, height: platesLabel.frame.height) //CHECK
//        weightEntryTextFinder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        DataAccess.sharedInstance.saveEverything()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
                super.viewWillTransition(to: size, with: coordinator)
        //        let displayLink = CADisplayLink(target: self, selector: #selector(KeyPadViewController.handleDisplayLink(_:)))
        //        displayLink.add(to: RunLoop.main, forMode: RunLoopMode.commonModes)
        //        coordinator.animate(alongsideTransition: nil, completion: {
        //            _ in
        //            displayLink.invalidate()
        //        })
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        UIView.animate(withDuration: 0.1, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.platesView.alpha = 0
        }, completion: nil)
    }
}

