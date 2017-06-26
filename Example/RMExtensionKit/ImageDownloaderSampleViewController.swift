//
//  ImageDownloaderSampleViewController.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 13/03/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import RMExtensionKit

class ImageDownloaderSampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // image URL
        let imageURL = URL(string: "https://www.planwallpaper.com/static/images/b807c2282ab0a491bd5c5c1051c6d312_rP0kQjJ.jpg")
        
        // create image donwload instance
        let imageDownloder = ImageDownload(URL: imageURL!)
        
        // download image with block
        // download is saved automatically on ImageDownload.cacheDirectory
        imageDownloder.execute { (image:UIImage?, error:NSError?) in
            
            // When you create another instance for same image URL
            // the image cached will be returned on image object
            
            if error == nil {
                // UIImageView(image:image)
            }
        }
    }
}
