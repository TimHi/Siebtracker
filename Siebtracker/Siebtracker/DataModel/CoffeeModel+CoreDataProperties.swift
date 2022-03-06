//
//  CoffeeModel+CoreDataProperties.swift
//  Siebtracker
//
//  Created by Tim Hiller on 28.02.22.
//
//

import Foundation
import CoreData


extension CoffeeModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoffeeModel> {
        return NSFetchRequest<CoffeeModel>(entityName: "CoffeeModel")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var beansID: UUID
    @NSManaged public var ratingID: UUID
    @NSManaged public var settingsID: UUID

}

extension CoffeeModel : Identifiable {

}
