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
//        weightEntryTextFinder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        platesLabel.frame = CGRect(x: platesLabel.frame.minX, y: platesLabel.frame.minY, width: 200, height: platesLabel.frame.height) //CHECK
//        weightEntryTextFinder()
        
//        NSLayoutConstraint.deactivate([self.platesViewLabelBottomAlignmentConstraint!])
//        print(platesViewLabelBottomAlignmentConstraint.isActive)
//        self.platesView.backgroundColor = UIColor.green
//        let platesToBottomConstraint = NSLayoutConstraint(item: self.platesView, attribute: .bottom, relatedBy: .equal, toItem: super.view, attribute: .bottom, multiplier: 1, constant: 0)
//        NSLayoutConstraint.activate([platesToBottomConstraint])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        DataAccess.sharedInstance.saveEverything()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
                super.viewWillTransition(to: size, with: coordinator)
        self.platesView.alpha = 0
        
        self.dismissPopovers()
        coordinator.animate(alongsideTransition: { context in
            if app.status.keypadMovedUp == true {
                self.view.frame.origin.y += app.status.keyboardHeight - self.weightEntryTextField.frame.minY
                app.status.keypadMovedUp = false
                print("A")
            }
        }, completion: { context in
            // This is called after the rotation is finished. Equal to deprecated `didRotate`
            
            UIView.animate(withDuration: app.visuals.platesFadeDuration, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                self.platesView.alpha = 1
            }, completion: nil)
            self.setupGradientLayer()
            self.fixPlatesView()
            self.maximizeLabelFonts()
            PublicClasses.drawPlates(self.platesView)
            print("rotated")
        })
    }
        
    

    
}

