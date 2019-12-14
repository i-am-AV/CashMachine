//
//  POITerminalImpl.swift
//  Кассовый аппарат в магазине
//
//  Created by  Alexander on 10.10.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation

class POITerminalImpl: POIInput {
    var output: POIOutput?
    
    func tryToPay(amount: Float) {
        guard let output = output else {
            print("Необходимо назначить output")
            return
        }
        
//        Пробуем оплатить
        
        output.callback(success: true)
    }
}
