//
//  homeAppliancesModel.swift
//  powerScale
//
//  Created by Elisa Kalil on 08/06/22.
//

import Foundation

class HomeApplianceModel {
    
    let name: String
    let power: Int
    var quantity: Int = 0
    
    init(name: String, power: Int, quantity: Int = 0) {
        self.name = name
        self.power = power
        self.quantity = quantity
    }
    
}


