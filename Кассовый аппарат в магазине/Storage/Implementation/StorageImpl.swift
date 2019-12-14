//
//  StorageImpl.swift
//  Кассовый аппарат в магазине
//
//  Created by  Alexander on 10.10.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation


class StorageImpl: Storage {
    
    private var goods: [String: Float] = .generate()
    
    func decrement(goodId: String, quantity: Float) -> Bool {
        guard let storedQuantity = goods[goodId], storedQuantity >= quantity else {
            return false
        }
        
        goods[goodId] = storedQuantity - quantity
        return true
    }
}
