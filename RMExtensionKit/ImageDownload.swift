//
//  ImageDownload.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 08/04/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

public class ImageDownload: NSObject {
    
    // MARK: Properties
    public class var cacheDirectory:String {
        get {
            let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)
            return "\(paths.first!)/Images"
        }
    }
    
    private var imageURL:NSURL?
    
    // MARK: Public methods
    public convenience init(URL imageURL:NSURL!) {
        self.init()
        if imageURL == nil {
            fatalError("URL cannot be nil!")
        }
        self.imageURL = imageURL
    }
    
    public func execute(block:((image:UIImage?, error:NSError?) -> Void)?) {
        
        // if exists set image
        if let image = self.imageAtURL() {
            
            if block != nil {
                block!(image:image, error: nil)
            }
            return
        }
        
        // if not exists, download
        let fileName = self.imageURL!.lastPathComponent!
        let fullPathFile = NSString(string: self.imageURL!.path!).stringByDeletingLastPathComponent
        let directory = NSString(string: ImageDownload.cacheDirectory).stringByAppendingPathComponent(fullPathFile)
        
        // create directory
        do
        {
            try NSFileManager.defaultManager().createDirectoryAtPath(directory, withIntermediateDirectories:true, attributes: nil)
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                
                let imageRequest = NSURLRequest(URL: self.imageURL!,
                    cachePolicy: NSURLRequestCachePolicy.UseProtocolCachePolicy,
                    timeoutInterval: 30.0)
                
                dispatch_async(dispatch_get_main_queue(), {

                    self.imageData(imageRequest, completionHandler: { (imgData, error) -> Void in
                        if error == nil {
                            imgData!.writeToFile("\(directory)/\(fileName)", atomically: true)
                            if block != nil {
                                block!(image:UIImage(data: imgData!), error: nil)
                            }
                        }
                        else {
                            if block != nil {
                                block!(image:nil, error:error)
                            }
                        }
                    })
                })
            })
            
        } catch {
            if block != nil {
                block!(image:nil, error:error as NSError)
            }
        }
    }
    
    // MARK: private methods
    private func imageAtURL() -> UIImage? {
        
        let fullPath = NSString(string: ImageDownload.cacheDirectory).stringByAppendingPathComponent(self.imageURL!.path!)
        if NSFileManager.defaultManager().fileExistsAtPath(fullPath) {
            return UIImage(contentsOfFile: fullPath)
        }
        return nil
    }
    
    private func imageData(imageRequest:NSURLRequest, completionHandler:((data:NSData?, error:NSError?) -> Void)?) {
        
        if #available(iOS 9, *)
        {
            let task = NSURLSession.sharedSession().dataTaskWithRequest(imageRequest, completionHandler: { (data, response, error) -> Void in
                dispatch_async(dispatch_get_main_queue(), {
                    if completionHandler != nil {
                        completionHandler!(data: data, error: error)
                    }
                })
            })
            task.resume()
        }
        else
        {
            // iOs 8.x
            do {
                let imageData = try NSURLConnection.sendSynchronousRequest(imageRequest, returningResponse: nil)
                if completionHandler != nil {
                    completionHandler!(data: imageData, error: nil)
                }
            } catch {
                if completionHandler != nil {
                    completionHandler!(data: nil, error: error as NSError)
                }
            }
        }
    }
}
