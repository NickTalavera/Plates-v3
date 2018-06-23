//
//  DataAccess.swift
//  Plates v3
//
//  Created by Nicholas Talavera on 6/23/18.
//  Copyright © 2018 Nicholas Talavera. All rights reserved.
//


import CoreData
import Foundation
import CloudKit
import UIKit


open class DataAccess: NSObject {

    var succeededSave: Bool
    var tryCount: Int
//    let appDataID = CKRecordID(recordName: "User0")
//    let container: CKContainer
//    let publicDatabase: CKDatabase
//    let privateDatabase: CKDatabase
//    weak var delegate:MainDelegate?
    static let sharedInstance = DataAccess()
    override init() {
        self.succeededSave = false
        self.tryCount = 0
////        //            self.container = CKContainer.defaultContainer()
//        self.container = CKContainer(identifier: "iCloud.GibbsFFT.Bar---Barbell-Plate-Weight-Calculator")
//        self.publicDatabase = container.publicCloudDatabase
//        self.privateDatabase = container.privateCloudDatabase
    }
//
    open func saveEverything() {
//        let fetchRequest: NSFetchRequest<AppData> = NSFetchRequest(entityName: "AppData")
//        do {
//            let fetchedEntitiesTest = try self.managedObjectContext.fetch(fetchRequest)
//            if fetchedEntitiesTest.count == 0 {
//                _ = NSEntityDescription.insertNewObject(forEntityName: "AppData", into: self.managedObjectContext) as! AppData
//                #if os(iOS) || os(watchOS) || os(tvOS)
//                self.saveContext()
//                #elseif os(OSX)
//                self.saveAction(sender: nil)                    // Do something in response to error condition
//                #endif
//            }
//            let fetchedEntities = try self.managedObjectContext.fetch(fetchRequest)
//            fetchedEntities[0].units = GlobalVariables.sharedInstance.units
//            fetchedEntities[0].currentBarWeight = GlobalVariables.sharedInstance.currentBarWeight as NSNumber?
//            fetchedEntities[0].currentBarbellSet = GlobalVariables.sharedInstance.currentBarbellSet as NSObject?
//            fetchedEntities[0].currentBarName = GlobalVariables.sharedInstance.currentBarName
//            fetchedEntities[0].currentPlates = GlobalVariables.sharedInstance.currentPlates as NSObject?
//            fetchedEntities[0].weightStep = GlobalVariables.sharedInstance.weightStep as NSNumber?
//            fetchedEntities[0].weightToLift = GlobalVariables.sharedInstance.weightToLift as NSNumber?
//            fetchedEntities[0].currentPlatesInUse = GlobalVariables.sharedInstance.currentPlatesInUse as NSObject?
//            fetchedEntities[0].currentInventorySet = GlobalVariables.sharedInstance.currentInventorySet as NSObject?
//            fetchedEntities[0].currentCollarWeight = GlobalVariables.sharedInstance.currentCollarWeight as NSObject?
//            fetchedEntities[0].currentCollarName = GlobalVariables.sharedInstance.currentCollarName
//            fetchedEntities[0].collarsSetValues = GlobalVariables.sharedInstance.collarsSetValues as NSObject?
//            fetchedEntities[0].collarsSetUnits = GlobalVariables.sharedInstance.collarsSetUnits as NSObject?
//            fetchedEntities[0].barbellsList = GlobalVariables.sharedInstance.barbellsList as NSObject?
//            fetchedEntities[0].barbellsListUnits = GlobalVariables.sharedInstance.barbellsListUnits as NSObject?
//            fetchedEntities[0].currentCollarSet = GlobalVariables.sharedInstance.currentCollarSet as NSObject?
//            fetchedEntities[0].currentInventoryList = GlobalVariables.sharedInstance.currentInventoryList as NSObject?
//            //            fetchedEntities[0].currentInventoryUnits = GlobalVariables.sharedInstance.currentInventoryUnits as NSObject?
//            fetchedEntities[0].currentInventoryName = GlobalVariables.sharedInstance.currentInventoryName
//            fetchedEntities[0].alwaysSort = GlobalVariables.sharedInstance.alwaysSort
//            fetchedEntities[0].convertGymUnits = GlobalVariables.sharedInstance.convertGymUnits
//            fetchedEntities[0].firstTime = GlobalVariables.sharedInstance.firstTime
//            fetchedEntities[0].iPhoneReviewPrompted = GlobalVariables.sharedInstance.iPhoneReviewPrompted
//            fetchedEntities[0].watchOSReviewPrompted = GlobalVariables.sharedInstance.watchOSReviewPrompted
//            fetchedEntities[0].tvOSReviewPrompted = GlobalVariables.sharedInstance.tvOSReviewPrompted
//            fetchedEntities[0].osxReviewPrompted = GlobalVariables.sharedInstance.osxReviewPrompted
//            fetchedEntities[0].gymsChosen = GlobalVariables.sharedInstance.gymsChosen as NSObject?
//            fetchedEntities[0].platesOutputSelectable = GlobalVariables.sharedInstance.platesOutputSelectable
//            fetchedEntities[0].paidToRemoveAds = GlobalVariables.sharedInstance.paidToRemoveAds
//            #if os(iOS) || os(watchOS) || os(tvOS)
//            self.saveContext()
//            print("Saved locally")
//            #elseif os(OSX)
//            self.saveAction(sender: nil)
//            print("Saved locally")
//            #endif
//        }
//        catch {
//            // Do something in response to error condition
//        }
    }
//
//    #if os(iOS) || os(tvOS) || os(OSX)
//    open func iCloudSave() {
//        print("Saving to iCloud")
//        if tryCount <= 1 && succeededSave == false {
//            let noteRecord = CKRecord(recordType: "AppData", recordID: self.appDataID)
//            do {
//                let barbellsListUnitsJSON = try JSONSerialization.data(withJSONObject: GlobalVariables.sharedInstance.barbellsListUnits, options: JSONSerialization.WritingOptions.prettyPrinted)
//                noteRecord.setObject(barbellsListUnitsJSON as CKRecordValue?, forKey: "BarbellsListUnits")
//                let barbellsListJSON = try JSONSerialization.data(withJSONObject: GlobalVariables.sharedInstance.barbellsList, options: JSONSerialization.WritingOptions.prettyPrinted)
//                noteRecord.setObject(barbellsListJSON as CKRecordValue?, forKey: "BarbellsList")
//                let collarsSetValuesJSON = try JSONSerialization.data(withJSONObject: GlobalVariables.sharedInstance.collarsSetValues, options: JSONSerialization.WritingOptions.prettyPrinted)
//                noteRecord.setObject(collarsSetValuesJSON as CKRecordValue?, forKey: "CollarsSetValues")
//                let collarsSetUnitsJSON = try JSONSerialization.data(withJSONObject: GlobalVariables.sharedInstance.collarsSetUnits, options: JSONSerialization.WritingOptions.prettyPrinted)
//                noteRecord.setObject(collarsSetUnitsJSON as CKRecordValue?, forKey: "CollarsSetUnits")
//
//                let currentInventoryListJSON = try JSONSerialization.data(withJSONObject: GlobalVariables.sharedInstance.currentInventoryList, options: JSONSerialization.WritingOptions.prettyPrinted)
//                noteRecord.setObject(currentInventoryListJSON as CKRecordValue?, forKey: "CurrentInventoryList")
//                //                let currentInventoryUnitsJSON = try JSONSerialization.data(withJSONObject: GlobalVariables.sharedInstance.currentInventoryUnits, options: JSONSerialization.WritingOptions.prettyPrinted)
//                //                noteRecord.setObject(currentInventoryUnitsJSON as CKRecordValue?, forKey: "CurrentInventoryUnits")
//            } catch let error as NSError {
//                print(error)
//            }
//            noteRecord.setObject(GlobalVariables.sharedInstance.currentPlatesInUse as CKRecordValue?, forKey: "CurrentPlatesInUse")
//            noteRecord.setObject((GlobalVariables.sharedInstance.alwaysSort ? NSNumber(value: 1) : NSNumber(value: 0)  as CKRecordValue?), forKey: "AlwaysSort")
//            noteRecord.setObject((GlobalVariables.sharedInstance.convertGymUnits ? NSNumber(value: 1) : NSNumber(value: 0) as CKRecordValue?), forKey: "ConvertGymUnits")
//            noteRecord.setObject(GlobalVariables.sharedInstance.currentBarName as CKRecordValue?, forKey: "CurrentBarName")
//            noteRecord.setObject(GlobalVariables.sharedInstance.currentCollarName as CKRecordValue?, forKey: "CurrentCollarName")
//            noteRecord.setObject(GlobalVariables.sharedInstance.currentInventoryName as CKRecordValue?, forKey: "CurrentInventoryName")
//            noteRecord.setObject(GlobalVariables.sharedInstance.gymsChosen as CKRecordValue?, forKey: "GymsChosen")
//            noteRecord.setObject(GlobalVariables.sharedInstance.units as CKRecordValue?, forKey: "Units")
//            noteRecord.setObject(GlobalVariables.sharedInstance.weightStep as CKRecordValue?, forKey: "WeightStep")
//            privateDatabase.save(noteRecord, completionHandler: { (record, error) -> Void in
//                self.tryCount += 1
//                if (error != nil) {
//                    print("Couldn't save to iCloud")
//                    self.privateDatabase.delete(withRecordID: self.appDataID, completionHandler: { (recordID, error) -> Void in
//                        if error != nil {
//                            print(error)
//                            print("Couldn't delete record")
//                        }
//                        else {
//                            print("Successfully deleted record")
//                            self.iCloudSave()
//                        }
//                    })
//                    return
//                }
//                else {
//                    self.succeededSave = true
//                    print("Successfully saved to iCloud")
//                }
//            })
//        }
//        self.tryCount = 0
//        self.succeededSave = false
//    }
//
//
//
//    open func iCloudFetchUponLoad() {
//        let predicate = NSPredicate(value: true)
//        let query = CKQuery(recordType: "AppData", predicate: predicate)
//        privateDatabase.perform(query, inZoneWith: nil) { (results, error) -> Void in
//            if error != nil {
//                print("iCloud data couldn't load")
//                print(error)
//            }
//            else {
//                print("iCloud began loading")
//                if results!.count >= 1 {
//                    let record = results![0] as CKRecord
//                    if GlobalVariables.sharedInstance.currentPlatesInUse.count <= 1 {
//                        if (record.object(forKey: "AlwaysSort") as! Int).toBool()! != GlobalVariables.sharedInstance.alwaysSort && (record.object(forKey: "AlwaysSort") as! Int).toBool()! == true {
//                            GlobalVariables.sharedInstance.currentPlatesInUse = PublicClasses.sortCurrentPlatesInUse(GlobalVariables.sharedInstance.currentPlatesInUse)
//                            NotificationCenter.default.post(name: Notification.Name(rawValue: "iCloudWeightNeedsReset"), object: nil)
//                        }
//                        GlobalVariables.sharedInstance.alwaysSort = (record.object(forKey: "AlwaysSort") as! Int).toBool()!
//                    }
//                    GlobalVariables.sharedInstance.convertGymUnits = (record.object(forKey: "ConvertGymUnits") as! Int).toBool()!
//                    do {
//                        if record.object(forKey: "BarbellsList") != nil && record.object(forKey: "BarbellsListUnits") != nil {
//                            let barbellsListUnitsJSON = record.object(forKey: "BarbellsListUnits") as! Data
//                            let barbellsListUnitsDecoded = try JSONSerialization.jsonObject(with: barbellsListUnitsJSON, options: [])
//                            GlobalVariables.sharedInstance.barbellsListUnits = barbellsListUnitsDecoded as! [String : String]
//
//                            let barbellsListJSON = record.object(forKey: "BarbellsList") as! Data
//                            let barbellsListDecoded = try JSONSerialization.jsonObject(with: barbellsListJSON, options: [])
//                            GlobalVariables.sharedInstance.barbellsList = barbellsListDecoded as! [String : Double]
//                        }
//                        if record.object(forKey: "CollarsSetUnits") != nil && record.object(forKey: "CollarsSetValues") != nil {
//                            let collarsSetValuesJSON = record.object(forKey: "CollarsSetValues") as! Data
//                            let collarsSetValuesDecoded = try JSONSerialization.jsonObject(with: collarsSetValuesJSON, options: [])
//                            GlobalVariables.sharedInstance.collarsSetValues = collarsSetValuesDecoded as! [String : Double]
//
//                            let collarsSetUnitsJSON = record.object(forKey: "CollarsSetUnits") as! Data
//                            let collarsSetUnitsDecoded = try JSONSerialization.jsonObject(with: collarsSetUnitsJSON, options: [])
//                            GlobalVariables.sharedInstance.collarsSetUnits = collarsSetUnitsDecoded as! [String : String]
//                        }
//
//                        if record.object(forKey: "CurrentInventoryList") != nil && record.object(forKey: "CurrentInventoryUnits") != nil {
//                            let currentInventoryListJSON = record.object(forKey: "CurrentInventoryList") as! Data
//                            let currentInventoryListDecoded = try JSONSerialization.jsonObject(with: currentInventoryListJSON, options: [])
//                            GlobalVariables.sharedInstance.currentInventoryList = currentInventoryListDecoded as! [String : [Int]]
//
//                            let currentInventoryUnitsJSON = record.object(forKey: "CurrentInventoryUnits") as! Data
//                            let currentInventoryUnitsDecoded = try JSONSerialization.jsonObject(with: currentInventoryUnitsJSON, options: [])
//                            //                            GlobalVariables.sharedInstance.currentInventoryUnits = currentInventoryUnitsDecoded as! [String : String]
//                        }
//                    } catch let error as NSError {
//                        print(error)
//                        print("iCloud JSON failed")
//                    }
//
//                    if GlobalVariables.sharedInstance.currentPlatesInUse.count == 0 {
//                        if GlobalVariables.sharedInstance.currentInventoryName != record.object(forKey: "CurrentInventoryName") as! String {
//                            NotificationCenter.default.post(name: Notification.Name(rawValue: "iCloudNewDataFetched"), object: nil)
//                        }
//                        GlobalVariables.sharedInstance.currentInventoryName = record.object(forKey: "CurrentInventoryName") as! String
//                    }
//
//
//                    var gymsChosen: [String] = record.object(forKey: "GymsChosen") as! [String]
//                    if GlobalVariables.sharedInstance.currentInventoryList.index(forKey: GlobalVariables.sharedInstance.currentInventoryName) == nil {
//                        gymsChosen.insert(GlobalVariables.sharedInstance.currentInventoryName, at: 0)
//                        gymsChosen.removeLast()
//                    }
//                    for i in 0...gymsChosen.count-1 {
//                        if GlobalVariables.sharedInstance.currentInventoryList.index(forKey: gymsChosen[i]) == nil {
//                            gymsChosen.remove(at: i)
//                        }
//                    }
//                    while GlobalVariables.sharedInstance.currentInventoryList.count-1 > gymsChosen.count && gymsChosen.count < 3 {
//                        for gym in GlobalVariables.sharedInstance.currentInventoryList.keys {
//                            if gym != "Calculator only" {
//                                gymsChosen.append(gym)
//                            }
//                        }
//                    }
//                    GlobalVariables.sharedInstance.gymsChosen = gymsChosen
//                    #if os(iOS)
//                    var shortcutArray: [UIApplicationShortcutItem] = [UIApplicationShortcutItem(type: "calculatorOnlyItem", localizedTitle: NSLocalizedString("Calculator only", comment: ""), localizedSubtitle: "", icon: .none, userInfo: nil)]
//                    if GlobalVariables.sharedInstance.gymsChosen.count >= 1 {
//                        let shortcut2 = UIApplicationShortcutItem(type: "gymIndex0", localizedTitle: GlobalVariables.sharedInstance.gymsChosen[0], localizedSubtitle: "", icon: .none, userInfo: nil)
//                        shortcutArray.append(shortcut2)
//                    }
//                    if GlobalVariables.sharedInstance.gymsChosen.count >= 2 {
//                        let shortcut3 = UIApplicationShortcutItem(type: "gymIndex1", localizedTitle: GlobalVariables.sharedInstance.gymsChosen[1], localizedSubtitle: "", icon: .none, userInfo: nil)
//                        shortcutArray.append(shortcut3)
//                    }
//                    if GlobalVariables.sharedInstance.gymsChosen.count >= 3 {
//                        let shortcut4 = UIApplicationShortcutItem(type: "gymIndex2", localizedTitle: GlobalVariables.sharedInstance.gymsChosen[2], localizedSubtitle: "", icon: .none, userInfo: nil)
//                        shortcutArray.append(shortcut4)
//                    }
//                    UIApplication.shared.shortcutItems = shortcutArray
//                    #endif
//                    GlobalVariables.sharedInstance.weightStep = record.object(forKey: "WeightStep") as! Double
//
//                    GlobalVariables.sharedInstance.currentBarName = record.object(forKey: "CurrentBarName") as! String
//                    GlobalVariables.sharedInstance.currentCollarName = record.object(forKey: "CurrentCollarName") as! String
//
//                    if GlobalVariables.sharedInstance.currentBarbellSet[GlobalVariables.sharedInstance.currentBarName] == nil {
//                        GlobalVariables.sharedInstance.currentBarName = "No barbell"
//                    }
//
//                    if GlobalVariables.sharedInstance.currentCollarSet[GlobalVariables.sharedInstance.currentCollarName] == nil {
//                        GlobalVariables.sharedInstance.currentCollarName = "No collar"
//                    }
//
//                    if GlobalVariables.sharedInstance.currentBarbellSet[GlobalVariables.sharedInstance.currentBarName] != nil && GlobalVariables.sharedInstance.currentBarWeight != GlobalVariables.sharedInstance.currentBarbellSet[GlobalVariables.sharedInstance.currentBarName] {
//                        GlobalVariables.sharedInstance.weightToLift = GlobalVariables.sharedInstance.weightToLift - GlobalVariables.sharedInstance.currentBarWeight
//                        GlobalVariables.sharedInstance.currentBarWeight = GlobalVariables.sharedInstance.currentBarbellSet[GlobalVariables.sharedInstance.currentBarName]!
//                        GlobalVariables.sharedInstance.weightToLift = GlobalVariables.sharedInstance.weightToLift + GlobalVariables.sharedInstance.currentBarWeight
//                        NotificationCenter.default.post(name: Notification.Name(rawValue: "iCloudWeightNeedsReset"), object: nil)
//                    }
//                    if GlobalVariables.sharedInstance.currentCollarSet[GlobalVariables.sharedInstance.currentCollarName] != nil && GlobalVariables.sharedInstance.currentCollarWeight != GlobalVariables.sharedInstance.currentCollarSet[GlobalVariables.sharedInstance.currentCollarName]! {
//                        GlobalVariables.sharedInstance.weightToLift = GlobalVariables.sharedInstance.weightToLift - GlobalVariables.sharedInstance.currentCollarWeight + GlobalVariables.sharedInstance.currentCollarSet[GlobalVariables.sharedInstance.currentCollarName]!
//                        GlobalVariables.sharedInstance.currentCollarWeight = GlobalVariables.sharedInstance.currentCollarSet[GlobalVariables.sharedInstance.currentCollarName]!
//                        NotificationCenter.default.post(name: Notification.Name(rawValue: "iCloudWeightNeedsReset"), object: nil)
//                    }
//
//
//
//
//                    if GlobalVariables.sharedInstance.currentPlatesInUse.count == 0 && record.object(forKey: "Units") as! String != GlobalVariables.sharedInstance.units {
//                        GlobalVariables.sharedInstance.units = record.object(forKey: "Units") as! String
//                        NotificationCenter.default.post(name: Notification.Name(rawValue: "iCloudOverwroteData"), object: nil)
//                    }
//
//                    //                        if GlobalVariables.sharedInstance.currentPlatesInUse.count == 0 {
//                    //                            GlobalVariables.sharedInstance.currentPlatesInUse = record.objectForKey("CurrentPlatesInUse") as! [Double]
//                    //                            NSNotificationCenter.defaultCenter().postNotificationName("iCloudWeightNeedsReset", object: nil)
//                    //                        }
//
//                    print("iCloud successfully finished loading")
//                    NotificationCenter.default.post(name: Notification.Name(rawValue: "iCloudNewDataFetched"), object: nil)
//                }
//                else {
//                    print("iCloud query perfomed but no data was found")
//                }
//            }
//        }
//    }
//
//
//    open func iCloudFetchFirstTime() {
//        let predicate = NSPredicate(value: true)
//        let query = CKQuery(recordType: "AppData", predicate: predicate)
//        privateDatabase.perform(query, inZoneWith: nil) { (results, error) -> Void in
//            if error != nil {
//                print("iCloud data couldn't load")
//                print(error)
//            }
//            else {
//                print("iCloud began loading")
//                if results!.count > 0 {
//                    let record = results![0] as CKRecord
//                    GlobalVariables.sharedInstance.weightStep = record.object(forKey: "WeightStep") as! Double
//                    GlobalVariables.sharedInstance.units = record.object(forKey: "Units") as! String
//                    GlobalVariables.sharedInstance.currentBarName = record.object(forKey: "CurrentBarName") as! String
//                    print(record.object(forKey: "CurrentBarName") as! String)
//                    GlobalVariables.sharedInstance.currentCollarName = record.object(forKey: "CurrentCollarName") as! String
//                    GlobalVariables.sharedInstance.currentInventoryName = record.object(forKey: "CurrentInventoryName") as! String
//                    GlobalVariables.sharedInstance.gymsChosen = record.object(forKey: "GymsChosen") as! [String]
//                    GlobalVariables.sharedInstance.alwaysSort = (record.object(forKey: "AlwaysSort") as! Int).toBool()!
//                    GlobalVariables.sharedInstance.convertGymUnits = (record.object(forKey: "ConvertGymUnits") as! Int).toBool()!
//
//                    do {
//                        let barbellsListUnitsJSON = record.object(forKey: "BarbellsListUnits") as! Data
//                        let barbellsListUnitsDecoded = try JSONSerialization.jsonObject(with: barbellsListUnitsJSON, options: [])
//                        GlobalVariables.sharedInstance.barbellsListUnits = barbellsListUnitsDecoded as! [String : String]
//
//                        let barbellsListJSON = record.object(forKey: "BarbellsList") as! Data
//                        let barbellsListDecoded = try JSONSerialization.jsonObject(with: barbellsListJSON, options: [])
//                        GlobalVariables.sharedInstance.barbellsList = barbellsListDecoded as! [String : Double]
//
//                        let collarsSetValuesJSON = record.object(forKey: "CollarsSetValues") as! Data
//                        let collarsSetValuesDecoded = try JSONSerialization.jsonObject(with: collarsSetValuesJSON, options: [])
//                        GlobalVariables.sharedInstance.collarsSetValues = collarsSetValuesDecoded as! [String : Double]
//
//                        let collarsSetUnitsJSON = record.object(forKey: "CollarsSetUnits") as! Data
//                        let collarsSetUnitsDecoded = try JSONSerialization.jsonObject(with: collarsSetUnitsJSON, options: [])
//                        GlobalVariables.sharedInstance.collarsSetUnits = collarsSetUnitsDecoded as! [String : String]
//
//                        let currentInventoryListJSON = record.object(forKey: "CurrentInventoryList") as! Data
//                        let currentInventoryListDecoded = try JSONSerialization.jsonObject(with: currentInventoryListJSON, options: [])
//                        GlobalVariables.sharedInstance.currentInventoryList = currentInventoryListDecoded as! [String : [Int]]
//
//                        let currentInventoryUnitsJSON = record.object(forKey: "CurrentInventoryUnits") as! Data
//                        let currentInventoryUnitsDecoded = try JSONSerialization.jsonObject(with: currentInventoryUnitsJSON, options: [])
//                        //                        GlobalVariables.sharedInstance.currentInventoryUnits = currentInventoryUnitsDecoded as! [String : String]
//                    } catch let error as NSError {
//                        print(error)
//                        print("iCloud JSON failed")
//                    }
//                    GlobalVariables.sharedInstance.currentPlatesInUse = record.object(forKey: "CurrentPlatesInUse") as! [String]
//                    print("iCloud finished loading")
//                    NotificationCenter.default.post(name: Notification.Name(rawValue: "iCloudFirstTime"), object: nil)
//                }
//                else {
//                    print("iCloud query perfomed but no data was found")
//                }
//            }
//        }
//    }
//    #endif
//
//    open func loadIt() -> Bool {
//        let fetchRequest: NSFetchRequest<AppData> = NSFetchRequest(entityName: "AppData")
//        do {
//            let fetchedEntities = try DataAccess.sharedInstance.managedObjectContext.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as! [AppData]
//            if fetchedEntities.count > 0 {
//                GlobalVariables.sharedInstance.units =  fetchedEntities[0].units!
//                GlobalVariables.sharedInstance.currentBarWeight =  Double(fetchedEntities[0].currentBarWeight!)
//                GlobalVariables.sharedInstance.currentBarbellSet =  fetchedEntities[0].currentBarbellSet! as! [String : Double]
//                GlobalVariables.sharedInstance.currentBarName =  fetchedEntities[0].currentBarName!
//                GlobalVariables.sharedInstance.currentPlates =  fetchedEntities[0].currentPlates! as! [Double]
//                GlobalVariables.sharedInstance.weightStep =  Double(fetchedEntities[0].weightStep!)
//                GlobalVariables.sharedInstance.weightToLift =  Double(fetchedEntities[0].weightToLift!)
//                GlobalVariables.sharedInstance.currentPlatesInUse =  fetchedEntities[0].currentPlatesInUse! as! [String]
//                GlobalVariables.sharedInstance.currentInventorySet =  fetchedEntities[0].currentInventorySet! as! [Int]
//                GlobalVariables.sharedInstance.currentCollarWeight =  fetchedEntities[0].currentCollarWeight! as! Double
//                GlobalVariables.sharedInstance.currentCollarName =   fetchedEntities[0].currentCollarName!
//                GlobalVariables.sharedInstance.currentInventoryName =   fetchedEntities[0].currentInventoryName!
//                GlobalVariables.sharedInstance.alwaysSort =   fetchedEntities[0].alwaysSort
//                GlobalVariables.sharedInstance.convertGymUnits =   fetchedEntities[0].convertGymUnits
//                GlobalVariables.sharedInstance.firstTime =   fetchedEntities[0].firstTime
//                GlobalVariables.sharedInstance.iPhoneReviewPrompted = fetchedEntities[0].iPhoneReviewPrompted
//                GlobalVariables.sharedInstance.watchOSReviewPrompted = fetchedEntities[0].watchOSReviewPrompted
//                GlobalVariables.sharedInstance.tvOSReviewPrompted = fetchedEntities[0].tvOSReviewPrompted
//                GlobalVariables.sharedInstance.osxReviewPrompted = fetchedEntities[0].osxReviewPrompted
//                GlobalVariables.sharedInstance.collarsSetValues =  fetchedEntities[0].collarsSetValues! as! [String : Double]
//                GlobalVariables.sharedInstance.collarsSetUnits =  fetchedEntities[0].collarsSetUnits! as! [String : String]
//                GlobalVariables.sharedInstance.barbellsList =  fetchedEntities[0].barbellsList! as! [String : Double]
//                GlobalVariables.sharedInstance.barbellsListUnits =  fetchedEntities[0].barbellsListUnits! as! [String : String]
//                GlobalVariables.sharedInstance.currentCollarSet =  fetchedEntities[0].currentCollarSet! as! [String : Double]
//                //                GlobalVariables.sharedInstance.currentInventoryUnits = fetchedEntities[0].currentInventoryUnits! as! [String : String]
//                GlobalVariables.sharedInstance.currentInventoryList = fetchedEntities[0].currentInventoryList! as! [String : [Int]]
//                GlobalVariables.sharedInstance.gymsChosen = fetchedEntities[0].gymsChosen as! [String]
//                GlobalVariables.sharedInstance.platesOutputSelectable = fetchedEntities[0].platesOutputSelectable
//                GlobalVariables.sharedInstance.paidToRemoveAds = fetchedEntities[0].paidToRemoveAds
//                print("paidToRemoveAds " + String(fetchedEntities[0].paidToRemoveAds))
//                print("Loaded local data")
//                return true
//            }
//            else {
//                print("Load was empty")
//                let isMetric: Bool = Locale.current.usesMetricSystem
//                for (key,value) in GlobalVariables.sharedInstance.barbellsList {
//                    let unitKeep = GlobalVariables.sharedInstance.barbellsListUnits[key]
//                    if key.range(of: "%") != nil {
//                        GlobalVariables.sharedInstance.barbellsList.removeValue(forKey: key)
//                        GlobalVariables.sharedInstance.barbellsListUnits.removeValue(forKey: key)
//                        var unitToUse = MassFormatter.Unit.kilogram
//                        if unitKeep == "lbs" {
//                            unitToUse = MassFormatter.Unit.pound
//                        }
//                        var keyTemp = key
//                        keyTemp.replaceSubrange(keyTemp.characters.index(keyTemp.startIndex, offsetBy: 0)..<keyTemp.characters.index(keyTemp.startIndex, offsetBy: 2), with: "%@")
//                        keyTemp = NSLocalizedString(keyTemp, comment: "")
//                        keyTemp = keyTemp.replacingOccurrences(of: "%@", with: PublicClasses.massFormatter.string(fromValue: value, unit: unitToUse))
//                        GlobalVariables.sharedInstance.barbellsList[keyTemp] = value
//                        GlobalVariables.sharedInstance.barbellsListUnits[keyTemp] = unitKeep
//                    }
//                    else {
//                        if key != "No barbell" {
//                            GlobalVariables.sharedInstance.barbellsList.removeValue(forKey: key)
//                            GlobalVariables.sharedInstance.barbellsListUnits.removeValue(forKey: key)
//                            let keyTemp = NSLocalizedString(key, comment: "")
//                            GlobalVariables.sharedInstance.barbellsList[keyTemp] = value
//                            GlobalVariables.sharedInstance.barbellsListUnits[keyTemp] = unitKeep
//                        }
//                    }
//                }
//                GlobalVariables.sharedInstance.barbellsList["No barbell"] = 0
//
//
//                for (key,value) in GlobalVariables.sharedInstance.collarsSetValues {
//                    let unitKeep = GlobalVariables.sharedInstance.collarsSetUnits[key]
//                    if key.range(of: "%") != nil {
//                        GlobalVariables.sharedInstance.collarsSetValues.removeValue(forKey: key)
//                        GlobalVariables.sharedInstance.collarsSetUnits.removeValue(forKey: key)
//                        var unitToUse = MassFormatter.Unit.kilogram
//                        if unitKeep == "lbs" {
//                            unitToUse = MassFormatter.Unit.pound
//                        }
//                        var keyTemp = key
//                        keyTemp.replaceSubrange(keyTemp.characters.index(keyTemp.startIndex, offsetBy: 0)..<keyTemp.characters.index(keyTemp.startIndex, offsetBy: 2), with: "%@")
//                        keyTemp = NSLocalizedString(keyTemp, comment: "") as String
//                        keyTemp = keyTemp.replacingOccurrences(of: "%@", with: PublicClasses.massFormatter.string(fromValue: value, unit: unitToUse))
//                        print(keyTemp)
//                        GlobalVariables.sharedInstance.collarsSetValues[keyTemp] = value
//                        GlobalVariables.sharedInstance.collarsSetUnits[keyTemp] = unitKeep
//                    }
//                    else {
//                        if key != "No collar" {
//                            GlobalVariables.sharedInstance.collarsSetValues.removeValue(forKey: key)
//                            GlobalVariables.sharedInstance.collarsSetUnits.removeValue(forKey: key)
//                            let keyTemp = NSLocalizedString(key, comment: "")
//                            print(keyTemp)
//                            GlobalVariables.sharedInstance.collarsSetValues[keyTemp] = value
//                            GlobalVariables.sharedInstance.collarsSetUnits[keyTemp] = unitKeep
//                        }
//                    }
//                }
//                GlobalVariables.sharedInstance.collarsSetValues["No collar"] = 0
//
//
//                if isMetric == true {
//                    PublicClasses.switchUnitsTo("Kg")
//                }
//                else {
//                    PublicClasses.switchUnitsTo("lbs")
//                }
//
//                if isMetric == true {
//                    GlobalVariables.sharedInstance.barbellsListUnits["No barbell"] = "Kg"
//                }
//                else {
//                    GlobalVariables.sharedInstance.barbellsListUnits["No barbell"] = "lbs"
//                }
//
//                var currentInventoryList: [String: [Int]] = [String: [Int]]()
//                var currentInventoryUnits: [String: String] = [String: String]()
//                var currentCollarSet: [String: Double] = [String: Double]()
//                var currentBarbellSet: [String: Double] = [String: Double]()
//                for (keys, values) in GlobalVariables.sharedInstance.currentInventoryList {
//                    if keys != "Calculator only" {
//                        currentInventoryList[NSLocalizedString(keys, comment: "")] = values
//                    }
//                    else {
//                        currentInventoryList["Calculator only"] = values
//                    }
//                }
//                //                for (keys, values) in GlobalVariables.sharedInstance.currentInventoryUnits {
//                //                    if keys != "Calculator only" {
//                //                        currentInventoryUnits[NSLocalizedString(keys, comment: "")] = values
//                //                    }
//                //                    else {
//                //                        currentInventoryUnits["Calculator only"] = values
//                //                    }
//                //                }
//                for i in 0...GlobalVariables.sharedInstance.gymsChosen.count-1 {
//                    GlobalVariables.sharedInstance.gymsChosen[i] = NSLocalizedString(GlobalVariables.sharedInstance.gymsChosen[i], comment: "")
//                }
//                for (keys, values) in GlobalVariables.sharedInstance.currentCollarSet {
//                    if keys != "No collar" {
//                        currentCollarSet[NSLocalizedString(keys, comment: "")] = values.roundToPlaces(GlobalVariables.sharedInstance.currentDecimalPlaces)
//                    }
//                    else {
//                        currentCollarSet["No collar"] = values.roundToPlaces(GlobalVariables.sharedInstance.currentDecimalPlaces)
//                    }
//                }
//                for (keys, values) in GlobalVariables.sharedInstance.currentBarbellSet {
//                    if keys != "No barbell" {
//                        currentBarbellSet[NSLocalizedString(keys, comment: "")] = values.roundToPlaces(GlobalVariables.sharedInstance.currentDecimalPlaces)
//                    }
//                    else {
//                        currentBarbellSet["No barbell"] = values.roundToPlaces(GlobalVariables.sharedInstance.currentDecimalPlaces)
//                    }
//                }
//                currentBarbellSet["No barbell"] = 0
//                GlobalVariables.sharedInstance.currentCollarSet = currentCollarSet
//                GlobalVariables.sharedInstance.currentBarbellSet = currentBarbellSet
//                GlobalVariables.sharedInstance.currentInventoryList = currentInventoryList
//                //                GlobalVariables.sharedInstance.currentInventoryUnits = currentInventoryUnits
//                GlobalVariables.sharedInstance.weightStep = GlobalVariables.sharedInstance.currentPlates[1]
//                GlobalVariables.sharedInstance.currentCollarWeight = GlobalVariables.sharedInstance.currentCollarSet[GlobalVariables.sharedInstance.currentCollarName]!
//                GlobalVariables.sharedInstance.currentBarWeight = GlobalVariables.sharedInstance.currentBarbellSet[GlobalVariables.sharedInstance.currentBarName]!
//                DataAccess.sharedInstance.saveEverything()
//                return false
//            }
//        }
//        catch {
//            let nserror = error as NSError
//            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
//            abort()
//        }
//    }
//
//    open lazy var managedObjectContext: NSManagedObjectContext = {
//        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
//        let coordinator = self.persistentStoreCoordinator
//        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//        managedObjectContext.persistentStoreCoordinator = coordinator
//        return managedObjectContext
//    }()
//
//
//    open lazy var managedObjectModel: NSManagedObjectModel = {
//        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
//        let modelURL = Bundle.main.url(forResource: "Bar___Barbell_Plate_Weight_Calculator", withExtension: "momd")!
//        return NSManagedObjectModel(contentsOf: modelURL)!
//    }()
//
//    func deleteAllData(_ entity: String)
//    {
//        //    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let managedContext = managedObjectContext
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
//        fetchRequest.returnsObjectsAsFaults = false
//
//        do
//        {
//            let results = try managedContext.fetch(fetchRequest)
//            for managedObject in results
//            {
//                let managedObjectData: NSManagedObject = managedObject as! NSManagedObject
//                managedContext.delete(managedObjectData)
//            }
//        } catch let error as NSError {
//            //            print("Detele all data in \(entity) error : \(error) \(error.userInfo)")
//        }
//    }
//
//    // MARK: - Core Data stack
//
//    open lazy var applicationDocumentsDirectory: URL = {
//        // The directory the application uses to store the Core Data store file. This code uses a directory named "GibbsFFT.Bar___Barbell_Plate_Weight_Calculator" in the application's documents Application Support directory.
//        #if os(tvOS)
//        let urls = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
//        #else
//        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        #endif
//        return urls[urls.count-1]
//    }()
//
//
//    open lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
//        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
//        // Create the coordinator and store
//        let containerPath = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.BarbellPro.documents")?.path
//
//        let sqlitePath = NSString(format: "%@/%@", containerPath!, "Bar___Barbell_Plate_Weight_Calculator")
//        var url = URL(fileURLWithPath: sqlitePath as String)
//
//
//        var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
//        var failureReason = "There was an error creating or loading the application's saved data."
//        do {
//            let options = [NSMigratePersistentStoresAutomaticallyOption: true,
//                           NSInferMappingModelAutomaticallyOption: true]
//            try coordinator!.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: options)
//        } catch {
//            // Report any error we got.
//            var dict = [String: AnyObject]()
//            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject?
//            dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject?
//
//            dict[NSUnderlyingErrorKey] = error as NSError
//            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
//            // Replace this with code to handle the error appropriately.
//            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
//            abort()
//        }
//
//        return coordinator!
//    }()
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//    // MARK: - Core Data Saving support
//
//    open func saveContext () {
//        if managedObjectContext.hasChanges {
//            do {
//                try managedObjectContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nserror = error as NSError
//                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
//                abort()
//            }
//        }
//    }

}
