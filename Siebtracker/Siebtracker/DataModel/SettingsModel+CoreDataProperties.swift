//
//  SettingsModel+CoreDataProperties.swift
//  Siebtracker
//
//  Created by Tim Hiller on 28.02.22.
//
//

import Foundation
import CoreData


extension SettingsModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SettingsModel> {
        return NSFetchRequest<SettingsModel>(entityName: "SettingsModel")
    }

    @NSManaged public var id: UUID
    @NSManaged public var coarseGrindFineness: Int16
    @NSManaged public var coarseGrindWeight: Int16
    @NSManaged public var espressoRatio: Int16
    @NSManaged public var extractedWeight: Int16
    @NSManaged public var extractionTime: Int16
    @NSManaged public var waterRatio: Int16

}

extension SettingsModel : Identifiable {

}
