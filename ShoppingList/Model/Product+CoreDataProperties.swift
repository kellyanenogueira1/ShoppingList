//
//  Product+CoreDataProperties.swift
//  ShoppingList
//
//  Created by Kellyane Nogueira on 17/10/20.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }
    
    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var price: Float
    @NSManaged public var quantity: Int16
    

}

extension Product : Identifiable {

}
