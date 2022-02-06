//
//  CoffeeRatingDataModel.swift
//  Siebtracker
//
//  Created by Tim Hiller on 06.02.22.
//

import Foundation

struct CoffeeRatingDataModel {
    var bitterness: Int
    var sourness: Int
    var taste: Int
}

extension CoffeeRatingDataModel {
    init(){
        self.bitterness = 0
        self.sourness = 0
        self.taste = 0
    }
}
