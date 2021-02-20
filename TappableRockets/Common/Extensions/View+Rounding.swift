//
//  View+Rounding.swift
//  TappableRockets
//
//  Created by Ricardo Deus on 20/02/2021.
//

import UIKit

public extension UIView {
    func setRounded() {
        roundCorners(min(layer.bounds.width, layer.bounds.height) / 2)
    }
    
    func roundCorners(_ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}
