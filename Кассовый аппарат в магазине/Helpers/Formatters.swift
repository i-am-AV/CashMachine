//
//  Formatters.swift
//  Кассовый аппарат в магазине
//
//  Created by  Alexander on 10.10.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation

class PriceFormatter {
    func prettyPrinted(from: Float) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        
        let errorString = "Форматировать в строку не удалось"
        
        return numberFormatter.string(from: NSNumber(floatLiteral: Double(from))) ?? errorString
    }
}

class GoodsFormatter {
    func shortDescription(of: GoodInfo) -> String {
        let priceFormatter = PriceFormatter()
        return of.title + " ----- " + priceFormatter.prettyPrinted(from: of.price)
    }
    
    func fullDescription(of: GoodInfo) -> String {
        return """
        Товар - \(of.title) 
        Стоимость  - \(of.price) +  является алкоголем \(of.isAlcohol).
        Облагается налогом в \(of.tax)
        """
    }
    
}

class CheckFormatter {
    
    private let add = AdditionalInfoFormatter()
    
    func printCheck(with: [(code: String, quantity: Float)], from: Catalogue) {
        print("\t\t\t Добро пожаловать в наш магазин!")
        print("Название \t Цена за единицу \t Количество \t Общая стоимость")
        
        var totalPrice: Float = 0.0
        
        for value in with {
            guard  let title = from.goodInfo(id: value.code)?.title,
                   let price = from.goodInfo(id: value.code)?.price
            else {
                    print("Не удалось напечатать товар")
                    return
                 }
            
            let sum = price * value.quantity
            let abbr = add.abbr(id: value.code)
            totalPrice += sum
            print("\(title)\t \(price)\t\t\t \(value.quantity) \(abbr) \t\t\t \(sum)")
        }
        
        print("Итого --- \(totalPrice)")
        print(add.date())
        print("Спасибо за покупку! Приходите еще!\n")
    }
    
    func printError(string: String) {
        print("**Чек** - Внимание! Оплата не прошла!")
        print(string)
    }
}

class AdditionalInfoFormatter {
    
    
    func date() -> String {
        
        let date = Date()
        let calendar = Calendar.current
        
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        return "Дата: \(day).\(month).\(year) \nВремя: \(hour):\(minute):\(second)"
    }
    
    func abbr(id: String) -> String {
        switch id {
        
        case "Товар 1", "Товар 3":
            return "шт"
        case "Товар 2":
            return "кг"
        case "Товар 4":
            return "мл"
       
        default:
            return ""
        }
    }
}
