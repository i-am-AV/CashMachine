//
//  CashMashineAssembly.swift
//  Кассовый аппарат в магазине
//
//  Created by  Alexander on 10.10.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation

class CashMashineAssembly {
    static var cashMashine: CashMashine {
        
        let catalogue = CatalogueImpl()
        let scanner = ADMScannerModelP()
        let poiTerminal = POITerminalImpl()
        let display = DisplayImpl()
        let storage = StorageImpl()
        let cashMashine = CashMashine(catalogue: catalogue,
                                      poiTerminal: poiTerminal,
                                      scanner: scanner,
                                      display: display,
                                      storage: storage)
        
        scanner.output = cashMashine 
        poiTerminal.output = cashMashine
        
        return cashMashine
    }
}
