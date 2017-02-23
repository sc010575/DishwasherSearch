//
//  DishwasherSearchDownloadManagerTests.swift
//  DishwasherSearchTests
//
//  Created by Suman Chatterjee on 23/02/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import XCTest
@testable import DishwasherSearch

class DishwasherSearchDownloadManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDownloadManager() {
        
        let searchExpectiation = expectation(description: "Dishwasher Search")
        
        DownloadManager.downloadData(for:ProductGridURL,completionhandler: { (response,cancled) in
            
            XCTAssertNotNil(response, "data should not be nil")
            
            guard let resultResponses = response else {
                return
            }
            
            print("Response \(resultResponses)")
            searchExpectiation.fulfill()
        })
        
        waitForExpectations(timeout: 10) { (error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testPerformanceDownloadManager() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            self.testDownloadManager()
        }
    }
    
}
