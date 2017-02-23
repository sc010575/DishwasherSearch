//
//  ProductGridCollectionViewCell.swift
//  DishwasherSearch
//
//  Created by Suman Chatterjee on 23/02/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import UIKit

class ProductGridCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "ProductGridCollectionViewCellReuseId"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
}
