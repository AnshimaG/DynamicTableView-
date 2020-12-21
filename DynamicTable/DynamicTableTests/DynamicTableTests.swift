//
//  DynamicTableTests.swift
//  DynamicTableTests
//
//  Created by Ankita  on 17/12/20.
//  Copyright © 2020 Ankita . All rights reserved.
//

import XCTest
@testable import DynamicTable

class DynamicTableTests: XCTestCase {
    
    var apiClient: ApiClient!
    override func setUpWithError() throws {
        apiClient = ApiClient()
    }

    override func tearDownWithError() throws {
        apiClient = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
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
