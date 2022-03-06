//
//  UIDataService.swift
//  Siebtracker
//
//  Created by Tim Hiller on 06.02.22.
//

import Foundation
import Resolver

class UIDataService : UIDataProtocol{
    private var currentCoffee : CoffeeDataModel
    @Injected var databaseService : DatabaseService
    
    init() {
        self.currentCoffee = CoffeeDataModel(coffeeId: UUID(), date: Date())
    }
    
    func updateCurrentCoffee(coffee: CoffeeDataModel) {
        self.currentCoffee = coffee
        storeCurrentCoffee() //TODO Merge
    }
    
    func getCurrentCoffee() -> CoffeeDataModel {
        return self.currentCoffee
    }
    
    func getLastCoffee() -> CoffeeDataModel {
        /*
        return CoffeeDataModel(coffeeId: UUID(), date: Date(), rating: CoffeeRatingDataModel(bitterness: 1, sourness: 1, taste: 1), beans: CoffeeBeansDataModel(beanName: "as", beanProducer: "as", productImageUrl: NSURL()), settings: CoffeeSettingsDataModel(coarseGrindFineness: 0, coarseGrindWeight: 0, espressoRatio: 0, waterRatio: 0, extractionTime: 0, extractedWeight: 0))*/
        return self.databaseService.getLastExtractedCoffee()
    }
    
    func storeCurrentCoffee(){
        self.databaseService.storeExtractedCoffee(coffeeToStore: self.currentCoffee)
    }
}
