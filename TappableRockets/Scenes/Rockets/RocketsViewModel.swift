//
//  RocketsListViewModel.swift
//  TappableRockets
//
//  Created Ricardo Deus on 19/02/2021.
//

import Foundation
import Alamofire

class RocketsViewModel {
    
    private let repositoryManager = RocketsRepositoryManager()
    
    var rockets: [RocketItem]? {
        didSet {
            view.viewWillUpdateRockets()
        }
    }
    
    var view: RocketsViewProtocol!
    
    func fetchRocketData() {
        repositoryManager.fetchRockets(.cache) { [weak self] (result) in
            switch result {
            case .success(let rockets):
                self?.rockets = rockets
            case .failure(let error):
                self?.view.viewDidFailToFetchData(with: error)
            }
        }
    }
}
