//
//  ContentViewModel.swift
//  Siebtracker
//
//  Created by Tim Hiller on 06.02.22.
//

import Foundation
import Resolver

class ContentViewModel{
    @Injected var uiDataService : UIDataService
    lazy var currentCoffee : CoffeeDataModel = CoffeeDataModel(coffeeId: UUID(), date: Date())

    public func updateCoffee(){
        currentCoffee = uiDataService.getCurrentCoffee()
    }
    
    public func getLastCoffee() -> CoffeeDataModel {
        return uiDataService.getLastCoffee()
    }
}
