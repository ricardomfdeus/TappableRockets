//
//  RocketsCollectionViewDataSource.swift
//  TappableRockets
//
//  Created by Ricardo Deus on 19/02/2021.
//

import UIKit

final class RocketsCollectionViewDataSource: NSObject {
    
    private enum Constants {
        static let padding: CGFloat = 24
        static let itemsHeight: CGFloat = 250
        static let maxWidth: CGFloat = 200
    }
    
    var rockets: [RocketItem]?
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
        rockets?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RocketCell = collectionView.dequeue(cellForItemAt: indexPath)
        cell.item = rockets?[indexPath.item]
        return cell
    }
}

//MARK: UICollectionViewDelegateFlowLayout

extension RocketsCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width - Constants.padding
        var cellWidth = width/2
        
        if cellWidth > Constants.maxWidth {
            let fittingInWidth = (width/Constants.maxWidth).rounded(.down)
            cellWidth = width/fittingInWidth
        }
        
        return CGSize(width: cellWidth, height: Constants.itemsHeight)
    }
}
