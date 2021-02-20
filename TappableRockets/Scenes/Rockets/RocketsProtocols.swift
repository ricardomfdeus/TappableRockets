//
//  RocketsProtocols.swift
//  TappableRockets
//
//  Created by Ricardo Deus on 20/02/2021.
//

protocol RocketsViewProtocol {
    func viewWillUpdateRockets()
    func viewDidFailToFetchData(with error: Error)
}

protocol RocketsListViewModelProtocol {
    func fetchData()
}

