//
//  UIImageView+Cache.swift
//  TappableRockets
//
//  Created by Ricardo Deus on 20/02/2021.
//

import UIKit

fileprivate let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadImage(urlString: String) {
        image = nil
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            image = cachedImage
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else { return }
            
            if let image = UIImage(data: data) {
                imageCache.setObject(image, forKey: NSString(string: urlString))
                
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
        
        task.resume()
    }
}

