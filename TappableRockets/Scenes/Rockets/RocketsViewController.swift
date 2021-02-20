//
//  RocketsListView.swift
//  TappableRockets
//
//  Created Ricardo Deus on 19/02/2021.
//

import UIKit

class RocketsViewController: UIViewController {
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
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}

//MARK: RocketsViewProtocol

extension RocketsViewController: RocketsViewProtocol {
    func viewWillUpdateRockets() {
        collectionViewDataSource.rockets = viewModel.rockets
        activityIndicator.stopAnimating()
        collectionView.reloadSections(IndexSet(integer: 0)) //using this so that the reload is animated
    }
    
    func viewDidFailToFetchData(with error: Error) {
        activityIndicator.stopAnimating()
        //TODO: Show alert
    }
}
