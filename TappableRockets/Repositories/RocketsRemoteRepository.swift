//
//  RocketsRemoteRepository.swift
//  TappableRockets
//
//  Created by Ricardo Deus on 19/02/2021.
//

import Foundation
import Alamofire

public enum RocketsErrors: Error {
    case unknown
    case invalidId
}

public final class RocketsRemoteRepository {
    private static let rocketsUrlString = "https://api.spacexdata.com/v4/rockets"
      
    public static func fetchRockets(completion: @escaping (Result<Rockets, Error>) -> Void) {
        AF.request(rocketsUrlString).responseData { (jsonData) in
            guard let data = jsonData.data else {
                completion(.failure(RocketsErrors.unknown))
                return
            }
            
            if let error = jsonData.error {
                completion(.failure(error))
                return
            }
            
            do {
                let rockets = try newJSONDecoder().decode(Rockets.self, from: data)
                completion(.success(rockets))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - Helper function for creating encoder
    
    private static func newJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        if #available(iOS 10.0, *) {
            decoder.dateDecodingStrategy = .iso8601
        }
        return decoder
    }
}
