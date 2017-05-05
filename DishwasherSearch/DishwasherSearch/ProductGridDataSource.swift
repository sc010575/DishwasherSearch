//
//  ProductGridDataSource.swift
//  DishwasherSearch
//
//  Created by Suman Chatterjee on 05/05/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import UIKit

class ProductGridDataSource: NSObject {
    fileprivate let products: [Product]
    
    init(products: [Product]) {
        self.products = products
        super.init()
    }
    
    func internalCollectionView(_ collectionView: UICollectionView, cellForItemAtIndexPath indexPath: IndexPath) -> ProductGridCollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductGridCollectionViewCell.reuseId, for: indexPath)
            as? ProductGridCollectionViewCell else {
                
                preconditionFailure("Collection view configured with wrong type of cell")
        }
        
        return cell
    }
    
    internal func product(forIndexPath indexPath: IndexPath) -> Product? {
        
        // in theory impossible, but being defensive
        guard (indexPath as NSIndexPath).row < self.products.count else {
            return nil
        }
        return self.products[(indexPath as NSIndexPath).row]
    }
}

extension ProductGridDataSource: UICollectionViewDataSource {
    
    @objc func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.products.count
    }
    
    @objc func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = internalCollectionView(collectionView, cellForItemAtIndexPath: indexPath)
        
        if let product = product(forIndexPath: indexPath) {
            
            cell.configure(withProduct: product)
            cell.configureLookAndFeel()
        }
        
        return cell
    }
}
