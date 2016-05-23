//
//  ImageHelper.swift
//  Pokemon
//
//  Created by Johnny on 5/21/16.
//  Copyright © 2016 PosUp. All rights reserved.
//

import Foundation
import UIKit

class ImageHelper {

    static func loadImageFromUrl(url: String, view: UIImageView, completion: (image:UIImage) -> ()){
        
        // Create Url from string
        let url = NSURL(string: url.stringByReplacingOccurrencesOfString("http://", withString: "https://"))!
        
        // Download task:
        // - sharedSession = global NSURLCache, NSHTTPCookieStorage and NSURLCredentialStorage objects.
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (responseData, responseUrl, error) -> Void in
            // if responseData is not null...
            if let data = responseData{
                
                // execute in UI thread
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    view.image = UIImage(data: data)
                    completion(image: view.image!)
                })
            }
        }
        
        // Run task
        task.resume()
    }
    
}