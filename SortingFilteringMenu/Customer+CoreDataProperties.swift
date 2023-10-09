//
//  Customer+CoreDataProperties.swift
//  SortingFilteringMenu
//
//  Created by Walter Bernal Montero on 08/10/23.
//
//

import Foundation
import CoreData


extension Customer {

    //    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
    //        return NSFetchRequest<Customer>(entityName: "Customer")
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


    @NSManaged public var email: String?
    @NSManaged public var fullName: String?
    @NSManaged public var toDessert: NSSet?

}

// MARK: Generated accessors for toDessert
extension Customer {

    @objc(addToDessertObject:)
    @NSManaged public func addToToDessert(_ value: Dessert)

    @objc(removeToDessertObject:)
    @NSManaged public func removeFromToDessert(_ value: Dessert)

    @objc(addToDessert:)
    @NSManaged public func addToToDessert(_ values: NSSet)

    @objc(removeToDessert:)
    @NSManaged public func removeFromToDessert(_ values: NSSet)

}

extension Customer : Identifiable {

}
