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
        
//        let button = XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["55 lbs"]/*[[".images.buttons[\"55 lbs\"]",".buttons[\"55 lbs\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        button.tap()
        
    }
    
    func testBarbellAdvancedSettings() {
                let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.buttons["Barbell"]/*[[".images.buttons[\"Barbell\"]",".buttons[\"Barbell\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["%2 barbell"]/*[[".cells.staticTexts[\"%2 barbell\"]",".staticTexts[\"%2 barbell\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Plates"].buttons["Item"].tap()
        var tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Edit barbells"]/*[[".cells.staticTexts[\"Edit barbells\"]",".staticTexts[\"Edit barbells\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery.children(matching: .cell).element(boundBy: 0).children(matching: .textField).element(boundBy: 0).swipeLeft()
        
        
        app/*@START_MENU_TOKEN@*/.buttons["Barbell"]/*[[".images.buttons[\"Barbell\"]",".buttons[\"Barbell\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

         tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["%1 barbell"]/*[[".cells.staticTexts[\"%1 barbell\"]",".staticTexts[\"%1 barbell\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Plates"].buttons["Item"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Edit barbells"]/*[[".cells.staticTexts[\"Edit barbells\"]",".staticTexts[\"Edit barbells\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery.children(matching: .cell).element(boundBy: 0).children(matching: .textField).element(boundBy: 0).swipeLeft()
    }
}
