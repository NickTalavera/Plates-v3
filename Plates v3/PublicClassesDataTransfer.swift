//
//  PublicClasses.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 5/29/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import Foundation
import JVFloatLabeledText

extension PublicClasses {
    class func wcSendArrayOfStrings(_ dataToSend: [String]) {
        var outPutContext: [String:AnyObject] = ["Globals sent": "Globals sent" as AnyObject]
        if dataToSend.index(of: "currentInventoryList") != nil {
            outPutContext["currentInventoryList"] = GlobalVariables.sharedInstance.currentInventoryList as AnyObject?
        }
//        if dataToSend.index(of: "currentInventoryUnits") != nil {
//            outPutContext["currentInventoryUnits"] = GlobalVariables.sharedInstance.currentInventoryUnits as AnyObject?
//        }
        if dataToSend.index(of: "currentCollarSet") != nil {
            outPutContext["currentCollarSet"] = GlobalVariables.sharedInstance.currentCollarSet as AnyObject?
        }
        if dataToSend.index(of: "barbellsListUnits") != nil {
            outPutContext["barbellsListUnits"] = GlobalVariables.sharedInstance.barbellsListUnits as AnyObject?
        }
        if dataToSend.index(of: "barbellsList") != nil {
            outPutContext["barbellsList"] = GlobalVariables.sharedInstance.barbellsList as AnyObject?
        }
        if dataToSend.index(of: "collarsSetUnits") != nil {
            outPutContext["collarsSetUnits"] = GlobalVariables.sharedInstance.collarsSetUnits as AnyObject?
        }
        if dataToSend.index(of: "collarsSetValues") != nil {
            outPutContext["collarsSetValues"] = GlobalVariables.sharedInstance.collarsSetValues as AnyObject?
        }
        if dataToSend.index(of: "currentInventoryName") != nil {
            outPutContext["currentInventoryName"] = GlobalVariables.sharedInstance.currentInventoryName as AnyObject?
        }
        if dataToSend.index(of: "currentCollarName") != nil {
            outPutContext["currentCollarName"] = GlobalVariables.sharedInstance.currentCollarName as AnyObject?
        }
        if dataToSend.index(of: "currentBarName") != nil {
            outPutContext["currentBarName"] = GlobalVariables.sharedInstance.currentBarName as AnyObject?
        }
        if dataToSend.index(of: "currentCollarWeight") != nil {
            outPutContext["currentCollarWeight"] = GlobalVariables.sharedInstance.currentCollarWeight as AnyObject?
        }
        if dataToSend.index(of: "currentBarWeight") != nil {
            outPutContext["currentBarWeight"] = GlobalVariables.sharedInstance.currentBarWeight as AnyObject?
        }
        if dataToSend.index(of: "currentInventorySet") != nil {
            outPutContext["currentInventorySet"] = GlobalVariables.sharedInstance.currentInventorySet as AnyObject?
        }
        if dataToSend.index(of: "currentPlatesInUse") != nil {
            outPutContext["currentPlatesInUse"] = GlobalVariables.sharedInstance.currentPlatesInUse as AnyObject?
        }
        if dataToSend.index(of: "currentPlates") != nil {
            outPutContext["currentPlates"] = GlobalVariables.sharedInstance.currentPlates as AnyObject?
        }
        if dataToSend.index(of: "currentBarbellSet") != nil {
            outPutContext["currentBarbellSet"] = GlobalVariables.sharedInstance.currentBarbellSet as AnyObject?
        }
        if dataToSend.index(of: "units") != nil {
            outPutContext["units"] = GlobalVariables.sharedInstance.units as AnyObject?
        }
        do {
            try WatchSessionManager.sharedManager.updateApplicationContext(outPutContext)
            print("wcSendArrayOfStrings SUCCESS")
        }
        catch {
            print("Looks like your globals got stuck on the way! Please send again!")
        }
    }


    class func wcSendAllImportantGlobals(_ otherStrings: [String]?=nil) {
//        var outputContext: [String : AnyObject] = ["Globals sent": "Globals sent" as AnyObject,
//                             "currentInventoryList" : GlobalVariables.sharedInstance.currentInventoryList as AnyObject,
//                             "currentInventoryUnits" : GlobalVariables.sharedInstance.currentInventoryUnits as AnyObject,
//                             "currentCollarSet" : GlobalVariables.sharedInstance.currentCollarSet as AnyObject,
//                             "barbellsListUnits" : GlobalVariables.sharedInstance.barbellsListUnits as AnyObject,
//                             "barbellsList" : GlobalVariables.sharedInstance.barbellsList as AnyObject,
//                             "collarsSetUnits" : GlobalVariables.sharedInstance.collarsSetUnits as AnyObject,
//                             "collarsSetValues" : GlobalVariables.sharedInstance.collarsSetValues as AnyObject,
//                             "currentInventoryName" : GlobalVariables.sharedInstance.currentInventoryName as AnyObject,
//                             "currentCollarName" : GlobalVariables.sharedInstance.currentCollarName as AnyObject,
//                             "currentCollarWeight" : GlobalVariables.sharedInstance.currentCollarWeight,
//                             "currentInventorySet" : GlobalVariables.sharedInstance.currentInventorySet,
//                             "currentPlatesInUse" : GlobalVariables.sharedInstance.currentPlatesInUse,
//                             "currentPlates" : GlobalVariables.sharedInstance.currentPlates,
//                             "currentBarName" : GlobalVariables.sharedInstance.currentBarName,
//                             "currentBarbellSet" : GlobalVariables.sharedInstance.currentBarbellSet,
//                             "currentBarWeight" : GlobalVariables.sharedInstance.currentBarWeight,
//                             "units" : GlobalVariables.sharedInstance.units]
        var outputContext: [String : AnyObject] = ["Globals sent": "Globals sent" as AnyObject,
                                                   "currentInventoryList" : GlobalVariables.sharedInstance.currentInventoryList as AnyObject,
//                                                   "currentInventoryUnits" : GlobalVariables.sharedInstance.currentInventoryUnits as AnyObject,
                                                   "currentCollarSet" : GlobalVariables.sharedInstance.currentCollarSet as AnyObject,
                                                   "barbellsListUnits" : GlobalVariables.sharedInstance.barbellsListUnits as AnyObject,
                                                   "barbellsList" : GlobalVariables.sharedInstance.barbellsList as AnyObject,
                                                   "collarsSetUnits" : GlobalVariables.sharedInstance.collarsSetUnits as AnyObject,
                                                   "collarsSetValues" : GlobalVariables.sharedInstance.collarsSetValues as AnyObject,
                                                   "currentInventoryName" : GlobalVariables.sharedInstance.currentInventoryName as AnyObject,
                                                   "currentCollarName" : GlobalVariables.sharedInstance.currentCollarName as AnyObject]
        outputContext = outputContext.merged(with: ["currentCollarWeight" : GlobalVariables.sharedInstance.currentCollarWeight as AnyObject,
                                                   "currentInventorySet" : GlobalVariables.sharedInstance.currentInventorySet as AnyObject,
                                                   "currentPlatesInUse" : GlobalVariables.sharedInstance.currentPlatesInUse as AnyObject,
                                                   "currentPlates" : GlobalVariables.sharedInstance.currentPlates as AnyObject,
                                                   "currentBarName" : GlobalVariables.sharedInstance.currentBarName as AnyObject,
                                                   "currentBarbellSet" : GlobalVariables.sharedInstance.currentBarbellSet as AnyObject,
                                                   "currentBarWeight" : GlobalVariables.sharedInstance.currentBarWeight as AnyObject,
                                                   "units" : GlobalVariables.sharedInstance.units as AnyObject])
        if otherStrings != nil {
            for i in otherStrings! {
                outputContext[i] = 0 as AnyObject?
            }
        }
        do {
            try WatchSessionManager.sharedManager.updateApplicationContext(outputContext)
//            print("wcSendAllImportantGlobals SUCCESS")
        }
        catch {
//                print("Looks like your globals got stuck on the way! Please send again!")
        }
    }
//
    class func wcReceiveAllImportantGlobals(_ dataReceived: [String: AnyObject]) {
//        print("wcReceiveAllImportantGlobals")
        var shouldLoad = true
        if dataReceived["Loaded before"] != nil && (dataReceived["currentPlatesInUse"] as! [Double]).count == 0 && GlobalVariables.sharedInstance.currentPlatesInUse.count > 0 {
            shouldLoad = false
        }
        if dataReceived["First time"] != nil {
//            shouldLoad = false
            print(ProcessInfo().operatingSystemVersion)
//            if NSProcessInfo().operatingSystemVersion.majorVersion >= 10 {
//            PublicClasses.wcRequestAllGlobals()
//            }
        }
        
//        var needToSwitchUnits = false
//        if dataReceived["currentPlatesInUse"] != nil && (dataReceived["currentPlatesInUse"] as! [Double]).count == 0 && GlobalVariables.sharedInstance.currentPlatesInUse.count > 0 {
////            shouldLoad = false
//        }
        if dataReceived["currentPlatesInUse"] != nil && shouldLoad == true {
            GlobalVariables.sharedInstance.currentPlatesInUse = dataReceived["currentPlatesInUse"] as! [String]
        }
        if dataReceived["currentInventoryList"] != nil && shouldLoad == true {
        GlobalVariables.sharedInstance.currentInventoryList = dataReceived["currentInventoryList"] as! [String: [Int]]
        }
//        if dataReceived["currentInventoryUnits"] != nil && shouldLoad == true {
//        GlobalVariables.sharedInstance.currentInventoryUnits =  dataReceived["currentInventoryUnits"] as! [String: String]
//        }
            if dataReceived["currentCollarSet"] != nil && shouldLoad == true {
                GlobalVariables.sharedInstance.currentCollarSet = dataReceived["currentCollarSet"] as! [String: Double]
        }
        if dataReceived["barbellsListUnits"] != nil && shouldLoad == true {
            GlobalVariables.sharedInstance.barbellsListUnits = dataReceived["barbellsListUnits"] as! [String: String]
        }
        if dataReceived["barbellsList"] != nil && shouldLoad == true {
            GlobalVariables.sharedInstance.barbellsList = dataReceived["barbellsList"] as! [String: Double]
        }
        if dataReceived["collarsSetUnits"] != nil && shouldLoad == true {
            GlobalVariables.sharedInstance.collarsSetUnits = dataReceived["collarsSetUnits"] as! [String: String]
        }
        if dataReceived["collarsSetValues"] != nil && shouldLoad == true {
            GlobalVariables.sharedInstance.collarsSetValues = dataReceived["collarsSetValues"] as! [String: Double]
        }
        if dataReceived["currentInventoryName"] != nil && shouldLoad == true {
            GlobalVariables.sharedInstance.currentInventoryName = dataReceived["currentInventoryName"] as! String
        }
        if dataReceived["currentCollarName"] != nil && shouldLoad == true {
            GlobalVariables.sharedInstance.currentCollarName = dataReceived["currentCollarName"] as! String
        }
        if dataReceived["currentBarName"] != nil && shouldLoad == true {
            GlobalVariables.sharedInstance.currentBarName = dataReceived["currentBarName"] as! String
        }
        if dataReceived["currentCollarWeight"] != nil && shouldLoad == true {
            GlobalVariables.sharedInstance.currentCollarWeight = dataReceived["currentCollarWeight"] as! Double
        }
        if dataReceived["currentBarWeight"] != nil && shouldLoad == true {
            GlobalVariables.sharedInstance.currentBarWeight = dataReceived["currentBarWeight"] as! Double
        }
        if dataReceived["currentInventorySet"] != nil && shouldLoad == true {
            GlobalVariables.sharedInstance.currentInventorySet = dataReceived["currentInventorySet"] as! [Int]
        }
        if dataReceived["currentPlates"] != nil && shouldLoad == true {
            GlobalVariables.sharedInstance.currentPlates = dataReceived["currentPlates"] as! [Double]
        }
        if dataReceived["currentBarbellSet"] != nil && shouldLoad == true {
            GlobalVariables.sharedInstance.currentBarbellSet = dataReceived["currentBarbellSet"] as! [String: Double]
        }
        if dataReceived["units"] != nil && shouldLoad == true {
//            if dataReceived["units"] as! String != GlobalVariables.sharedInstance.units {
//                needToSwitchUnits = true
            GlobalVariables.sharedInstance.units = dataReceived["units"] as! String
//            }
        }
//        else {
        if dataReceived["weightToLift"] != nil && shouldLoad == true {
            GlobalVariables.sharedInstance.weightToLift = dataReceived["weightToLift"] as! Double
        }
        GlobalVariables.sharedInstance.unitsFormatter = PublicClasses.unitToFormatter(GlobalVariables.sharedInstance.units)
        GlobalVariables.sharedInstance.weightToLift = PublicClasses.reduceCurrentPlatesInUse(currentPlatesInUseInput: GlobalVariables.sharedInstance.currentPlatesInUse) + GlobalVariables.sharedInstance.currentBarWeight  + GlobalVariables.sharedInstance.currentCollarWeight
//        }
    }

    class func wcRequestAllGlobals() {
        do {
            try WatchSessionManager.sharedManager.updateApplicationContext(["Give me all the globals": true as AnyObject])
//            print("wcRequestAllGlobals SUCCESS")
        }
        catch {
//            print("Looks like your globals got stuck on the way! Please send again!")
        }
    }

}
