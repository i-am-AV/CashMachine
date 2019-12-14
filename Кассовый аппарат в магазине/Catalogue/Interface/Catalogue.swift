//
//  Catalogue.swift
//  Кассовый аппарат в магазине
//
//  Created by  Alexander on 10.10.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation

struct GoodInfo {
    
    let title: String
    let price: Float
    let isAlcohol: Bool
    let tax: Float 
    
    init(title: String, price: Float,
         isAlcohol: Bool, tax: Float) {
        
        self.title = title
        self.price = price
        self.isAlcohol = isAlcohol
        self.tax = isAlcohol ? price * 0.3 + price * 0.2 : price * 0.2
      
    }
}

protocol Catalogue {
    func goodInfo(id: String) -> GoodInfo?
}


