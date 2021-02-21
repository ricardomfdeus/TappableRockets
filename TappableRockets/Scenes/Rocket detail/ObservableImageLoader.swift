//
//  ObservableImageLoader.swift
//  TappableRockets
//
//  Created by Ricardo Deus on 21/02/2021.
//

import Foundation
import Combine
import UIKit

class ObservableImageLoader: ObservableObject {
    var didChange = PassthroughSubject<UIImage, Never>()
    
    var image = UIImage() {
        didSet {
            didChange.send(image)
        }
    }
    
    init(urlString: String) {
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            DispatchQueue.main.async {
                self.image = cachedImage
            }
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
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
