//
//  CoffeeSettingsDataModel.swift
//  Siebtracker
//
//  Created by Tim Hiller on 06.02.22.
//

import Foundation

struct CoffeeSettingsDataModel {
    var coarseGrindFineness: Int
    var coarseGrindWeight: Int
    var espressoRatio: Int
    var waterRatio: Int
    var extractionTime: Int
    var extractedWeight: Int
}

extension CoffeeSettingsDataModel{
    init(){
        self.coarseGrindFineness = 0
        self.coarseGrindWeight = 0
        self.espressoRatio = 1
        self.waterRatio = 2
        self.extractionTime = 0
        self.extractedWeight = 0
    }
}
