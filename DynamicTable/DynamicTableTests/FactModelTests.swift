//
//  FactModelTests.swift
//  DynamicTableTests
//
//  Created by Ankita  on 21/12/20.
//  Copyright © 2020 Ankita . All rights reserved.
//

import XCTest
@testable import DynamicTable

//struct TestFactData {
//
//    static var testFact: FactModel = {
//        let url = Bundle.main.url(forResource: "TestFactData", withExtension: "json")!
//        let data = try! Data(contentsOf: url)
//        let decoder = JSONDecoder()
//        var testFacts = try! decoder.decode(FactModel.self, from: data)
//        return testFacts
//    }()
//}


class FactModelTests: XCTestCase {
    
   // var testModel: FactModel!
    
    override func setUpWithError() throws {
        //testModel = FactModel(
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
       // testModel = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    
    func testDecodingStandardType() {
        
        let json = """
        {
         "title":"About Canada",
         "rows":[
             {
             "title":"Housing",
             "description":"Wooden",
             "imageHref":"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"
             }
          ]
        }
        """.data(using: .utf8)!
        
        //let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        let testData = try? decoder.decode(FactModel.self, from: json)
        XCTAssertEqual(testData?.heading,"About Canada")
        XCTAssertEqual(testData?.facts?[0].title,"Housing")
        XCTAssertEqual(testData?.facts?[0].description,"Wooden")
        XCTAssertEqual(testData?.facts?[0].imageUrl,"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg")

    }
    
    func testDecodingMissingAttribute() {
        
        let json = """
        {
         "title":"About Canada"
        }
        """.data(using: .utf8)!        
        let decoder = JSONDecoder()
        let testData  = try? decoder.decode(FactModel.self, from: json)
        XCTAssertNil(testData?.facts)
    }

    func testDecodableWithEmptyArray() throws {
        // Given
        let json = Data("""
          {
           "title":"Canada",
           "rows":[]
          }
        """.utf8)
        let corruptFactData: FactModel
        do {
            corruptFactData = try JSONDecoder().decode(FactModel.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        XCTAssertNotNil(corruptFactData.heading)
        XCTAssertNotNil(corruptFactData.facts)
        
        let testFact = corruptFactData
        let navtitle = try XCTUnwrap(testFact.heading)
        XCTAssertEqual(navtitle, "Canada")
        XCTAssertEqual(testFact.facts?.count, 0)
    }
    
    func testDecodingWithNilvalues() {
        
        let json = """
        {
         "title":"About Canada",
         "rows":[
             {
             "title":nil
             "description":nil,
             "imageHref":nil
             }
          ]
        }
        """.data(using: .utf8)!
        
        //let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        let testData = try? decoder.decode(FactModel.self, from: json)
        XCTAssertNil(testData?.facts?[0].title)
        XCTAssertNil(testData?.facts?[0].description)
        XCTAssertNil(testData?.facts?[0].imageUrl)
    }

}
