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
