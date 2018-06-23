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
        let appProfile = AppProfile()
        XCTAssert(1==1)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
