//
//  RocketsListViewModel.swift
//  TappableRockets
//
//  Created Ricardo Deus on 19/02/2021.
//

import Foundation
import Alamofire

protocol RocketsListViewModelProtocol {
    func fetchData()
}

class RocketsViewModel {
    
    var rockets: Rockets? {
        didSet {
            view.viewWillUpdateRockets()
        }
    }
    
    var view: RocketsViewProtocol!
    
    func fetchRocketData() {
        RocketsRemoteRepository.fetchRockets { [weak self] (result) in
            switch result {
            case .success(let rockets):
                self?.rockets = rockets
            case .failure(let error):
                self?.view.viewDidFailToFetchData(with: error)
            }
        }
    }
}
