//
//  ProductHandler.swift
//  DishwasherSearch
//
//  Created by Suman Chatterjee on 09/05/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import Foundation

import SwiftyJSON

enum JSONParsingError: Error {
    case invalidProductID
    case invalidPrice
    case invalidTitle
    case invalidImageURL
    case invalidProductsArray
}

class ProductHandler {
    
    static func singleProduct(fromJSON json: JSON) throws -> Product {
        
        guard let productIDStr = json["productId"].string,
            let productID = Int(productIDStr) else {
                throw JSONParsingError.invalidProductID
        }
        
        guard let priceStr = json["price"]["now"].string,
            let price = Float(priceStr) else {
                throw JSONParsingError.invalidPrice
        }
        
        guard let title = json["title"].string else {
            throw JSONParsingError.invalidTitle
        }
        
        guard let imageURLStr = json["image"].string,
            let imageURL = URL(string: "https:\(imageURLStr)") else {
                throw JSONParsingError.invalidImageURL
        }
        
        return Product(productID: productID,
                       price: price,
                       title: title,
                       image: imageURL)
    }
    
    static func products(fromJSON json: JSON) throws -> [Product] {
        
        guard let jsonProducts = json["products"].array else {
            throw JSONParsingError.invalidProductsArray
        }
        
        var products = [Product]()
        
        jsonProducts.forEach { (productJSON) in
            
            do {
                try products.append(singleProduct(fromJSON: productJSON))
            } catch let error {
                /* For purposes of this exercise, simply print an error and omit problematic products from results.
                 * In a real app, this should be reported back via an endpoint or via analytics. */
                print("Product parse error at index \(jsonProducts.index(of: productJSON)): \(error)")
            }
        }
        
        return products
    }
}
