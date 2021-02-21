//
//  RocketsStorageRepository.swift
//  TappableRockets
//
//  Created by Ricardo Deus on 19/02/2021.
//

import CoreData

public final class RocketsStorageRepository {
    
    private static var fetchedhResultController: NSFetchedResultsController<NSFetchRequestResult> = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: RocketEntity.self))
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest,
                                             managedObjectContext: CoreDataStack.sharedInstance.persistentContainer.viewContext,
                                             sectionNameKeyPath: nil,
                                             cacheName: nil)
        // frc.delegate = self
        return frc
    }()
    
    public static func fetchRockets() throws -> [RocketItem] {
        do {
            try self.fetchedhResultController.performFetch()
            
            if let rocketEntities = self.fetchedhResultController.sections?[0].objects as? [RocketEntity] {
                return rocketEntities.asRocketItems()
            } else {
                throw RocketsErrors.unknown
            }
        } catch {
            throw error
        }
    }
    
    public static func saveInCoreDataWith(rocketItems: [RocketItem]) throws {
        _ = rocketItems.map { $0.asRocketEntity() }
        
        do {
            try CoreDataStack.sharedInstance.persistentContainer.viewContext.save()
        } catch let error {
            throw error
        }
    }
    
}

internal extension RocketItem {
    func asRocketEntity() -> NSManagedObject? {
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        
        if let rocketEntity = NSEntityDescription.insertNewObject(forEntityName: "RocketEntity",
                                                                  into: context) as? RocketEntity {
            rocketEntity.id = id
            rocketEntity.imageUrls = imageUrls
            rocketEntity.name = name
            rocketEntity.successRate = Int32(successRate ?? 0)
            rocketEntity.country = country
            rocketEntity.firstFlight = firstFlight
            rocketEntity.active = active
            rocketEntity.rocketDescription = rocketDescription
            rocketEntity.costPerLaunch = costPerLaunch
            rocketEntity.wikipedia = wikipedia
            return rocketEntity
        }
        
        return nil
    }
}
