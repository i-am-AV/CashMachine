//
//  ADMScannerModelP.swift
//  Кассовый аппарат в магазине
//
//  Created by  Alexander on 10.10.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation

class ADMScannerModelP: ScannerInput {
    var output: ScannerOutput? // (cashMashine)
    
    func scan(code: String, quantity: Float) {
        print("Сосканировали - \(code), кол-во - \(quantity)")
        output?.scanned(code: code, quantity: quantity)
    }
}
