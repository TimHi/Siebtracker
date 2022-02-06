//
//  CoffeeDataModel.swift
//  Siebtracker
//
//  Created by Tim Hiller on 06.02.22.
//

import Foundation

struct CoffeeDataModel {
    var coffeeId: UUID
    var date: Date
    var rating: CoffeeRatingDataModel
    var beans: CoffeeBeansDataModel
    var settings: CoffeeSettingsDataModel
}

extension CoffeeDataModel {
    init(coffeeId: UUID, date: Date){
        self.coffeeId = coffeeId
        self.date = date
        self.rating = CoffeeRatingDataModel()
        self.beans = CoffeeBeansDataModel()
        self.settings = CoffeeSettingsDataModel()
    }
}
