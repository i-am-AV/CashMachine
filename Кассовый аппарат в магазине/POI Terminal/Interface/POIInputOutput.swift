//
//  POIInputOutput.swift
//  Кассовый аппарат в магазине
//
//  Created by  Alexander on 10.10.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation

protocol POIInput {
    var output: POIOutput? { get set }
    
    func tryToPay(amount: Float)
}

protocol POIOutput {
    func callback(success: Bool)
}
