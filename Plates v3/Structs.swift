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
        else if unit == unitType.kg {
            return MassFormatter.Unit.kilogram
        }
        else {
            return MassFormatter.Unit.pound
        }
    }
    var decimalPlaces: Int {
        if unit == unitType.lb {
            return 1
        }
        else if unit == unitType.kg {
            return 2
        }
        else {
            return 1
        }
    }
}

class AppData {
    struct Barbell {
        let name: String
        let unitType: UnitOfWeight.unitType
        let weight: Double
    }
    
    struct BarbellCollection {
        let list: [Barbell]
    }
    
    struct Collar {
        let name: String
        let unitType: UnitOfWeight.unitType
        let weight: Double
    }
    
    struct CollarCollection {
        let list: [Collar]
    }
    
    struct Plate {
        var count: Int?
        let weight: Double
        let unitType: UnitOfWeight.unitType
        var positionOnBar: Int?
    }
    
    public struct Plates {
        var name: String
        var list: [Plate]
        
        func sumOfPlates() -> Double {
            var sum: Double = 0
            for (index, element) in self.list.enumerated() {
                sum += Double(element.count!) * element.weight
            }
            return sum
        }
        func countPlates() -> Int {
            var count: Int = 0
            for (index, element) in self.list.enumerated() {
                count += element.count!
            }
            return count
        }
        
        mutating func sortPlates()  {
            var combined = zip(self.list.map {$0.weight}, self.list).sorted(by: {$0.0 < $1.0}).map {$0.1}
            for (index, element) in combined.enumerated() {
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
        var currentBarbellAndCollarSum: Double {
            return currentBarbell.weight + currentCollar.weight
        }
        init() {
            chosenUnit = UnitOfWeight(unit: UnitOfWeight.unitType.lb)
            barbellCollection = BarbellCollection( list: [
                Barbell(name: "%1 barbell", unitType: UnitOfWeight.unitType.kg, weight: 25.0),
                Barbell(name: "Olympic barbell", unitType: UnitOfWeight.unitType.kg, weight: 20.0),
                Barbell(name: "%2 barbell", unitType: UnitOfWeight.unitType.kg, weight: 15.0),
                Barbell(name: "%3 barbell", unitType: UnitOfWeight.unitType.kg, weight: 10.0),
                Barbell(name: "%4 barbell", unitType: UnitOfWeight.unitType.lb, weight: 45.0),
                Barbell(name: "Curl barbell", unitType: UnitOfWeight.unitType.lb, weight: 20.0),
                Barbell(name: "No barbell", unitType: chosenUnit.unit, weight: 0.0)
                ])
            
            collarCollection = CollarCollection( list: [
                Collar(name: "%1 barbell", unitType: UnitOfWeight.unitType.kg, weight: 25.0),
                Collar(name: "Olympic barbell", unitType: UnitOfWeight.unitType.kg, weight: 20.0),
                Collar(name: "%2 barbell", unitType: UnitOfWeight.unitType.kg, weight: 15.0),
                Collar(name: "%3 barbell", unitType: UnitOfWeight.unitType.kg, weight: 10.0),
                Collar(name: "%4 barbell", unitType: UnitOfWeight.unitType.lb, weight: 45.0),
                Collar(name: "Curl barbell", unitType: UnitOfWeight.unitType.lb, weight: 20.0),
                Collar(name: "No barbell", unitType: chosenUnit.unit, weight: 0.0)
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
        var currentPageUnit: UnitOfWeight.unitType
        init() {
            convertedUnitsOn = false
            platesOutputSelectable = false
            errorState = false
            keyPadUsedNow = false
            percentageModeActive = false
            didLoad = false
            alwaysSort = false
            currentPageUnit = UnitOfWeight.unitType.lb
        }
    }
    
    class Calcs {
        var weightToLift: Double
        var weightToLiftString: String
        var currentPlatesInUse: Plates
        init() {
            weightToLift = 0
            weightToLiftString = ""
            currentPlatesInUse = Plates.init(name: "Active", list: [])
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
    
    func updateWeightToLift(){
        self.calc.weightToLift = self.calc.currentPlatesInUse.sumOfPlates() + self.profile.currentBarbellAndCollarSum
    }
    

    
    func appendCurrentPlate(weight: Double) {
        var maxPositionOnBar = 0
        for (index, element) in self.calc.currentPlatesInUse.list.enumerated() {
            maxPositionOnBar = max(element.positionOnBar!, maxPositionOnBar)
        }
        let nextBarPosition = maxPositionOnBar + 1
        self.calc.currentPlatesInUse.list += [Plate(count: 1, weight: weight, unitType: self.profile.chosenUnit.unit, positionOnBar: nextBarPosition)]
//        if app.status.alwaysSort == true {
//            self.calc.currentPlatesInUse.sortPlates()
//        }
    }
}
