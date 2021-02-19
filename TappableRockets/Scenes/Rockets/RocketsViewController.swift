//
//  RocketsListView.swift
//  TappableRockets
//
//  Created Ricardo Deus on 19/02/2021.
//

import UIKit

protocol RocketsViewProtocol {
    func viewWillUpdateRockets()
    func viewDidFailToFetchData(with error: Error)
}

class RocketsViewController: UIViewController {
    
    private enum Constants {
        static let itemsSpacing: CGFloat = 10
        static let itemsHeight: CGFloat = 250
        
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let collectionViewDataSource = RocketsCollectionViewDataSource()
    
    lazy var viewModel: RocketsViewModel = {
        let vm = RocketsViewModel()
        vm.view = self
        return vm
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        viewModel.fetchRocketData()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = collectionViewDataSource
        collectionView.dataSource = collectionViewDataSource
        
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            let spacing = Constants.itemsSpacing
            
            layout.minimumLineSpacing = spacing
            layout.minimumInteritemSpacing = spacing
            layout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
            
            // multiplying by 3 to add left, right, and middle spacings
            let size = CGSize(width: (collectionView.bounds.width - spacing*3) / 2,
                              height: Constants.itemsHeight)
            layout.itemSize = size
        }
    }
    
    private func stopActivity() {
        UIView.animate(withDuration: 0.25, animations: {
            self.activityIndicator.alpha = 0
        }, completion: { _ in
            self.showCollectionView()
            self.activityIndicator.removeFromSuperview()
        })
    }
    
    private func showCollectionView() {
        UIView.animate(withDuration: 0.25, animations: {
            self.collectionView.alpha = 1
        }, completion: nil)
    }
}

//MARK: RocketsViewProtocol

extension RocketsViewController: RocketsViewProtocol {
    func viewWillUpdateRockets() {
        collectionViewDataSource.rockets = viewModel.rockets
        stopActivity()
        collectionView.reloadSections(IndexSet(integer: 0)) //using this so that the reload is animated
    }
    
    func viewDidFailToFetchData(with error: Error) {
        stopActivity()
        //TODO: Show alert
    }
}
