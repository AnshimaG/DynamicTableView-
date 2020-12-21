//
//  FactListTableViewControllerTests.swift
//  DynamicTableTests
//
//  Created by Ankita  on 17/12/20.
//  Copyright © 2020 Ankita . All rights reserved.
//

import XCTest
@testable import DynamicTable

class FactListTableViewControllerTests: XCTestCase {
    
    var controller: FactsListViewController!
    var navController : UINavigationController!
    
    override func setUpWithError() throws {
        controller = FactsListViewController()
        navController = UINavigationController()
        controller.loadViewIfNeeded()
        navController = UINavigationController(rootViewController: controller)
    }
    
    override func tearDownWithError() throws {
        controller = nil
        navController = nil
    }
    
    func testRootViewController() {
        
        let window = UIWindow()
        window.rootViewController = navController
        window.makeKeyAndVisible()
        XCTAssert(window.rootViewController is UINavigationController)
        XCTAssert(navController.topViewController is FactsListViewController)
    }
    
    func testTableIsSetUp(){
        XCTAssertNotNil(controller.factsTable)
    }
    
    func testLoadViewSetsTableDataSource(){
        XCTAssertTrue(controller.factsTable.dataSource is FactsListViewController)
        
    }
    
    func testTableHasOneSection() {
        let numberOfSections = controller.factsTable.numberOfSections
        
        XCTAssertEqual(1, numberOfSections)
    }
    
    func testTableViewCellHasReuseIdentifier() {
        let cell = controller.tableView(controller.factsTable, cellForRowAt: IndexPath(row: 0, section: 0)) as? FactsListTableViewCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = CellIdentifier.factViewCellIdentifier
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    
    func testTableCellHasCorrectData() {
        let testFact = Facts(title: "Transportation", description: "Bus", imageUrl: "http://1.bp.blogspot.com/_VZVOmYVm68Q/SMkzZzkGXKI/AAAAAAAAADQ/U89miaCkcyo/s400/the_golden_compass_still.jpg")
        controller.factsModel = FactModel(title: "About", facts: [testFact])
        
        let cell = controller.tableView(controller.factsTable, cellForRowAt: IndexPath(row: 0, section: 0)) as? FactsListTableViewCell
        cell?.facts = controller.factsModel.facts?[0]
        XCTAssertEqual(cell?.factView.titleText,"Transportation" )
        XCTAssertEqual(cell?.factView.descriptionText,"Bus" )
        
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
