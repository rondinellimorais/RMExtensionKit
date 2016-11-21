//
//  ImageDownload.swift
//  RMExtensionKit
//
//  Created by Rondinelli Morais on 08/04/16.
//  Copyright © 2016 Rondinelli Morais. All rights reserved.
//

import UIKit

open class ImageDownload: NSObject {
    
    // MARK: Properties
    open class var cacheDirectory:String {
        get {
            let path = NSString(string: NSHomeDirectory()).appendingPathComponent("/Library/Caches/Images")
            return path
        }
    }
    
    fileprivate var imageURL:URL?
    
    // MARK: Public methods
    public convenience init(URL imageURL:URL!) {
        self.init()
        if imageURL == nil {
            fatalError("URL cannot be nil!")
        }
        self.imageURL = imageURL
    }
    
    open func execute(_ block:((_ image:UIImage?, _ error:NSError?) -> Void)?) {
        
        // if exists set image
        if let image = self.imageAtURL() {
            
            if block != nil {
                block!(image, nil)
            }
            return
        }
        
        // if not exists, download
        let fileName = self.imageURL!.lastPathComponent
        let fullPathFile = NSString(string: self.imageURL!.path).deletingLastPathComponent
        let directory = NSString(string: ImageDownload.cacheDirectory).appendingPathComponent(fullPathFile)
        
        // create directory
        do
        {
            try FileManager.default.createDirectory(atPath: directory, withIntermediateDirectories:true, attributes: nil)
            
            DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default).async(execute: {
                
                let imageRequest = URLRequest(url: self.imageURL!,
                    cachePolicy: NSURLRequest.CachePolicy.useProtocolCachePolicy,
                    timeoutInterval: 30.0)
                
                DispatchQueue.main.async(execute: {

                    self.imageData(imageRequest, completionHandler: { (imgData, error) -> Void in
                        if error == nil {
                            try? imgData!.write(to: URL(fileURLWithPath: "\(directory)/\(fileName)"), options: [.atomic])
                            if block != nil {
                                block!(UIImage(data: imgData!), nil)
                            }
                        }
                        else {
                            if block != nil {
                                block!(nil, error)
                            }
                        }
                    })
                })
            })
            
        } catch {
            if block != nil {
                block!(nil, error as NSError)
            }
        }
    }
    
    // MARK: private methods
    fileprivate func imageAtURL() -> UIImage? {
        
        let fullPath = NSString(string: ImageDownload.cacheDirectory).appendingPathComponent(self.imageURL!.path)
        if FileManager.default.fileExists(atPath: fullPath) {
            return UIImage(contentsOfFile: fullPath)
        }
        return nil
    }
    
    fileprivate func imageData(_ imageRequest:URLRequest, completionHandler:((_ data:Data?, _ error:NSError?) -> Void)?) {
        
        if #available(iOS 9, *)
        {
            let task = URLSession.shared.dataTask(with: imageRequest, completionHandler: { (data, response, error) -> Void in
                DispatchQueue.main.async(execute: {
                    if completionHandler != nil {
                        completionHandler!(data, error as NSError?)
                    }
                })
            })
            task.resume()
        }
        else
        {
            // iOs 8.x
            do {
                let imageData = try NSURLConnection.sendSynchronousRequest(imageRequest, returning: nil)
                if completionHandler != nil {
                    completionHandler!(imageData, nil)
                }
            } catch {
                if completionHandler != nil {
                    completionHandler!(nil, error as NSError)
                }
            }
        }
    }
}
