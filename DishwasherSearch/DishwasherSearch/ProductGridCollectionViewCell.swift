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
    
    func configure(withProduct product: Product) {
        self.titleLabel.text = product.title
        self.priceLabel.text = product.price.asPriceString()
        DownloadManager.loadImage(for: product.image, cacheKey: product.title, inView: self.imageView)

    }
    
    func configureLookAndFeel() {
        self.layer.borderColor = UIColor(red: 0.867, green: 0.851, blue: 0.820, alpha: 1.00).cgColor
        self.layer.borderWidth = 0.5
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.titleLabel.text = ""
        self.priceLabel.text = ""
        self.imageView.image = nil
    }

}
