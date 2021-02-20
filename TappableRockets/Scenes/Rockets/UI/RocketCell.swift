//
//  RocketCell.swift
//  TappableRockets
//
//  Created by Ricardo Deus on 19/02/2021.
//

import UIKit

class RocketCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var rocketName: UILabel!
    @IBOutlet weak var successRateBadge: UIView!
    @IBOutlet weak var successRate: UILabel!
    @IBOutlet weak var firstLaunched: UILabel!
    
    var item: RocketItem? {
        didSet {
            if let item = item {
                bindItem(item)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.roundCorners(10)
        rocketImage.roundCorners(8)
        successRateBadge.setRounded()
    }
    
    private func bindItem(_ item: RocketItem) {
        if let urlString = item.imageUrl {
            rocketImage.loadImage(urlString: urlString)
        }
        
        rocketName.text = item.name
        successRateBadge.backgroundColor = item.badgeColor
        successRate.text = item.successRate != nil ? "\(item.successRate!)%" : nil
        firstLaunched.text = item.firstFlight?.dateString()
    }
}
