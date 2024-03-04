import Foundation
import CoreData

protocol EventRepository {
    func create(event: Event)
    func getAll() -> [Event]
    func get(byIdentifier id: UUID) -> Event?
    func update(event: Event) -> Bool
    func delete(byIdentifier id: UUID) -> Bool
}

struct EventDataRepository: EventRepository {
    func create(event: Event) {
        let cdEvent = CDEvent(context: PersistentStorage.shared.context)
        cdEvent.id = event.id
        cdEvent.content = event.content
        cdEvent.category = event.category
        cdEvent.time = event.time
        PersistentStorage.shared.saveContext()
    }

    func getAll() -> [Event] {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDEvent.self)
        var events = [Event]()
        result?.forEach({ cdEvent in
            events.append(cdEvent.convertToEvent())
        })
        return events
    }

    func get(byIdentifier id: UUID) -> Event? {
        let result = getCDEvent(byIdentifier: id)
        return result?.convertToEvent()
    }

    func update(event: Event) -> Bool {
        let cdEvent = getCDEvent(byIdentifier: event.id)
        guard cdEvent != nil else { return false }
        cdEvent?.content = event.content
        cdEvent?.category = event.category
        cdEvent?.time = event.time
        PersistentStorage.shared.saveContext()
        return true
    }

    func delete(byIdentifier id: UUID) -> Bool {
        let cdEvent = getCDEvent(byIdentifier: id)
        guard cdEvent != nil else { return false }
        PersistentStorage.shared.context.delete(cdEvent!)
        PersistentStorage.shared.saveContext()
        return true
    }

    func getCDEvent(byIdentifier id: UUID) -> CDEvent? {
        let fetchRequest = NSFetchRequest<CDEvent>(entityName: "CDEvent")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = predicate

        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            guard result != nil else { return nil }
            return result
        } catch {
            debugPrint(error)
        }
        return nil
    }
}
