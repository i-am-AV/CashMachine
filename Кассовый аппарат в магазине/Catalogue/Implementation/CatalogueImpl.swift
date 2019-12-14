//
//  CatalogueImpl.swift
//  Кассовый аппарат в магазине
//
//  Created by  Alexander on 10.10.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation

class CatalogueImpl: Catalogue {
    private var goodsList: [String: GoodInfo] = .generate() 
  
    func goodInfo(id: String) -> GoodInfo? {
        return goodsList[id]
    }
}
