//
//  Event+CoreDataProperties.swift
//  Koyal
//
//  Created by Abhinay Pratap on 30/07/22.
//
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var time: Date?
    @NSManaged public var content: String?
    @NSManaged public var category: String?

}

extension Event : Identifiable {

}
