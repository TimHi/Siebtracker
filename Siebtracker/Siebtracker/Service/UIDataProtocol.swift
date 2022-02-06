//
//  UIDataProtocol.swift
//  Siebtracker
//
//  Created by Tim Hiller on 06.02.22.
//

import Foundation

protocol UIDataProtocol {
    /// This function returns the current in-memory stored coffee that is  being extracted
    ///
    /// - Returns: current coffee
    func getCurrentCoffee() -> CoffeeDataModel
    
    /// Updates the current in-memory stored coffee with a given `coffee`
    ///
    /// - Parameter Coffee to set
    func updateCurrentCoffee(coffee: CoffeeDataModel)
    
    func getLastCoffee() -> CoffeeDataModel
}
