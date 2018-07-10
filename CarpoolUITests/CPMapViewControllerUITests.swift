//
//  CPMapViewControllerUITests.swift
//  CarpoolUITests
//
//  Created by EAS on 7/11/18.
//  Copyright © 2018 Mtribs. All rights reserved.
//

import XCTest

class CPMapViewControllerUITests: XCTestCase {
    let app = XCUIApplication()
    override func setUp() {
        
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMapView(){
        
        // press on map in tapbar
        let mapButton = app.tabBars.buttons["Map"]
        mapButton.tap()
    }
    
    func testPinsOnMap(){
        let app = XCUIApplication()
        app.tabBars.buttons["Map"].tap()
        
        let mediterraneanSeaMap = app/*@START_MENU_TOKEN@*/.maps.containing(.other, identifier:"Mediterranean Sea").element/*[[".maps.containing(.other, identifier:\"Abu Qir Public Hospital\").element",".maps.containing(.other, identifier:\"Abu Qir Military Hospital\").element",".maps.containing(.other, identifier:\"Mediterranean Sea\").element"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        mediterraneanSeaMap.tap()
        mediterraneanSeaMap.tap()
        app/*@START_MENU_TOKEN@*/.maps.containing(.other, identifier:"Vegetable Garden In Montaza - Groves Researches").element/*[[".maps.containing(.other, identifier:\"Al Montaza\").element",".maps.containing(.other, identifier:\"Vegetable Garden In Montaza - Groves Researches\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.twoFingerTap()
        app/*@START_MENU_TOKEN@*/.maps.containing(.other, identifier:"Al Montaza").element.swipeLeft()/*[[".maps.containing(.other, identifier:\"El Matar Lake\").element",".swipeDown()",".swipeLeft()",".maps.containing(.other, identifier:\"Al Montaza\").element"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        
        // selecting random pin and tap on it
        let hhGo8125Element = app.otherElements["HH-GO8125"]
        hhGo8125Element.tap()
        hhGo8125Element.tap()
        
        let hhGo8396Element = app.otherElements["HH-GO8396"]
        hhGo8396Element.tap()
        hhGo8396Element.tap()
        hhGo8125Element.tap()
        
    }
}

