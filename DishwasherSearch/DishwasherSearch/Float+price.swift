//
//  Float+price.swift
//  DishwasherSearch
//
//  Created by Suman Chatterjee on 05/05/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import Foundation
extension Float {
    func asPriceString() -> String {
        return String(format: "£%.2f", self)
    }
}
