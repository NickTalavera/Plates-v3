////
////  Global.swift
////  Barbell Calculator
////
////  Created by Nick Talavera on 4/9/16.
////  Copyright © 2016 Nick Talavera. All rights reserved.
////
//
//import Foundation
//#if os(iOS)
//import UIKit
//#elseif os(watchOS)
//import WatchKit
//#elseif os(OSX)
//import AppKit
//#elseif os(tvOS)
//import UIKit
//#endif
//
//
//class GlobalVariables {

//    var barbellsList: [String: Double] = ["%1 barbell": 25.0, "Olympic barbell": 20.0, "%3 barbell": 15.0, "%4 barbell": 10.0, "%5 barbell": 45, "Curl barbell": 20.0,"No barbell": 0]
//    var barbellsListUnits: [String: String] = ["%1 barbell": "Kg", "Olympic barbell": "Kg", "%3 barbell": "Kg", "%4 barbell": "Kg", "%5 barbell": "lbs", "Curl barbell": "lbs","No barbell": "Kg"]
//    var currentBarbellSet = [String: Double]()
//    var currentBarWeight: Double = -1000
//    var currentBarName: String = "No barbell"
//
//    //    var platesLBS: [Double] = [55,45,35,25,15,10,5,2.5,1.25]
//    var platesKGtoLBS: [Double] = [55.12,44.09,33.07,22.05,11.02,5.51,4.41,3.31,2.2]
//    var platesLBStoKG: [Double] = [24.95,20.41,15.88,11.34,6.8,4.54,2.27,1.13,0.57]
//
//    var platesList: [Double] = [25,20,15,10,5,2.5,2,1.5,1,55,45,35,25,15,10,5,2.5,1.25]
//    var currentPlateHeights: [Double] = [450,450,450,450,450,210,190,170,160,450,450,450,450,450,450,190,162,133.33]
//    var currentPlateWidths: [Double] = [64,54,44,32,26,19,19,18,15,82.5,71.11,63.5,44.45,31.75,25.4,19,15,10]
//    var currentPlates: [Double] = [0.0]
//    var currentPlatesInUse: [String] = [String]()
//    var currentInventorySet: [Int] = [6,8,4,4,4,4,4,2,2,6,8,4,4,4,4,4,2,2]
//    var currentInventoryList: [String: [Int]] = ["Calculator only": [20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20], "Home gym": [0,2,0,4,0,0,6,0,0,6,8,4,4,4,4,4,2,2],"Work gym": [6,8,4,4,4,4,4,2,2,0,0,0,0,0,0,0,0,0],"School gym": [6,8,4,4,4,4,4,2,2,6,8,4,4,4,4,4,2,2],"Public gym": [6,8,4,4,4,4,4,2,2,6,8,4,4,4,4,4,2,2],"Private gym": [6,8,4,4,4,4,4,2,2,6,8,4,4,4,4,4,2,2]]
//    //    var currentInventoryList: [String: [Int]] = ["Calculator only": [0,0,0,0,0,0,0,0,0,20,20,20,20,20,20,20,20,20], "Home gym": [6,8,4,4,4,4,4,2,2,6,8,4,4,4,4,4,2,2],"Work gym": [6,8,4,4,4,4,4,2,2,6,8,4,4,4,4,4,2,2],"School gym": [6,8,4,4,4,4,4,2,2,6,8,4,4,4,4,4,2,2],"Public gym": [6,8,4,4,4,4,4,2,2,6,8,4,4,4,4,4,2,2],"Private gym": [6,8,4,4,4,4,4,2,2,6,8,4,4,4,4,4,2,2]]
//    //    var currentInventoryUnits: [String: String] = ["Calculator only": "", "Home gym": "Kg","Work gym": "Kg","School gym": "lbs","Public gym": "lbs","Private gym": "Kg"]
//    var currentInventoryName: String = "Calculator only"
//    var gymsChosen: [String] = ["Home gym","Work gym", "School gym"]
//    var collarsSetValues: [String: Double] = ["No collar": 0, "Spring collar": 1, "Lock-jaw collar": 0.16]
//    var collarsSetUnits: [String: String] = ["No collar": "lbs", "Spring collar": "lbs", "Lock-jaw collar": "Kg"]
//    var currentCollarSet: [String: Double] = [String: Double]()
//    var convertedUnitsOn: Bool = false
//    var platesOutputSelectable: Bool = false
//    var errorState: Bool = false
//    var keyPadUsedNow: Bool = false
//    var percentageModeActive: Bool = false
//    var currentCollarWeight: Double = -1000
//    var currentCollarName: String = "No collar"
//    var weightToLiftString: String = "Weight to lift"
//    var weightStep: Double = 0
//    var weightStepKG: Double = 0.3125
//    var weightStepLBS: Double = 1.25
//    var wideLabelMode: String = "barbell"
//    var alwaysSort: Bool = true
//    var units: String = "lbs"
//    var unitsFormatter: MassFormatter.Unit = MassFormatter.Unit.pound
//    var userId: Int = 0
//    var convertGymUnits: Bool = false
//    var dismissPopover: Bool = false
//    var weightToLift: Double = 0
//    let animationTime: Double = 0.3
//    var plateColors: [Color] = [Color(red: 255/255, green: 65/255, blue: 50/255, alpha: 1),
//                                Color(red: 62/255, green: 150/255, blue: 250/255, alpha: 1),
//                                Color(red: 253/255, green: 189/255, blue: 64/255, alpha: 1),
//                                Color(red: 29/255, green: 194/255, blue: 74/255, alpha: 1),
//                                Color.white,
//                                Color(red: 255/255, green: 65/255, blue: 50/255, alpha: 1),
//                                Color(red: 62/255, green: 150/255, blue: 250/255, alpha: 1),
//                                Color(red: 253/255, green: 189/255, blue: 64/255, alpha: 1),
//                                Color(red: 29/255, green: 194/255, blue: 74/255, alpha: 1),
//                                Color(red: 255/255, green: 65/255, blue: 50/255, alpha: 1),
//                                Color(red: 62/255, green: 150/255, blue: 250/255, alpha: 1),
//                                Color(red: 253/255, green: 189/255, blue: 64/255, alpha: 1),
//                                Color(red: 29/255, green: 194/255, blue: 74/255, alpha: 1),
//                                Color(red: 253/255, green: 189/255, blue: 64/255, alpha: 1),
//                                Color.white,
//                                Color(red: 62/255, green: 150/255, blue: 250/255, alpha: 1),
//                                Color(red: 29/255, green: 194/255, blue: 74/255, alpha: 1),
//                                Color.white]
//
//    //    var plateColorsKG: [Color] = [Color(red: 255/255, green: 65/255, blue: 50/255, alpha: 1),
//    //    Color(red: 62/255, green: 150/255, blue: 250/255, alpha: 1),
//    //    Color(red: 253/255, green: 189/255, blue: 64/255, alpha: 1),
//    //    Color(red: 68/255, green: 220/255, blue: 94/255, alpha: 1),
//    //    Color.white,
//    //    Color(red: 255/255, green: 65/255, blue: 50/255, alpha: 1),
//    //    Color(red: 62/255, green: 150/255, blue: 250/255, alpha: 1),
//    //    Color(red: 253/255, green: 189/255, blue: 64/255, alpha: 1),
//    //    Color(red: 68/255, green: 220/255, blue: 94/255, alpha: 1)]
//    //    var plateColorsLBS: [Color] = [Color(red: 255/255, green: 65/255, blue: 50/255, alpha: 1),
//    //    Color(red: 62/255, green: 150/255, blue: 250/255, alpha: 1),
//    //    Color(red: 253/255, green: 189/255, blue: 64/255, alpha: 1),
//    //    Color(red: 68/255, green: 220/255, blue: 94/255, alpha: 1),
//    //    Color(red: 253/255, green: 189/255, blue: 64/255, alpha: 1),
//    //    Color.white,
//    //    Color(red: 62/255, green: 150/255, blue: 250/255, alpha: 1),
//    //    Color(red: 68/255, green: 220/255, blue: 94/255, alpha: 1),
//    //    Color.white]
//    //    #endif
//
//    #if os(iOS) || os(tvOS) || os(watchOS)
//    var fontStandard: Font = Font.systemFont(ofSize: 26, weight: UIFont.Weight.thin)
//    var fontStandardBold: Font = Font.systemFont(ofSize: 26, weight: UIFont.Weight.regular)
//    var fontTextFieldRiser: Font = Font.systemFont(ofSize: 18, weight: UIFont.Weight.regular)
//    #elseif os(OSX)
//    var fontStandard: Font = Font.systemFont(ofSize: 26)
//    //    var fontStandardBold = Font.systemFontOfSize(26, weight: NSFontWeightRegular)
//    var fontStandardBold: Font = Font.systemFont(ofSize: 26)
//    //    var fontTextFieldRiser = Font.systemFontOfSize(18, weight: NSFontWeightRegular)
//    var fontTextFieldRiser: Font = Font.systemFont(ofSize: 18)
//    #endif
//
//
//    #if os(iOS) || os(tvOS) || os(OSX)
//    var fontAddX: Font = Font(name: "StampborLines", size: 60)!
//    #endif
//
//
//    var fontTitle = Font(name: "StampborLines", size: 28)
//    var fontSubtitle = Font(name: "StampborRounded", size: 28)
//    var mainColor = Color(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
//    var keyPadBackgroundViewColor = Color(red: 142/255, green: 142/255, blue: 142/255, alpha: 1)
//    var textPadColor = Color(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.86)
//    var textPadColorDisabled = Color(red: 148/255, green: 151/255, blue: 161/255, alpha: 0.86)
//    var currentMaxFont: CGFloat = 26
//    var currentMinFont: CGFloat = 15
//    var gradientColor1: Color = Color(red: 217/255, green: 85/255, blue: 89/255, alpha: 1)
//    var gradientColor2: Color = Color(red: 234/255, green: 91/255, blue: 96/255, alpha: 1)
//    var placeholderColor: Color = Color(red: 148/255, green: 151/255, blue: 161/255, alpha: 0.86)
//    var secondaryColor: Color = Color(red: 33/255, green: 190/255, blue: 188/255, alpha: 0.86)
//    let tvOSSegmentedControlColor: Color = Color.init(red: 212/255, green: 212/255, blue: 212/255, alpha: 1)
//    let tvOSSystemButtonColor: Color = Color.init(red: 125/255, green: 125/255, blue: 125/255, alpha: 1)
//    var errorColor: Color = Color(red: 231/255, green: 41/255, blue: 18/255, alpha: 0.86)
//    var secondaryColorBlend: Color = Color(red: 4/255, green: 180/255, blue: 72/255, alpha: 0.86)
//    var defaultTextColor: Color = Color.black
//    var secondaryTextColor: Color = Color.white
//    var borderColor: Color = Color.black
//    var plateButtonColor: Color = Color(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
//    var watchToggleButtonColor: Color = Color(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
//    var watchClearRemoveButtonColor: Color = Color(red: 255/255, green: 97/255, blue: 89/255, alpha: 1)
//
//    //    class var sharedInstance: GlobalVariables {
//    //        struct Static {
//    //            static var instance: GlobalVariables?
//    //            //            static var token: dispatch_once_t = 0
//    //        }
//    //
//    //        //        dispatch_once(&Static.token) {
//    //        //            Static.instance = GlobalVariables()
//    //        //        }
//    //        return Static.instance!
//    //    }
//
//    static let sharedInstance : GlobalVariables = {
//        let instance = GlobalVariables()
//        return instance
//    }()
//
//
//}
