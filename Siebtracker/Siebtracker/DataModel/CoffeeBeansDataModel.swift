//
//  CoffeeBeansDataModel.swift
//  Siebtracker
//
//  Created by Tim Hiller on 06.02.22.
//

import Foundation

struct CoffeeBeansDataModel {
    var beanName: String
    var beanProducer: String
    var productImageUrl: NSURL
}

extension CoffeeBeansDataModel{
    init(){
        self.beanName = ""
        self.beanProducer = ""
        self.productImageUrl = NSURL()
    }
}
