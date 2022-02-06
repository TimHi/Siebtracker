//
//  CoffeeExtractionViewModel.swift
//  Siebtracker
//
//  Created by Tim Hiller on 06.02.22.
//

import Resolver
import Foundation

class CoffeeExtractionViewModel : ObservableObject {
    @Injected private var uiDataService : UIDataService
    var CurrentCoffee: CoffeeDataModel
    
    init(currentCoffee: CoffeeDataModel){
        self.CurrentCoffee = currentCoffee
    }
    
    public func StoreCoffeeSettings(){
        uiDataService.updateCurrentCoffee(coffee: self.CurrentCoffee)
    }
}
