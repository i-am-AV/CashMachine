//
//  Scanner.swift
//  Кассовый аппарат в магазине
//
//  Created by  Alexander on 10.10.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation


protocol ScannerInput {
    var output: ScannerOutput? { get set }
    func scan(code: String, quantity: Float)
}

protocol ScannerOutput {
    func scanned(code: String, quantity: Float)
}
