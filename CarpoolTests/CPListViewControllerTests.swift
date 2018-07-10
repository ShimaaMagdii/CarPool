//
//  CPListViewControllerTests.swift
//  CarpoolTests
//
//  Created by Shimaa Magdi on 7/10/18.
//  Copyright © 2018 Mtribs. All rights reserved.
//

import UIKit
import XCTest

@testable import Carpool

class CPListViewControllerTests: XCTestCase {
    
    //declaring the ViewController under test as an implicitly unwrapped optional
    var listVCTests : CPListViewController!
    
    override func setUp() {
        super.setUp()
        listVCTests = CPListViewController.create()
        
        //load view hierarchy
        if(listVCTests != nil) {
            
            listVCTests.loadView()
            listVCTests.viewDidLoad()
        }
    }
    
    override func tearDown() {
        listVCTests = nil
        super.tearDown()
    }
    
    func testViewControllerIsComposedOfTableView() {
        
        XCTAssertNotNil(listVCTests.tableView, "tableView under test is not composed of a TableView")
    }
    
    func testControllerConformsToTableViewDelegate() {
        XCTAssert(listVCTests.conforms(to: UITableViewDelegate.self), "CPListViewController under test does not conform to UITableViewDelegate protocol")
        XCTAssert(listVCTests.conforms(to: UITableViewDataSource.self), "CPListViewController under test does not conform to UITableViewDataSource protocol")
    }
    
    func testTableViewViewDelegateIsSet() {
        
        XCTAssertNotNil(self.listVCTests.tableView.delegate)
    }
    
    func testControllerImplementsTableViewDelegateMethods() {
        
        XCTAssert(listVCTests.responds(to: #selector(UITableViewDataSource.tableView(_:numberOfRowsInSection:))),"ViewController under test does not implement tableView:numberOfRowsInSection")
        
        XCTAssert(listVCTests.responds(to: #selector(UITableViewDelegate.tableView(_:didSelectRowAt:))),"ViewController under test does not implement tableView:didSelectRowAt")
    }
    
}


