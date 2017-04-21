//
//  ToDoListUITests.swift
//  ToDoListUITests
//
//  Created by Andreas Schmitt on 10.04.17.
//  Copyright © 2017 Andreas Schmitt. All rights reserved.
//

import XCTest

class ToDoListUITests: XCTestCase {
        
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
        let app = XCUIApplication()
        app.tabBars.buttons["Second"].tap()
        let textField = app.textFields["todoTextField"]
        textField.tap()
        textField.typeText("My_First_ToDo")
        textField.typeText("\n")
        
        XCTAssertEqual(textField.value as! String, "My_First_ToDo")
        
        let button = app.buttons["toDoSubmitButton"]
        button.tap()
        
        XCTAssertEqual(textField.placeholderValue!, "New ToDo please")
        
        app.tabBars.buttons["First"].tap()
        
        let table = app.tables["ToDoTable"]
        let cells = table.cells
        XCTAssertEqual(cells.count, 3)
        
    }
    
}
