//
//  Structs.swift
//  Plates v3
//
//  Created by Nicholas Talavera on 6/22/18.
//  Copyright © 2018 Nicholas Talavera. All rights reserved.
//

import Foundation


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
    let count: Int
    let weight: Double
    let unitType: UnitOfWeight.unitType
}

struct Plates {
    let name: String
    let list: [Plate]
}

struct PlateCollection {
    let list: [Plates]
}

struct Gym {
    let name: String
    let unitType: UnitOfWeight.unitType
    let weights: Double
}

struct UnitOfWeight {
    enum unitType {
        case lb, kg
    }
    //Unit property and methods
    let unit: unitType
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

class AppProfile {
    var chosenUnit: UnitOfWeight
    var barbellCollection: BarbellCollection
    var collarCollection: CollarCollection
    var plateCollection: PlateCollection
    var currentBarbell: Barbell
    var currentCollar: Collar
    var currentPlateSet: Plates
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
                [Plate(count: 8, weight: 25, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 4, weight: 20, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 4, weight: 15, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 4, weight: 10, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 4, weight: 5, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 4, weight: 2.5, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 4, weight: 2, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 2, weight: 1.5, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 2, weight: 1, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 8, weight: 55, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 4, weight: 45, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 4, weight: 35, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 4, weight: 25, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 4, weight: 15, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 4, weight: 10, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 4, weight: 5, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 2, weight: 2.5, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 2, weight: 1.25, unitType: UnitOfWeight.unitType.lb)
                ]),
            Plates(name: "School gym", list:
                [Plate(count: 8, weight: 25, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 4, weight: 20, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 4, weight: 15, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 4, weight: 10, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 4, weight: 5, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 4, weight: 2.5, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 4, weight: 2, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 2, weight: 1.5, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 2, weight: 1, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 8, weight: 55, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 4, weight: 45, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 4, weight: 35, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 4, weight: 25, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 4, weight: 15, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 4, weight: 10, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 4, weight: 5, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 2, weight: 2.5, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 2, weight: 1.25, unitType: UnitOfWeight.unitType.lb)
                ]),
            Plates(name: "Home gym", list:
                [Plate(count: 8, weight: 25, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 4, weight: 20, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 4, weight: 15, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 4, weight: 10, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 4, weight: 5, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 4, weight: 2.5, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 4, weight: 2, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 2, weight: 1.5, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 2, weight: 1, unitType: UnitOfWeight.unitType.kg),
                 Plate(count: 8, weight: 55, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 4, weight: 45, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 4, weight: 35, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 4, weight: 25, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 4, weight: 15, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 4, weight: 10, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 4, weight: 5, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 2, weight: 2.5, unitType: UnitOfWeight.unitType.lb),
                 Plate(count: 2, weight: 1.25, unitType: UnitOfWeight.unitType.lb)
                ])
            ])
        currentBarbell = self.barbellCollection.list.last!
        currentCollar = self.collarCollection.list.last!
        currentPlateSet = self.plateCollection.list.first!
    }
    
    //Barbell set
    //Barbell chosen
    //Name
    //Weight
    //Collar set
    //Collar chosen
    //Name
    //Weight
    //Plate inventory
    //Weights
    //Units
    //Colors
}


