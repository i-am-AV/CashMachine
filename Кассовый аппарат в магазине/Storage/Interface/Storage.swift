//
//  Storage.swift
//  Кассовый аппарат в магазине
//
//  Created by  Alexander on 10.10.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation

protocol Storage {
    func decrement(goodId: String, quantity: Float) -> Bool
}

