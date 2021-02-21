//
//  RocketsListView.swift
//  TappableRockets
//
//  Created Ricardo Deus on 19/02/2021.
//

import UIKit
import SwiftUI

class RocketsViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private lazy var refreshControl: UIRefreshControl = {
        let rc = UIRefreshControl()
        
        updaterRefreshControlTint(refreshControl: rc)
        
        rc.attributedTitle = NSAttributedString(string: "Pull to refresh the rockets",
                                                attributes: [.foregroundColor : UIColor.lightGray,
                                                             .font : UIFont.systemFont(ofSize: 14)])
        rc.addTarget(self, action: #selector(didPullToRefresh(_:)), for: .valueChanged)
        return rc
    }()
    
    private lazy var collectionViewDataSource: RocketsCollectionViewDataSource = {
        let ds = RocketsCollectionViewDataSource()
        ds.delegate = self
        return ds
    }()
    
    lazy var viewModel: RocketsViewModel = {
        let vm = RocketsViewModel()
        vm.view = self
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        viewModel.fetchRocketData(update: false)
    }
    
    private func setupCollectionView() {
        collectionView.refreshControl = refreshControl
        collectionView.delegate = collectionViewDataSource
        collectionView.dataSource = collectionViewDataSource
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    @objc
    private func didPullToRefresh(_ sender: Any) {
        viewModel.fetchRocketData(update: true)
    }
    
    private func updaterRefreshControlTint(refreshControl: UIRefreshControl) {
        if traitCollection.userInterfaceStyle == .dark {
            refreshControl.tintColor = .white
        } else {
            refreshControl.tintColor = .lightGray
        }
    }
}

//MARK: RocketsViewProtocol

extension RocketsViewController: RocketsViewProtocol {
    func viewWillUpdateRockets() {
        collectionViewDataSource.rockets = viewModel.rockets
        activityIndicator.stopAnimating()
        refreshControl.endRefreshing()
        collectionView.reloadData()
    }
    
    func viewDidFailToFetchData(with error: Error) {
        activityIndicator.stopAnimating()
        //TODO: Show alert
    }
}

//MARK: RocketsCollectionViewDataSourceDelegate

extension RocketsViewController: RocketsCollectionViewDataSourceDelegate {
    func didSelectItem(rocket: RocketItem) {
        let vc = UIHostingController(rootView: RocketDetail(rocket: rocket))
        present(vc, animated: true, completion: nil)
    }
}

//MARK: Trait collection

extension RocketsViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updaterRefreshControlTint(refreshControl: refreshControl)
    }
}

//MARK: Orientation

extension RocketsViewController {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.reloadData() //recalculate the cell sizes
    }
}
