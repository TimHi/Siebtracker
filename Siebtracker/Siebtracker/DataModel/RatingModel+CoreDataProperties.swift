//
//  RatingModel+CoreDataProperties.swift
//  Siebtracker
//
//  Created by Tim Hiller on 28.02.22.
//
//

import Foundation
import CoreData


extension RatingModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RatingModel> {
        return NSFetchRequest<RatingModel>(entityName: "RatingModel")
    }

    @NSManaged public var bitterness: Int16
    @NSManaged public var sourness: Int16
    @NSManaged public var taste: Int16

}

extension RatingModel : Identifiable {

}
