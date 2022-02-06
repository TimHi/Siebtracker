//
//  UIDataService.swift
//  Siebtracker
//
//  Created by Tim Hiller on 06.02.22.
//

import Foundation

class UIDataService : UIDataProtocol{
    private var currentCoffee : CoffeeDataModel
    
    init() {
        currentCoffee = CoffeeDataModel(coffeeId: UUID(), date: Date())
    }
    
    func updateCurrentCoffee(coffee: CoffeeDataModel) {
        self.currentCoffee = coffee
    }
    
    func getCurrentCoffee() -> CoffeeDataModel {
        currentCoffee.settings.coarseGrindWeight = 10
        return currentCoffee
    }
    
    func getLastCoffee() -> CoffeeDataModel {
        return CoffeeDataModel(coffeeId: UUID(), date: Date(), rating: CoffeeRatingDataModel(bitterness: 1, sourness: 2, taste: 3), beans: CoffeeBeansDataModel(beanName: "DummyBeans", beanProducer: "Prod", productImageUrl: NSURL()), settings: CoffeeSettingsDataModel(coarseGrindFineness: 8, coarseGrindWeight: 12, espressoRatio: 1, waterRatio: 2, extractionTime: 30, extractedWeight: 50))
    }
}
