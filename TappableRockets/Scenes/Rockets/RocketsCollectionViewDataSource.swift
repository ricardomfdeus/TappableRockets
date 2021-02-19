//
//  RocketsCollectionViewDataSource.swift
//  TappableRockets
//
//  Created by Ricardo Deus on 19/02/2021.
//

import UIKit

final class RocketsCollectionViewDataSource: NSObject {
    var rockets: Rockets?
}

//MARK: UICollectionViewDelegate

extension RocketsCollectionViewDataSource: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let rocket = rockets?[indexPath.item] else { return }
        print(rocket)
        //TODO:
    }
}

//MARK: UICollectionViewDataSource

extension RocketsCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0 //rockets.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //TODO: build cell
        let cell: UICollectionViewCell = collectionView.dequeue(cellForItemAt: indexPath)
        return cell
    }
}
