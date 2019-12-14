//
//  main.swift
//  Кассовый аппарат в магазине
//
//  Created by  Alexander on 21/09/2019.
//  Copyright © 2019  Alexander. All rights reserved.
//


import Foundation

let cm = CashMashineAssembly.cashMashine

cm.scanner.scan(code: "Товар 1", quantity: 10)
cm.scanner.scan(code: "Товар 2", quantity: 0.5)
cm.scanner.scan(code: "Товар 3", quantity: 90)
cm.scanner.scan(code: "Товар 4", quantity: 1.7)

cm.pay()

cm.scanner.scan(code: "Товар 1", quantity: 33)
cm.scanner.scan(code: "Товар 9", quantity: 6.4)
cm.scanner.scan(code: "Товар 3", quantity: 120)
cm.scanner.scan(code: "Товар 4", quantity: 9.8)

cm.pay()




