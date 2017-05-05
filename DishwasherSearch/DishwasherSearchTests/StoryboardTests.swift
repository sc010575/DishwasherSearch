//
//  StoryboardTests.swift
//  DishwasherSearch
//
//  Created by Suman Chatterjee on 23/02/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import XCTest

class StoryboardTests: XCTestCase {
    
    var storyboard: UIStoryboard!

    
    override func setUp() {
        super.setUp()

        self.storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBasicStoryboardConfiguration() {
        guard let navigationController = self.storyboard.instantiateInitialViewController() as? UINavigationController else {
            XCTFail("Did not find a navigation controller as the root view controller in storyboard")
            return
        }
        
        guard let collectionVC = navigationController.topViewController as? ProductGridViewController else {
            XCTFail("Did not find an instance of ProductGridCollectionViewController as the navigationController's topViewController")
            return
        }
        
        XCTAssertEqual(collectionVC.navigationItem.title, "Dishwashers Search")
    }
    
}
