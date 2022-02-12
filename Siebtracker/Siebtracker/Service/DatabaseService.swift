//
//  DatabaseService.swift
//  Siebtracker
//
//  Created by Tim Hiller on 12.02.22.
//

import Foundation
import SQLite

class DatabaseService : DatabaseProtocol{
    var lastExtractedCoffee = CoffeeDataModel(coffeeId: UUID(), date: Date(), rating: CoffeeRatingDataModel(bitterness: 1, sourness: 5, taste: 5), beans: CoffeeBeansDataModel(beanName: "DummyBeans", beanProducer: "Prod", productImageUrl: NSURL()), settings: CoffeeSettingsDataModel(coarseGrindFineness: 8, coarseGrindWeight: 12, espressoRatio: 1, waterRatio: 2, extractionTime: 27, extractedWeight: 49))
    
    var coffeeBeans = CoffeeBeansDataModel(beanName: "DummyBeans", beanProducer: "DummyProd", productImageUrl: NSURL())
    
    func storeExtractedCoffee(coffeeToStore: CoffeeDataModel) {
        self.lastExtractedCoffee = coffeeToStore
    }
    
    func getLastExtractedCoffee() -> CoffeeDataModel {
        return self.lastExtractedCoffee
    }
    
    func storeCoffeeBeans(coffeeBeans: CoffeeBeansDataModel) {
        self.coffeeBeans = coffeeBeans
    }
    
    func getCoffeeBeansByName(name: String) -> CoffeeBeansDataModel {
        return self.coffeeBeans
    }
}
