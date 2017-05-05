//
//  DownloadManager.swift
//  DishwasherSearch
//
//  Created by Suman Chatterjee on 23/02/2017.
//  Copyright © 2017 Suman Chatterjee. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher


class DownloadManager: NSObject {
    
    public typealias DownloadCompletionHandler = (_ response: [String: Any]?, _ cancelled: Bool) -> Void
    
    
    static func downloadData(for productURL:String,completionhandler:@escaping DownloadCompletionHandler)  {
        
        let endpoint: String = productURL
        
        guard let url = URL(string: endpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        
        let task = session.dataTask(with: urlRequest, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                completionhandler(nil,false)
                
                
            } else {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        
                        completionhandler(json,true)
                    }
                    
                } catch {
                    
                    print("error in JSONSerialization")
                    
                }
                
                
            }
            
        })
        task.resume()
    }
    
}

extension DownloadManager {
    
    class func loadImage(for url:URL, cacheKey : String , inView imageView:ImageView) {
        
        let resource = ImageResource(downloadURL: url, cacheKey: cacheKey)
        imageView.kf.setImage(with: resource)
    }
}
