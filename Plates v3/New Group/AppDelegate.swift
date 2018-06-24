import UIKit
import CoreData
import GoogleMobileAds
import Armchair
import SwiftyStoreKit
import Firebase
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func applicationDidFinishLaunching(_ application: UIApplication) {
        UIApplication.shared.statusBarStyle = .lightContent
        GADMobileAds.configure(withApplicationID: "ca-app-pub-1971348423152920~2729632294")
        FIRApp.configure()
        SwiftyStoreKit.completeTransactions(atomically: true) { products in

            for product in products {
 
                if product.transaction.transactionState == .purchased || product.transaction.transactionState == .restored {

                    if product.needsFinishTransaction {
                        // Deliver content from server, then:
                        SwiftyStoreKit.finishTransaction(product.transaction)
                    }
                    print("purchased: \(product)")
                }
            }
        }
        
        self.window?.tintColor = GlobalVariables.sharedInstance.secondaryColor
//                DataAccess.sharedInstance.deleteAllData("AppData")
        _ = DataAccess.sharedInstance.loadIt()
        WatchSessionManager.sharedManager.startSession()
        GlobalVariables.sharedInstance.currentPlatesInUse = [String]()
        if GlobalVariables.sharedInstance.firstTime == false {
            DataAccess.sharedInstance.iCloudFetchUponLoad()
            PublicClasses.wcSendAllImportantGlobals(["Loaded before"])
        }
        else {
            DispatchQueue.main.async {
                DataAccess.sharedInstance.iCloudFetchFirstTime()
                PublicClasses.wcSendAllImportantGlobals(["First time"])
            }
        }
        GlobalVariables.sharedInstance.weightToLiftString = NSLocalizedString("Weight to lift", comment:"")
        let maxMinDifference: CGFloat = 0.83
        if Device.IS_3_5_INCHES() {
            print("IS_4_INCHES")
            GlobalVariables.sharedInstance.defaultFontSize = 20
            GlobalVariables.sharedInstance.currentMaxFont = GlobalVariables.sharedInstance.defaultFontSize
            GlobalVariables.sharedInstance.currentMinFont = GlobalVariables.sharedInstance.currentMaxFont * maxMinDifference
        }
        else if Device.IS_4_INCHES() {
            print("IS_4_INCHES")
            GlobalVariables.sharedInstance.defaultFontSize = 20
            GlobalVariables.sharedInstance.currentMaxFont = GlobalVariables.sharedInstance.defaultFontSize
            GlobalVariables.sharedInstance.currentMinFont = GlobalVariables.sharedInstance.currentMaxFont * maxMinDifference
        }
        else if Device.IS_4_7_INCHES() {
            print("IS_4_7_INCHES")
            GlobalVariables.sharedInstance.defaultFontSize = 24
            GlobalVariables.sharedInstance.currentMaxFont = GlobalVariables.sharedInstance.defaultFontSize
            GlobalVariables.sharedInstance.currentMinFont = GlobalVariables.sharedInstance.currentMaxFont * maxMinDifference
        }
        else if Device.IS_5_5_INCHES() {
            print("IS_5_5_INCHES")
            GlobalVariables.sharedInstance.defaultFontSize = 26
            GlobalVariables.sharedInstance.currentMaxFont = GlobalVariables.sharedInstance.defaultFontSize
            GlobalVariables.sharedInstance.currentMinFont = GlobalVariables.sharedInstance.currentMaxFont * maxMinDifference
        }
        else if Device.isPad() {
            print("isPad")
            GlobalVariables.sharedInstance.defaultFontSize = 26
            GlobalVariables.sharedInstance.currentMaxFont = GlobalVariables.sharedInstance.defaultFontSize
            GlobalVariables.sharedInstance.currentMinFont = GlobalVariables.sharedInstance.currentMaxFont * maxMinDifference
        }
    }


    internal func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let oldUnits = GlobalVariables.sharedInstance.units
        let oldInventorySet = GlobalVariables.sharedInstance.currentInventorySet
        let navigationController: UINavigationController = self.window!.rootViewController as! UINavigationController
        let masterViewController: KeyPadViewController = navigationController.viewControllers[0] as! KeyPadViewController
        if shortcutItem.type == "calculatorOnlyItem" {
            GlobalVariables.sharedInstance.currentInventoryName = "Calculator only"
            GlobalVariables.sharedInstance.currentInventorySet = GlobalVariables.sharedInstance.currentInventoryList[GlobalVariables.sharedInstance.currentInventoryName]!
        }
        else {
            var index: Int = 0
            if shortcutItem.type == "gymIndex0" {
                index = 0
            }
            if shortcutItem.type == "gymIndex1" {
                index = 1
            }

            if shortcutItem.type == "gymIndex2" {
                index = 2
            }

            GlobalVariables.sharedInstance.currentInventoryName = GlobalVariables.sharedInstance.gymsChosen[index]


            GlobalVariables.sharedInstance.gymsChosen.remove(at: GlobalVariables.sharedInstance.gymsChosen.index(of: GlobalVariables.sharedInstance.currentInventoryName)!)
            GlobalVariables.sharedInstance.gymsChosen.insert(GlobalVariables.sharedInstance.currentInventoryName, at: 0)
            var shortcutArray: [UIApplicationShortcutItem] = [UIApplicationShortcutItem(type: "calculatorOnlyItem", localizedTitle: NSLocalizedString("Calculator only", comment: ""), localizedSubtitle: "", icon: .none, userInfo: nil)]
            if GlobalVariables.sharedInstance.gymsChosen.count >= 1 {
                let shortcut2 = UIApplicationShortcutItem(type: "gymIndex0", localizedTitle: GlobalVariables.sharedInstance.gymsChosen[0], localizedSubtitle: "", icon: .none, userInfo: nil)
                shortcutArray.append(shortcut2)
            }
            if GlobalVariables.sharedInstance.gymsChosen.count >= 2 {
                let shortcut3 = UIApplicationShortcutItem(type: "gymIndex1", localizedTitle: GlobalVariables.sharedInstance.gymsChosen[1], localizedSubtitle: "", icon: .none, userInfo: nil)
                shortcutArray.append(shortcut3)
            }
            if GlobalVariables.sharedInstance.gymsChosen.count >= 3 {
                let shortcut4 = UIApplicationShortcutItem(type: "gymIndex2", localizedTitle: GlobalVariables.sharedInstance.gymsChosen[2], localizedSubtitle: "", icon: .none, userInfo: nil)
                shortcutArray.append(shortcut4)
            }
            UIApplication.shared.shortcutItems = shortcutArray
            GlobalVariables.sharedInstance.currentInventorySet = GlobalVariables.sharedInstance.currentInventoryList[GlobalVariables.sharedInstance.currentInventoryName]!
//            GlobalVariables.sharedInstance.units = GlobalVariables.sharedInstance.currentInventoryUnits[GlobalVariables.sharedInstance.currentInventoryName]!
            if GlobalVariables.sharedInstance.units == "Kg" {
                GlobalVariables.sharedInstance.unitsFormatter = MassFormatter.Unit.kilogram
            }
            else {
                GlobalVariables.sharedInstance.unitsFormatter = MassFormatter.Unit.pound
            }
        }

        var stillLower: Bool = PublicClasses.stillLower()

        if GlobalVariables.sharedInstance.didLoad == true {
            if oldInventorySet != GlobalVariables.sharedInstance.currentInventorySet {
                masterViewController.updateButtonsEnabledProtocol()
            }
            if stillLower == false {
                masterViewController.resetEverythingProtocol()
            }
            if oldUnits != GlobalVariables.sharedInstance.units {
                masterViewController.resetEverythingProtocol()
            }
            masterViewController.dismissPopovers()
        }
        completionHandler(true)
    }


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        DataAccess.sharedInstance.saveContext()
        DataAccess.sharedInstance.iCloudSave()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        DispatchQueue.main.async {
            PublicClasses.wcSendAllImportantGlobals(["Loaded before"])
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        DataAccess.sharedInstance.saveContext()
        DataAccess.sharedInstance.saveEverything()
        DataAccess.sharedInstance.iCloudSave()
        PublicClasses.wcSendAllImportantGlobals()
        //        let root : UINavigationController = self.window!.rootViewController! as! UINavigationController
        //        let master : KeyPadViewController = root.topViewController as! KeyPadViewController
        //        master.saveEverything()
    }

    // MARK: - Core Data stack
    
    
}

