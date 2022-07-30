//
//  PersistentStorage.swift
//  Koyal
//
//  Created by Abhinay Pratap on 30/07/22.
//

import UIKit
import CoreData

final class PersistentStorage {
    private init() {}
    static var shared = PersistentStorage()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Koyal")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("\(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("\(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchManagedObject<T: NSManagedObject>(managedObject: T.Type) -> [T]? {
        do {
            guard let result = try PersistentStorage.shared.context.fetch(managedObject.fetchRequest()) as? [T] else {
                return nil
            }
            return result
        } catch {
            debugPrint(error)
        }
        return nil
    }
}
