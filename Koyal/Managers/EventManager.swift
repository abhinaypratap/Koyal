//
//  EventManager.swift
//  Koyal
//
//  Created by Abhinay Pratap on 30/07/22.
//

import Foundation
import CoreData

struct EventManager {
    
    private let _eventDataRepository = EventDataRepository()
    
    func createEvent(event: Event) {
        _eventDataRepository.create(event: event)
    }
    
    func fetchEvent() -> [Event] {
        _eventDataRepository.getAll()
    }
    
    func fetchEvent(byIdentifier id: UUID) -> Event? {
        _eventDataRepository.get(byIdentifier: id)
    }
    
    func updateEvent(event: Event) -> Bool {
        _eventDataRepository.update(event: event)
    }
    
    func deleteEvent(byIdentifier id: UUID) -> Bool {
        _eventDataRepository.delete(byIdentifier: id)
    }
}

