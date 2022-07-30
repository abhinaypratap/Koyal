//
//  CDEvent+CoreDataProperties.swift
//  Koyal
//
//  Created by Abhinay Pratap on 30/07/22.
//
//

import Foundation
import CoreData


extension CDEvent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEvent> {
        return NSFetchRequest<CDEvent>(entityName: "CDEvent")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var time: Date?
    @NSManaged public var content: String?
    @NSManaged public var category: String?

}

extension CDEvent : Identifiable {

}

extension CDEvent {
    func convertToEvent() -> Event {
        Event(id: self.id!, content: self.content, time: self.time, category: self.category)
    }
}
