//
//  DynamicTableTests.swift
//  DynamicTableTests
//
//  Created by Ankita  on 16/12/20.
//  Copyright © 2020 Ankita . All rights reserved.
//

import XCTest
@testable import DynamicTable

class DynamicTableTests: XCTestCase {

    var apiClient: ApiClient!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        apiClient = ApiClient()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        apiClient = nil
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testFetchDataResponse(){
        apiClient.fetchData(url: ApiEndPoints.factApiUrl) { (response : Result<FactModel,NetworkError>) in
             switch response {
             case .success(let users):
                XCTAssertEqual(users.facts?.count, 14)
                
             case .failure(let error):
                XCTFail(error.reason)
             }
        }

    }
    
    

}
