//
//  ProductTests.swift
//  Dishwashers
//
//  Created by Suman Chatterjee on 23/02/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import XCTest
import SwiftyJSON

class ProductTests: JSONIntegrationTest {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParseSingleProduct() {
        let fixtureData = self.fixtureData(forResourceName: "single-product")
        let json = JSON(data: fixtureData)
        let product = try! ProductHandler.singleProduct(fromJSON: json)
        
        XCTAssertEqual(product.productID, 2915517)
        XCTAssertEqual(product.price, 599.00)
        XCTAssertEqual(product.title, "Whirlpool WFO3P33DLUK Freestanding Dishwasher, WhIte")
        XCTAssertEqual(product.image.absoluteString, "https://johnlewis.scene7.com/is/image/JohnLewis/236331171?")
    }
    
    func testParseProducts() {
        let fixtureData = self.fixtureData(forResourceName: "product-grid-response")
        let json = JSON(data: fixtureData as Data)
        let products = try! ProductHandler.products(fromJSON: json)
        
        XCTAssertEqual(products.count, 20)
        
        guard let product = products.last else {
            XCTFail("No last object in returned products array")
            return
        }
        
        XCTAssertEqual(product.productID, 2641341)
        XCTAssertEqual(product.price, 679.00)
        XCTAssertEqual(product.title, "Miele G4720 SC Slimline Freestanding Dishwasher, White")
        XCTAssertEqual(product.image.absoluteString, "https://johnlewis.scene7.com/is/image/JohnLewis/235997186?")
    }
}
