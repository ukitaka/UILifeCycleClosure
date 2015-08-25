//
//  UITests.swift
//  UITests
//
//  Created by Yuki Takahashi on 2015/10/13.
//  Copyright © 2015年 CocoaPods. All rights reserved.
//

import XCTest

class UITests: XCTestCase {
        
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
    
    func testExample1() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        
        // Select cell.
        app.tables.element.cells.elementBoundByIndex(0).tap()
        
        // Input text and submit.
        app.textFields.element.tap()
        app.textFields.element.typeText("ABCDEFG")
        app.buttons["Go"].tap()
        
        // Check text.
        XCTAssert(app.staticTexts["ABCDEFG"].exists)
        
        // lower case.
        app.buttons["lower"].tap()
        XCTAssert(app.staticTexts["abcdefg"].exists)
        
        // next.
        app.buttons["next"].tap()
        
        // Check text.
        XCTAssert(app.staticTexts["abcdefg"].exists)
    }
    
    func testExample2() {
        let app = XCUIApplication()
        
        // show example2 vc
        app.tables.element.cells.elementBoundByIndex(1).tap()
        
        // and transition to detail vc automatically.
        
        // detail vc has 'OK' label
        XCTAssert(app.staticTexts["OK"].exists)
        
        let label = app.staticTexts["afterViewDidAppear2"]
        let exists = NSPredicate(format: "exists == 1")
        expectationForPredicate(exists, evaluatedWithObject: label, handler: nil)
        waitForExpectationsWithTimeout(5, handler: nil)
        
        // invoke blocks in order.
        XCTAssert(app.staticTexts["afterViewDidAppear2"].exists)
        
    }
    
}
