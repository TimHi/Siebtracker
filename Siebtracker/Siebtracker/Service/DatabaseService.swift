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
    
    //TODO This should be smarter since we go the relationships and ids
    func getLastExtractedCoffee() -> CoffeeDataModel {
        let context = self.container.viewContext
        var coffeeDataModel = CoffeeDataModel(coffeeId: UUID(), date: Date(), rating: CoffeeRatingDataModel(bitterness: 0, sourness: 0, taste: 0), beans: CoffeeBeansDataModel(beanName: "", beanProducer: "", productImageUrl: NSURL()), settings: CoffeeSettingsDataModel(coarseGrindFineness: 0, coarseGrindWeight: 0, espressoRatio: 0, waterRatio: 0, extractionTime: 0, extractedWeight: 0))
        let request = NSFetchRequest<CoffeeModel>(entityName: "CoffeeModel")
        request.returnsObjectsAsFaults = false
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        request.fetchLimit = 1
        request.returnsObjectsAsFaults = false
        do{
            let core_result = try context.fetch(request)
            let beans = getCoffeeBeansById(coffeeBeansId: core_result[0].beansID)
            let rating = getCoffeeRatingById(coffeeRatingId: core_result[0].ratingID)
            let settings = getCoffeeSettingsById(coffeeSettingsId: core_result[0].settingsID)
            
            coffeeDataModel.date = core_result[0].date!
            coffeeDataModel.beans = beans
            coffeeDataModel.rating = rating
            coffeeDataModel.settings = settings
        }catch{
            print(error)
        }
        
        return coffeeDataModel
    }
    
    func getCoffeeSettingsById(coffeeSettingsId: UUID) -> CoffeeSettingsDataModel {
        let context = self.container.viewContext
        var coffeeSettingModel = CoffeeSettingsDataModel(coarseGrindFineness: 0, coarseGrindWeight: 0, espressoRatio: 0, waterRatio: 0, extractionTime: 0, extractedWeight: 0)
        do{
        
            let fetchRequest: NSFetchRequest<SettingsModel>
            fetchRequest = SettingsModel.fetchRequest()

            fetchRequest.predicate = NSPredicate(
                format: "id = %@", coffeeSettingsId.uuidString
            )

            let core_result = try context.fetch(fetchRequest)
            //TODO Check for result
            coffeeSettingModel.coarseGrindFineness = Int(core_result[0].coarseGrindFineness)
            coffeeSettingModel.coarseGrindWeight = Int(core_result[0].coarseGrindWeight)
            coffeeSettingModel.espressoRatio = Int(core_result[0].espressoRatio)
            coffeeSettingModel.waterRatio = Int(core_result[0].waterRatio)
            coffeeSettingModel.extractionTime = Int(core_result[0].extractionTime)
            coffeeSettingModel.extractedWeight = Int(core_result[0].extractedWeight)
        }catch{
            print(error)
        }
        return coffeeSettingModel
    }
    
    func getCoffeeRatingById(coffeeRatingId: UUID) -> CoffeeRatingDataModel {
        let context = self.container.viewContext
        var coffeeRatingModel = CoffeeRatingDataModel(bitterness: 0, sourness: 0, taste: 0)
        do{
        
            let fetchRequest: NSFetchRequest<RatingModel>
            fetchRequest = RatingModel.fetchRequest()

            fetchRequest.predicate = NSPredicate(
                format: "id = %@", coffeeRatingId.uuidString
            )

            let core_result = try context.fetch(fetchRequest)
            //TODO Check for result
            coffeeRatingModel.bitterness = Int(core_result[0].bitterness)
            coffeeRatingModel.sourness = Int(core_result[0].sourness)
            coffeeRatingModel.taste = Int(core_result[0].taste)
            
        }catch{
            print(error)
        }
        return coffeeRatingModel
    }
    
    func getCoffeeBeansById(coffeeBeansId: UUID) -> CoffeeBeansDataModel {
        let context = self.container.viewContext
        var coffeeBeanDataModel = CoffeeBeansDataModel(beanName: "", beanProducer: "", productImageUrl: NSURL())
        do{
        
            let fetchRequest: NSFetchRequest<BeansModel>
            fetchRequest = BeansModel.fetchRequest()

            fetchRequest.predicate = NSPredicate(
                format: "id = %@", coffeeBeansId.uuidString
            )

            let core_result = try context.fetch(fetchRequest)
          //TODO Check for result
        coffeeBeanDataModel.beanName = core_result[0].name!
        coffeeBeanDataModel.beanProducer = core_result[0].producer!
        coffeeBeanDataModel.productImageUrl = core_result[0].image! as NSURL
            
        }catch{
            print(error)
        }
        return coffeeBeanDataModel
    }
    
    //TODO This should be smarter
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
