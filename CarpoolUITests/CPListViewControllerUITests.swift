//
//  CPListViewControllerUITests.swift
//  CarpoolUITests
//
//  Created by EAS on 7/11/18.
//  Copyright © 2018 Mtribs. All rights reserved.
//

import XCTest

class CPListViewControllerUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        super.tearDown()
    }
    
    func testListView(){
        
        // press on List in tapbar
        let listButton = app.tabBars.buttons["List"]
        listButton.tap()
    }
    
    func testUITableView() {
        //given
        let listButton = app.tabBars.buttons["List"]
        listButton.tap()
        let tableView = app.tables.element
        let lastCell = tableView.cells.element(boundBy: 3)
        tableView.scrollToElement(element: lastCell)
        XCTAssertFalse(tableView.cells.count == 0)
    }
    
}


extension XCUIElement {
    func scrollToElement(element: XCUIElement) {
        for _ in 0..<10 {
            swipeUp()
        }
    }
}



