//
//  RocketsListView.swift
//  TappableRockets
//
//  Created Ricardo Deus on 19/02/2021.
//

import UIKit

protocol RocketsViewProtocol {
    func viewWillPresent(data: Rockets)
    func viewDidFailToFetchData(with error: Error)
}

class RocketsViewController: UIViewController, RocketsViewProtocol {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var viewModel: RocketsViewModel = {
        let vm = RocketsViewModel()
        vm.view = self
        return vm
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchRocketData()
    }
    
    private func setupCollectionView() {
        
    }
    
    func viewWillPresent(data: Rockets) {
        print(data)
    }
    
    func viewDidFailToFetchData(with error: Error) {
        print(error.localizedDescription)
    }
}
