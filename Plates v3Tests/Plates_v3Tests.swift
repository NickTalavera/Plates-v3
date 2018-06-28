//
//  Plates_v3Tests.swift
//  Plates v3Tests
//
//  Created by Nicholas Talavera on 6/22/18.
//  Copyright © 2018 Nicholas Talavera. All rights reserved.
//

import XCTest
@testable import Plates_v3

class Plates_v3Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUnitOfWeight() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let lbUnit = UnitOfWeight(unit: UnitOfWeight.unitType.lb)
        XCTAssert(lbUnit.formatter == MassFormatter.Unit.pound)
        XCTAssert(lbUnit.decimalPlaces == 1)
        let kgUnit = UnitOfWeight(unit: UnitOfWeight.unitType.kg)
        XCTAssert(kgUnit.formatter == MassFormatter.Unit.kilogram)
        XCTAssert(kgUnit.decimalPlaces == 2)
    }
    
    func testAppProfile() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = AppData()
        print(app.calc.currentPlatesInUse)
        XCTAssert(app.sumOfCurrentPlatesInUse() == 0)
        XCTAssert(app.sumOfCurrentPlatesInUse() == 0)
        app.calc.currentPlatesInUse = app.profile.currentPlateSet
        print(app.calc.currentPlatesInUse)
        print(app.sumOfCurrentPlatesInUse())
        print(app.calc.currentPlatesInUse.countPlates())
        XCTAssert(app.sumOfCurrentPlatesInUse() > 0)
        XCTAssert(app.calc.currentPlatesInUse.countPlates() > 0)
    }
    
    func testWeightToLiftSum() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = AppData()
        print(app.calc.weightToLift)
        XCTAssert(app.calc.weightToLift == 0)
        app.calc.currentPlatesInUse = app.profile.currentPlateSet
        print(app.calc.weightToLift)
        app.updateWeightToLift()
        print(app.calc.weightToLift)
        XCTAssert(app.calc.weightToLift != 0)
    }
    
    func flipUnits() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = AppData()
        XCTAssert(app.profile.chosenUnit.unit == UnitOfWeight.unitType.lb)
        XCTAssert(app.profile.chosenUnit.decimalPlaces == 1)
        app.switchUnits()
        XCTAssert(app.profile.chosenUnit.unit == UnitOfWeight.unitType.kg)
        XCTAssert(app.profile.chosenUnit.decimalPlaces == 2)
        print(app.profile.chosenUnit.unit)
        app.switchUnits()
        print(app.profile.chosenUnit.unit)
        XCTAssert(app.profile.chosenUnit.unit == UnitOfWeight.unitType.lb)
        XCTAssert(app.profile.chosenUnit.decimalPlaces == 1)
        app.switchUnits(toUnit: UnitOfWeight.unitType.lb)
        XCTAssert(app.profile.chosenUnit.unit == UnitOfWeight.unitType.lb)
        XCTAssert(app.profile.chosenUnit.decimalPlaces == 1)
        app.switchUnits(toUnit: UnitOfWeight.unitType.kg)
        XCTAssert(app.profile.chosenUnit.unit == UnitOfWeight.unitType.kg)
        XCTAssert(app.profile.chosenUnit.decimalPlaces == 2)
    }
    
    func testAppendToCurrent() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = AppData()
        app.appendCurrentPlate(weight: 10)
        app.appendCurrentPlate(weight: 45)
        app.appendCurrentPlate(weight: 22)
        app.appendCurrentPlate(weight: 55)
        app.appendCurrentPlate(weight: 33)
        XCTAssert(app.calc.currentPlatesInUse.countPlates() == 5)
        app.appendCurrentPlate(weight: 10)
        app.appendCurrentPlate(weight: 45)
        app.appendCurrentPlate(weight: 22)
        app.appendCurrentPlate(weight: 55)
        app.appendCurrentPlate(weight: 33)
        XCTAssert(app.calc.currentPlatesInUse.countPlates() == 10)
    }
    
    func testSortPlates() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = AppData()
        app.appendCurrentPlate(weight: 10)
        app.appendCurrentPlate(weight: 45)
        app.appendCurrentPlate(weight: 22)
        app.appendCurrentPlate(weight: 55)
        app.appendCurrentPlate(weight: 33)
        app.calc.currentPlatesInUse.sortPlates()
        print(app.calc.currentPlatesInUse.list)
    }
    
    func testRemoveLast() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = AppData()
        app.appendCurrentPlate(weight: 10)
        app.appendCurrentPlate(weight: 45)
        app.appendCurrentPlate(weight: 22)
        app.appendCurrentPlate(weight: 55)
        app.appendCurrentPlate(weight: 33)
        app.calc.currentPlatesInUse.list = zip(app.calc.currentPlatesInUse.list.map {$0.weight}, app.calc.currentPlatesInUse.list).sorted(by: {$0.0 < $1.0}).map {$0.1}
        var combined = zip(app.calc.currentPlatesInUse.list.map {$0.positionOnBar}, app.calc.currentPlatesInUse.list).sorted(by: {$0.0! < $1.0!}).map {$0.1}
        combined.removeLast()
        app.calc.currentPlatesInUse.removeOuterPlate()
//        XCTAssert(app.calc.currentPlatesInUse.list.map {($0.positionOnBar!,$0.weight)} == combined.map {($0.positionOnBar!,$0.weight)})
    }
    
    func testDrawPlate() {
    PublicClasses.drawPlates(UIView(frame: CGRect(x: 100, y: 100, width: 400, height: 300)))
    }
    
    
    func testOptimize() {
        let app = AppData()
        app.appendCurrentPlate(weight: 10)
        app.appendCurrentPlate(weight: 10)
        app.appendCurrentPlate(weight: 10)
        app.appendCurrentPlate(weight: 10)
        app.appendCurrentPlate(weight: 40)
        app.appendCurrentPlate(weight: 20)
        app.appendCurrentPlate(weight: 25)
        app.appendCurrentPlate(weight: 55)
        app.appendCurrentPlate(weight: 55)
        app.appendCurrentPlate(weight: 30)
        print("Weight: \(100)")
        var newPlates: [AppData.Plate] = []
        let weightsToCombine = app.calc.currentPlatesInUse.list.filter({$0.unitType == app.profile.chosenUnit.unit}).map({Int($0.weight)}).sorted(by: >)
        print(weightsToCombine)
        let goal = 100
        var diff = goal
        while diff > 10 {
            print(weightsToCombine[0])
        }
        
        
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
