//
//  Dessert+CoreDataProperties.swift
//  SortingFilteringMenu
//
//  Created by Walter Bernal Montero on 09/10/23.
//
//

import Foundation
import CoreData


extension Dessert {

    //    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
    //        return NSFetchRequest<Dish>(entityName: "Dish")
    //    }
        private static func request() -> NSFetchRequest<NSFetchRequestResult> {
            let request: NSFetchRequest<NSFetchRequestResult> =
                NSFetchRequest(entityName: String(describing: Self.self))
            /// Creates the request to remove duplicates from the results.
            request.returnsDistinctResults = true
            /// Forces the result to be faults (small objectsfetvched into memory only as needed).
            /// Faulting mechanism is designed to enhance performance and reduce memory use.
            request.returnsObjectsAsFaults = true
            return request
        }

    @NSManaged public var name: String?
    @NSManaged public var price: Float
    @NSManaged public var size: String?
    @NSManaged public var fromCustomer: NSSet?

    // Function to retrieve all desserts consumed by "John Doe"
    static func consumedByJohnDoe(_ context: NSManagedObjectContext) -> [Dessert]? {
        guard let customer = Customer.with(fullName: "John Doe", context)
        else { return nil }
        
        let request = Dessert.request()
        
        let predicate = NSPredicate(format: "(Any fromCustomer == %@", customer)
        request.predicate = predicate
        
        do {
            guard let results = try context.fetch(request) as? [Dessert], results.count > 0
            else { return nil }
            return results
        } catch (let error) {
            print(error.localizedDescription)
            return nil
        }
    }
}

// MARK: Generated accessors for fromCustomer
extension Dessert {

    @objc(addFromCustomerObject:)
    @NSManaged public func addToFromCustomer(_ value: Customer)

    @objc(removeFromCustomerObject:)
    @NSManaged public func removeFromFromCustomer(_ value: Customer)

    @objc(addFromCustomer:)
    @NSManaged public func addToFromCustomer(_ values: NSSet)

    @objc(removeFromCustomer:)
    @NSManaged public func removeFromFromCustomer(_ values: NSSet)

}

extension Dessert : Identifiable {

}
