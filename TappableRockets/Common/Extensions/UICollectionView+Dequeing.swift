//
//  UICollectionView+Dequeing.swift
//  TappableRockets
//
//  Created by Ricardo Deus on 19/02/2021.
//

import UIKit

public extension UICollectionView {
    func dequeue<T: UICollectionViewCell>(cellForItemAt indexPath: IndexPath) -> T {
        let reuseIdentifier = "\(T.self)"
        register(T.self, forCellWithReuseIdentifier: reuseIdentifier)
        let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! T
        return cell
    }
}
