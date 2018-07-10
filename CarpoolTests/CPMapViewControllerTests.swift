//
//  CPMapViewControllerTests.swift
//  CarpoolTests
//
//  Created by Shimaa Magdi on 7/10/18.
//  Copyright © 2018 Mtribs. All rights reserved.
//

import UIKit
import XCTest
import MapKit

@testable import Carpool

class CPMapViewControllerTests: XCTestCase {
    
    //declaring the ViewController under test as an implicitly unwrapped optional
    var mapVCTests : CPMapViewController!
    
    override func setUp() {
        super.setUp()
        mapVCTests = CPMapViewController.create()
        
        //load view hierarchy
        if(mapVCTests != nil) {
            
            mapVCTests.loadView()
            mapVCTests.viewDidLoad()
        }
    }
    
    override func tearDown() {
        mapVCTests = nil
        super.tearDown()
    }
    
    func testViewControllerIsComposedOfMapView() {
        
        XCTAssertNotNil(mapVCTests.mapView, "mapView under test is not composed of a MKMapView")
    }
    
    func testControllerConformsToMKMapViewDelegate() {
        XCTAssert(mapVCTests.conforms(to: MKMapViewDelegate.self), "CPMapViewController under test does not conform to MKMapViewDelegate protocol")
    }
    
    func testControllerConformsToLocationManagerDelegatee() {
        XCTAssert(mapVCTests.conforms(to: CLLocationManagerDelegate.self), "CPMapViewController under test does not conform to CLLocationManagerDelegate protocol")
    }
    
    func testMapViewViewDelegateIsSet() {
        
        XCTAssertNotNil(self.mapVCTests.mapView.delegate)
    }
    
    func testControllerImplementsMapViewDelegateMethods() {
        XCTAssert(mapVCTests.responds(to: #selector(MKMapViewDelegate.mapView(_:didSelect:))),"ViewController under test does not implement mapView:didSelectMKAnnotationView")
        
        XCTAssert(mapVCTests.responds(to: #selector(MKMapViewDelegate.mapView(_:didDeselect:))),"ViewController under test does not implement mapView:didDeselectMKAnnotationView")
    }
    
}


