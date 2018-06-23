//
//  Plates_v3UITests.swift
//  Plates v3UITests
//
//  Created by Nicholas Talavera on 6/22/18.
//  Copyright © 2018 Nicholas Talavera. All rights reserved.
//

import XCTest

class Plates_v3UITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        var app: XCUIApplication!
        app = XCUIApplication()
        app.launch()
        
        let button = XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["55 lbs"]/*[[".images.buttons[\"55 lbs\"]",".buttons[\"55 lbs\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        button.tap()
        
    }
    
}
