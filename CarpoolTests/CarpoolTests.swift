//
//  CarpoolTests.swift
//  CarpoolTests
//
//  Created by Shimaa Magdi on 7/8/18.
//  Copyright © 2018 Mtribs. All rights reserved.
//

import XCTest
import ObjectMapper

@testable import Carpool

class CarpoolTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMapPlacemarkDataModelToPlacemarkViewModel (){
        
        if let json = Utils.readJsonData(fromFile: "locationsTest") {
            let placemarkDataModel :CPPlacemarkDataModel = Mapper<CPPlacemarkDataModel>().map(JSON: json)!
            
            XCTAssertNotNil(placemarkDataModel)
            XCTAssertEqual(placemarkDataModel.placemarks?.count, 3)
            
            let placemarkViewModel: CPPlacemarkViewModel  =
                CPPlacemarkParser.mapPlacemarkDataModelToPlacemarkViewModel(placemark: placemarkDataModel.placemarks![0])
            
            XCTAssertNotNil(placemarkViewModel)
            XCTAssertEqual(placemarkViewModel.address, "Lesserstraße 170, 22049 Hamburg")
            
            let placemark: CPPlacemarkViewModel  =
                CPPlacemarkParser.mapPlacemarkDataModelToPlacemarkViewModel(placemark: placemarkDataModel.placemarks![2])
            
            XCTAssertEqual(placemark.fuel, 90)
        }
        
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            self.testMapPlacemarkDataModelToPlacemarkViewModel()
        }
    }
    
}
