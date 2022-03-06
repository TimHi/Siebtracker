//
//  DatabaseService.swift
//  Siebtracker
//
//  Created by Tim Hiller on 12.02.22.
//

import Foundation
import CoreData
import UIKit

class DatabaseService : DatabaseProtocol, ObservableObject {
    
    let container = NSPersistentContainer(name: "CoffeeModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func getLastExtractedCoffee() -> CoffeeDataModel {
        let context = self.container.viewContext
        var result = CoffeeDataModel(coffeeId: UUID(), date: Date(), rating: CoffeeRatingDataModel(bitterness: 0, sourness: 0, taste: 0), beans: CoffeeBeansDataModel(beanName: "", beanProducer: "", productImageUrl: NSURL()), settings: CoffeeSettingsDataModel(coarseGrindFineness: 0, coarseGrindWeight: 0, espressoRatio: 0, waterRatio: 0, extractionTime: 0, extractedWeight: 0))
        var request = NSFetchRequest<CoffeeModel>(entityName: "CoffeeModel")
        request.returnsObjectsAsFaults = false
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        request.fetchLimit = 1
        request.returnsObjectsAsFaults = false
        do{
            var core_result = try context.fetch(request)
            result.date = core_result[0].date
            
        }catch{
            print(error)
        }
        return result
    }
    
    func storeExtractedCoffee(coffeeToStore: CoffeeDataModel) {
        let context = self.container.viewContext
        let coffeeRatingModel = RatingModel(entity: NSEntityDescription.entity(forEntityName: "RatingModel", in: context)!, insertInto: context)
        coffeeRatingModel.id = UUID()
        coffeeRatingModel.taste = Int16(coffeeToStore.rating.taste)
        coffeeRatingModel.bitterness = Int16(coffeeToStore.rating.bitterness)
        coffeeRatingModel.sourness = Int16(coffeeToStore.rating.sourness)
        
        let coffeeSettingsModel = SettingsModel(entity: NSEntityDescription.entity(forEntityName: "SettingsModel", in: context)!, insertInto: context)
        coffeeSettingsModel.waterRatio = Int16(coffeeToStore.settings.waterRatio)
        coffeeSettingsModel.espressoRatio = Int16(coffeeToStore.settings.espressoRatio)
        coffeeSettingsModel.extractionTime = Int16(coffeeToStore.settings.extractionTime)
        coffeeSettingsModel.extractedWeight = Int16(coffeeToStore.settings.extractedWeight)
        coffeeSettingsModel.coarseGrindWeight = Int16(coffeeToStore.settings.coarseGrindWeight)
        coffeeSettingsModel.coarseGrindFineness = Int16(coffeeToStore.settings.coarseGrindFineness)
        coffeeSettingsModel.id = UUID()
        
        let coffeeBeansModel = BeansModel(entity: NSEntityDescription.entity(forEntityName: "BeansModel", in: context)!, insertInto: context)
        coffeeBeansModel.image = URL(string: "google.de")
        coffeeBeansModel.producer = coffeeToStore.beans.beanProducer
        coffeeBeansModel.name = coffeeToStore.beans.beanName
        coffeeBeansModel.id = UUID()
        let coffeeDBModel = CoffeeModel(entity: NSEntityDescription.entity(forEntityName: "CoffeeModel", in: context)!, insertInto: context)
        coffeeDBModel.id = coffeeToStore.coffeeId
        coffeeDBModel.date = coffeeToStore.date
        
        coffeeDBModel.beansID = coffeeBeansModel.id
        coffeeDBModel.ratingID = coffeeRatingModel.id
        coffeeDBModel.settingsID = coffeeSettingsModel.id
        
        do {
            try container.viewContext.save()
        }catch{
            print(error)
        }
    }
}
