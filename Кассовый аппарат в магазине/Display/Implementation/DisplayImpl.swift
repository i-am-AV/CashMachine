//
//  DisplayImpl.swift
//  Кассовый аппарат в магазине
//
//  Created by  Alexander on 10.10.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation

class DisplayImpl: Display {
    func displayString(code: String) {
        print("**Дисплей** - \(code)\n")
    }
}
