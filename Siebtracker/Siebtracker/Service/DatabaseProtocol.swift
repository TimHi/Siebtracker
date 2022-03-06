//
//  DatabaseProtocol.swift
//  Siebtracker
//
//  Created by Tim Hiller on 12.02.22.
//

import Foundation

protocol DatabaseProtocol {
    func storeExtractedCoffee(coffeeToStore: CoffeeDataModel)
    func getLastExtractedCoffee() -> CoffeeDataModel
    /*
    func storeCoffeeBeans(coffeeBeans: CoffeeBeansDataModel)
    func getCoffeeBeansByName(name: String) -> CoffeeBeansDataModel*/
}
