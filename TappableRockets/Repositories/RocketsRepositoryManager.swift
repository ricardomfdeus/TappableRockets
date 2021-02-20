//
//  RocketsRepositoryManager.swift
//  TappableRockets
//
//  Created by Ricardo Deus on 20/02/2021.
//

import Foundation
import CoreData

class RocketsRepositoryManager {
    
    enum FetchType {
        case cache
        case updateCache
    }
    
    func fetchRockets(_ fetchType: FetchType, completion: @escaping (Result<[RocketItem], Error>) -> Void) {
        switch fetchType {
        case .cache:
            do {
                completion(.success(try RocketsStorageRepository.fetchRockets()))
            } catch {
                completion(.failure(error))
            }
        case .updateCache:
            RocketsRemoteRepository.fetchRockets { (result) in
                switch result {
                case .success(let rockets):
                    do {
                        let rocketItems = rockets.asRocketItems()
                        
                        try RocketsStorageRepository.saveInCoreDataWith(rocketItems: rocketItems)
                        
                        completion(.success(rocketItems))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
