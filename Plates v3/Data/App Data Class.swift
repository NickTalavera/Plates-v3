//
//  Structs.swift
//  Plates v3
//
//  Created by Nicholas Talavera on 6/22/18.
//  Copyright © 2018 Nicholas Talavera. All rights reserved.
//

import Foundation
import UIKit

struct UnitOfWeight {
    enum unitType {
        case lb, kg
    }
    //Unit property and methods
    var unit: unitType
    var formatter: MassFormatter.Unit {
        if unit == unitType.lb {
            return MassFormatter.Unit.pound
        }
        else {
            return MassFormatter.Unit.kilogram
        }
    }
    var decimalPlaces: Int {
        if unit == unitType.lb {
            return 2
        }
        else {
            return 2
        }
    }
    var opposite: unitType {
        if unit == unitType.lb {
            return unitType.kg
        }
        else {
            return unitType.lb
        }
    }
}



class AppData {
    struct Barbell {
        var name: String
        var unitType: UnitOfWeight.unitType
        var weight: Double
        
        func equals (compareTo:Barbell) -> Bool {
            return
                self.name == compareTo.name &&
                    self.unitType == compareTo.unitType &&
                    self.weight == compareTo.weight
        }
    }
    
    struct BarbellCollection {
        var list: [Barbell]
    }
    
    struct Collar {
        var name: String
        var unitType: UnitOfWeight.unitType
        var weight: Double
        
        func equals (compareTo:Collar) -> Bool {
            return
                self.name == compareTo.name &&
                    self.unitType == compareTo.unitType &&
                    self.weight == compareTo.weight
        }
    }
    
    struct CollarCollection {
        var list: [Collar]
    }
    
    struct Plate {
        var count: Int?
        let weight: Double
        let unitType: UnitOfWeight.unitType
        var positionOnBar: Int?
        
        func getDimensions()  -> (height: Double, width: Double, color: UIColor) {
            let red = UIColor(red: 255/255, green: 65/255, blue: 50/255, alpha: 1)
            let blue = UIColor(red: 62/255, green: 150/255, blue: 250/255, alpha: 1)
            let yellow = UIColor(red: 253/255, green: 189/255, blue: 64/255, alpha: 1)
            let white = UIColor.white
            let green = UIColor(red: 29/255, green: 194/255, blue: 74/255, alpha: 1)
            
            switch (self.weight, self.unitType) {
            case (25, UnitOfWeight.unitType.kg):
                return((height: 450,width: 64, color: red))
            case (20, UnitOfWeight.unitType.kg):
                return((height: 450,width: 54, color: blue))
            case (15, UnitOfWeight.unitType.kg):
                return((height: 450,width: 44, color: yellow))
            case (10, UnitOfWeight.unitType.kg):
                return((height: 450,width: 32, color: green))
            case (5, UnitOfWeight.unitType.kg):
                return((height: 450,width: 26, color: white))
            case (2.5, UnitOfWeight.unitType.kg):
                return((height: 210,width: 19, color: red))
            case (2, UnitOfWeight.unitType.kg):
                return((height: 190,width: 19, color: blue))
            case (1.5, UnitOfWeight.unitType.kg):
                return((height: 170,width: 18, color: yellow))
            case (1, UnitOfWeight.unitType.kg):
                return((height: 160,width: 15, color: green))
            case (55, UnitOfWeight.unitType.lb):
                return((height: 450,width: 82.5, color: red))
            case (45, UnitOfWeight.unitType.lb):
                return((height: 450,width: 71.11, color: blue))
            case (35, UnitOfWeight.unitType.lb):
                return((height: 450,width: 63.5, color: yellow))
            case (25, UnitOfWeight.unitType.lb):
                return((height: 450,width: 44.45, color: green))
            case (15, UnitOfWeight.unitType.lb):
                return((height: 450,width: 31.75, color: yellow))
            case (10, UnitOfWeight.unitType.lb):
                return((height: 450,width: 25.4, color: white))
            case (5, UnitOfWeight.unitType.lb):
                return((height: 190,width: 19, color: blue))
            case (2.5, UnitOfWeight.unitType.lb):
                return((height: 162,width: 15, color: green))
            case (1.25, UnitOfWeight.unitType.lb):
                return((height: 133.33,width: 10, color: white))
            default:
                return((height: 450,width: 45, color: UIColor.red))
            }
        }
        
        }
    
        public struct Plates {
            var name: String
            var list: [Plate]
            
            var widthOfPlates: Double {
                return self.list.map({$0.getDimensions()}).map({$0.width}).reduce(0, +)
            }
            
            func countPlates() -> Int {
                var count: Int = 0
                for (_, element) in self.list.enumerated() {
                    count += element.count!
                }
                return count
            }
            
            mutating func removeOuterPlate()  {
                var combined = zip(self.list.map {$0.positionOnBar}, self.list).sorted(by: {$0.0! < $1.0!}).map {$0.1}
                combined.removeLast()
                self.list = combined
            }
            
            mutating func sortPlates()  {
                var combined = zip(self.list.map {$0.weight}, self.list).sorted(by: {$0.0 > $1.0}).map {$0.1}
                for (index, _) in combined.enumerated() {
                    combined[index].positionOnBar = index
                }
                self.list = combined
            }
        }
        
        struct PlateCollection {
            let list: [Plates]
        }
        
        struct Gym {
            let name: String
            let unitType: UnitOfWeight.unitType
            let weights: Double
        }
        
        
        
        
        class Profile {
            
            
            var chosenUnit: UnitOfWeight
            var barbellCollection: BarbellCollection
            var collarCollection: CollarCollection
            var plateCollection: PlateCollection
            var currentBarbell: Barbell
            var currentCollar: Collar
            var currentPlateSet: Plates
            
            init() {
                chosenUnit = UnitOfWeight(unit: UnitOfWeight.unitType.lb)
//                print(PublicClasses.massFormatter.string(fromValue: 1, unit: MassFormatter.Unit.kilogram))
                barbellCollection = BarbellCollection( list: [
                    Barbell(name: NSLocalizedString("%@ barbell", comment: "").replacingOccurrences(of: "%@", with: 1.3.clean),
                            unitType: UnitOfWeight.unitType.kg, weight: 25.0),
//                    Barbell(name: "Olympic barbell", unitType: UnitOfWeight.unitType.kg, weight: 20.0),
//                    Barbell(name: NSLocalizedString("%@ barbell", comment: "").replacingOccurrences(of: "%@", with: PublicClasses.massFormatter.string(fromValue: 15, unit: UnitOfWeight(unit: UnitOfWeight.unitType.kg).formatter)), unitType: UnitOfWeight.unitType.kg, weight: 15.0),
//                    Barbell(name: NSLocalizedString("%@ barbell", comment: "").replacingOccurrences(of: "%@", with: PublicClasses.massFormatter.string(fromValue: 15, unit: UnitOfWeight(unit: UnitOfWeight.unitType.kg).formatter)), unitType: UnitOfWeight.unitType.kg, weight: 10.0),
//                    Barbell(name: NSLocalizedString("%@ barbell", comment: "").replacingOccurrences(of: "%@", with: PublicClasses.massFormatter.string(fromValue: 45, unit: UnitOfWeight(unit: UnitOfWeight.unitType.lb).formatter)), unitType: UnitOfWeight.unitType.lb, weight: 45.0),
                    Barbell(name: NSLocalizedString("Curl barbell", comment: ""), unitType: UnitOfWeight.unitType.lb, weight: 20.0),
                    Barbell(name: NSLocalizedString("No barbell", comment: ""), unitType: chosenUnit.unit, weight: 0.0)
                    ])
                
                collarCollection = CollarCollection( list: [
                    Collar(name: "Lock-jaw collar", unitType: UnitOfWeight.unitType.kg, weight: 0.2),
                    Collar(name: "Spring collar", unitType: UnitOfWeight.unitType.lb, weight: 1),
                    Collar(name: "No collar", unitType: chosenUnit.unit, weight: 0.0)
                    ])
                
                plateCollection = PlateCollection( list: [
                    Plates(name: "Work gym", list:
                        [Plate(count: 8, weight: 25, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 4, weight: 20, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 4, weight: 15, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 4, weight: 10, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 4, weight: 5, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 4, weight: 2.5, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 4, weight: 2, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 2, weight: 1.5, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 2, weight: 1, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 8, weight: 55, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 4, weight: 45, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 4, weight: 35, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 4, weight: 25, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 4, weight: 15, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 4, weight: 10, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 4, weight: 5, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 2, weight: 2.5, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 2, weight: 1.25, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0)
                        ]),
                    Plates(name: "School gym", list:
                        [Plate(count: 8, weight: 25, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 4, weight: 20, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 4, weight: 15, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 4, weight: 10, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 4, weight: 5, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 4, weight: 2.5, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 4, weight: 2, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 2, weight: 1.5, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 2, weight: 1, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 8, weight: 55, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 4, weight: 45, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 4, weight: 35, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 4, weight: 25, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 4, weight: 15, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 4, weight: 10, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 4, weight: 5, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 2, weight: 2.5, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 2, weight: 1.25, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0)
                        ]),
                    Plates(name: "Home gym", list:
                        [Plate(count: 8, weight: 25, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 4, weight: 20, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 4, weight: 15, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 4, weight: 10, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 4, weight: 5, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 4, weight: 2.5, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 4, weight: 2, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 2, weight: 1.5, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 2, weight: 1, unitType: UnitOfWeight.unitType.kg, positionOnBar: 0),
                         Plate(count: 8, weight: 55, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 4, weight: 45, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 4, weight: 35, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 4, weight: 25, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 4, weight: 15, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 4, weight: 10, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 4, weight: 5, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 2, weight: 2.5, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0),
                         Plate(count: 2, weight: 1.25, unitType: UnitOfWeight.unitType.lb, positionOnBar: 0)
                        ])
                    ])
                currentBarbell = self.barbellCollection.list.last!
                currentCollar = self.collarCollection.list.last!
                currentPlateSet = self.plateCollection.list.first!
            }
        }
        
        
        class Visuals {
            var textPadColor: UIColor
            var textPadColorDisabled: UIColor
            var secondaryColor: UIColor
            var fontTitle: UIFont
            var fontSubtitle: UIFont
            var mainColor: UIColor
            var keyPadBackgroundViewColor: UIColor
            var currentMaxFont: CGFloat
            var currentMinFont: CGFloat
            var gradientColor1: UIColor
            var gradientColor2: UIColor
            var defaultTextColor: UIColor
            var secondaryTextColor: UIColor
            var borderColor: UIColor
            var fontStandard: UIFont
            var fontStandardBold: UIFont
            var fontTextFieldRiser: UIFont
            var fontAddX: UIFont
            var placeholderColor: UIColor
            var errorColor: UIColor
            var secondaryColorBlend: UIColor
            var platesFadeDuration: Double
            var titleVerticalAdjustment: CGFloat
            var defaultFontSize: CGFloat
            init() {
                textPadColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.86)
                textPadColorDisabled = UIColor(red: 148/255, green: 151/255, blue: 161/255, alpha: 0.86)
                secondaryColor = UIColor(red: 33/255, green: 190/255, blue: 188/255, alpha: 0.86)
                fontTitle = UIFont(name: "Helvetica", size: 28)!
                fontSubtitle = UIFont(name: "Helvetica", size: 28)!
                mainColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
                keyPadBackgroundViewColor = UIColor(red: 142/255, green: 142/255, blue: 142/255, alpha: 1)
                textPadColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.86)
                textPadColorDisabled = UIColor(red: 148/255, green: 151/255, blue: 161/255, alpha: 0.86)
                currentMaxFont = 26
                currentMinFont = 15
                gradientColor1 = UIColor(red: 217/255, green: 85/255, blue: 89/255, alpha: 1)
                gradientColor2 = UIColor(red: 234/255, green: 91/255, blue: 96/255, alpha: 1)
                defaultTextColor = UIColor.black
                secondaryTextColor = UIColor.white
                borderColor = UIColor.black
                fontStandard = UIFont.systemFont(ofSize: 26, weight: UIFont.Weight.thin)
                fontStandardBold = UIFont.systemFont(ofSize: 26, weight: UIFont.Weight.regular)
                fontTextFieldRiser = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular)
                fontAddX = UIFont(name: "Helvetica", size: 60)!
                placeholderColor = UIColor(red: 148/255, green: 151/255, blue: 161/255, alpha: 0.86)
                errorColor = UIColor(red: 231/255, green: 41/255, blue: 18/255, alpha: 0.86)
                secondaryColorBlend = UIColor(red: 4/255, green: 180/255, blue: 72/255, alpha: 0.86)
                platesFadeDuration = 0.6
                titleVerticalAdjustment = 3.5
                defaultFontSize = 26
            }
        }
        
        class Status {
            var convertedUnitsOn: Bool
            var platesOutputSelectable: Bool
            var errorState: Bool
            var keyPadUsedNow: Bool
            var percentageModeActive: Bool
            var didLoad: Bool
            var alwaysSort: Bool
            var convertGymUnits: Bool
            var keypadMovedUp: Bool
            var currentPageUnit: UnitOfWeight.unitType
            var keyboardHeight: CGFloat
            var preferredLanguage: String
            init() {
                convertedUnitsOn = false
                platesOutputSelectable = false
                errorState = false
                keyPadUsedNow = false
                percentageModeActive = false
                convertGymUnits = false
                didLoad = false
                alwaysSort = false
                keypadMovedUp = false
                currentPageUnit = UnitOfWeight.unitType.lb
                keyboardHeight = 0
                preferredLanguage = NSLocale.preferredLanguages[0] as String
            }
        }
        
        class Calcs {
            var weightToLift: Double
            var currentPlatesInUse: Plates
            var weightToLiftString: String
            var weightToLiftNoUnitsString: String
            var percentage: Double
            init() {
                weightToLift = 0
                currentPlatesInUse = Plates.init(name: "Active", list: [])
                weightToLiftString = ""
                weightToLiftNoUnitsString = ""
                percentage = 0
            }
        }
        
        
        var calc: Calcs
        var status: Status
        var visuals: Visuals
        var profile: Profile
        init() {
            calc = Calcs()
            status = Status()
            visuals = Visuals()
            profile = Profile()
        }
        
        func switchUnits(toUnit: UnitOfWeight.unitType?=nil) {
            if self.profile.chosenUnit.unit == UnitOfWeight.unitType.kg || (toUnit == UnitOfWeight.unitType.lb && toUnit != nil) {
                self.profile.chosenUnit.unit = UnitOfWeight.unitType.lb
            }
            else {
                self.profile.chosenUnit.unit = UnitOfWeight.unitType.kg
            }
        }
        
        func convertedWeight(weight: Double, unitOfObject: UnitOfWeight.unitType) -> Double {
            if self.profile.chosenUnit.unit == unitOfObject {
                return weight
            }
            else if UnitOfWeight.unitType.kg == unitOfObject {
                return (weight * 2.20462262).rounded(toPlaces: self.profile.chosenUnit.decimalPlaces)
            }
            else if UnitOfWeight.unitType.lb == unitOfObject {
                return (weight / 2.20462262).rounded(toPlaces: self.profile.chosenUnit.decimalPlaces)
            }
            else {
                return 0
            }
        }
        
        func currentBarbellAndCollarSum() -> Double {
            return convertedWeight(weight: self.profile.currentBarbell.weight, unitOfObject: self.profile.currentBarbell.unitType) + convertedWeight(weight: self.profile.currentCollar.weight, unitOfObject: self.profile.currentCollar.unitType)
        }
        
        func sumOfCurrentPlatesInUse() -> Double {
            var sum: Double = 0
            for (_, element) in self.calc.currentPlatesInUse.list.enumerated() {
                sum += Double(element.count!) * convertedWeight(weight: element.weight, unitOfObject: element.unitType)
            }
            return sum
        }
        
        func updateWeightToLift(){
            self.calc.weightToLift = self.sumOfCurrentPlatesInUse() + self.currentBarbellAndCollarSum()
            self.calc.weightToLiftString = PublicClasses.massFormatter.string(fromValue: self.calc.weightToLift, unit: self.profile.chosenUnit.formatter)
            self.calc.weightToLiftNoUnitsString = PublicClasses.numberFormatterDecimal.string(from: self.calc.weightToLift as NSNumber)!
        }
        
        
        func appendCurrentPlate(weight: Double) {
            var maxPositionOnBar = 0
            for (_, element) in self.calc.currentPlatesInUse.list.enumerated() {
                maxPositionOnBar = max(element.positionOnBar!, maxPositionOnBar)
            }
            let nextBarPosition = maxPositionOnBar + 1
            self.calc.currentPlatesInUse.list += [Plate(count: 1, weight: weight, unitType: self.profile.chosenUnit.unit, positionOnBar: nextBarPosition)]
            if self.status.alwaysSort == true {
                self.calc.currentPlatesInUse.sortPlates()
            }
        }
}
