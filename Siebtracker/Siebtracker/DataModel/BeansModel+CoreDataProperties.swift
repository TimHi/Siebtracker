//
//  BeansModel+CoreDataProperties.swift
//  Siebtracker
//
//  Created by Tim Hiller on 28.02.22.
//
//

import Foundation
import CoreData


extension BeansModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BeansModel> {
        return NSFetchRequest<BeansModel>(entityName: "BeansModel")
    }

    @NSManaged public var id: UUID
    @NSManaged public var image: URL?
    @NSManaged public var name: String?
    @NSManaged public var producer: String?

}

extension BeansModel : Identifiable {

}
