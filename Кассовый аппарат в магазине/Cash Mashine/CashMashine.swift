//
//  CashMashine.swift
//  Кассовый аппарат в магазине
//
//  Created by  Alexander on 10.10.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation

class CashMashine {
    
    private let catalogue: Catalogue
    private let display: Display
    private let storage: Storage
    
    private var scannedCodes = [(code: String, quantity: Float)]()
    private var formatter = GoodsFormatter()
    private var check = CheckFormatter()
    
    let poiTerminal: POIInput
    let scanner: ScannerInput
    
    init(catalogue: Catalogue,
         poiTerminal: POIInput,
         scanner: ScannerInput,
         display: Display,
         storage: Storage) {
        
        self.catalogue = catalogue
        self.poiTerminal = poiTerminal
        self.scanner = scanner
        self.display = display
        self.storage = storage
        
    }
    
    func pay() {

        var totalPrice: Float = 0
        
        for scannedCode in scannedCodes {
            
            guard let price = catalogue.goodInfo(id: scannedCode.code)?.price,
                      storage.decrement(goodId: scannedCode.code, quantity: scannedCode.quantity)
                
            else {
                    check.printError(string: "**Чек** - Ошибка оплаты! ")
                    return
                 }
            
            totalPrice += price * scannedCode.quantity
            print("Общая сумма - \(totalPrice)")
        }
        
        poiTerminal.tryToPay(amount: totalPrice)
        
    }
}

extension CashMashine: ScannerOutput {
    func scanned(code: String, quantity: Float) {
        display.displayString(code: code)
        
        scannedCodes.append((code: code, quantity: quantity))
    }
}

extension CashMashine: POIOutput {
    func callback(success: Bool) {
        print("Оплатили? - \(success) \n")
        
        if success {
            
            print("\t\t***** Печать чека *****  \n")
            check.printCheck(with: scannedCodes, from: catalogue)
            print("\t\t***** Печать чека закончена *****  \n")
            display.displayString(code: "Заберите чек. Приходите еще!")
            
        } else {
            check.printError(string: "**Чек** - Оплата не прошла")
        }
    }
}
