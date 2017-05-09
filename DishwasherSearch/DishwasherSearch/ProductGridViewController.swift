//
//  ProductGridViewController.swift
//  DishwasherSearch
//
//  Created by Suman Chatterjee on 23/02/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import UIKit

class ProductGridViewController: UICollectionViewController {
   
    fileprivate var datasource: ProductGridDataSource!
    override func viewDidLoad() {
        super.viewDidLoad()

        if currentReachabilityStatus == .notReachable {
            
            self.errorWithMessage(message: "No Network Connection")
            return
        }

        DownloadManager.downloadData(for: ProductGridURL, completionhandler: { (response,cancled) in
            
            guard let products = response else {
                return
            }
            self.configureDataSource(withProducts: products)
            self.collectionView?.reloadData()
            self.navigationItem.title = "Dishwashers (\(products.count))"
        })

        
    }
    
    fileprivate func configureDataSource(withProducts products: [Product]) {
        self.datasource = ProductGridDataSource(products: products)
        self.collectionView?.dataSource = self.datasource
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// MARK: - ProductGridViewController error handling functions

extension ProductGridViewController {
    
    func errorWithMessage(message: String) {
        
        let alert = UIAlertController(title: "Service Error", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
