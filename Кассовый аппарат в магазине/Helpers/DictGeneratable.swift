//
//  DictGeneratable.swift
//  Кассовый аппарат в магазине
//
//  Created by  Alexander on 10.10.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == GoodInfo {

    static func generate() -> [String: GoodInfo] {
        var output = [String: GoodInfo]() 

        output["Товар 1"] = GoodInfo(title: "Первый товар",
                                     price: Float.random(in: 0...1000),
                                     isAlcohol: false,
                                     tax: 0)
        
        output["Товар 2"] = GoodInfo(title: "Второй товар",
                                     price: Float.random(in: 0...1000),
                                     isAlcohol: false,
                                     tax: 0)

        output["Товар 3"] = GoodInfo(title: "Третий товар",
                                     price: Float.random(in: 0...1000),
                                     isAlcohol: false,
                                     tax: 0)

        output["Товар 4"] = GoodInfo(title: "Четвертый товар",
                                     price: Float.random(in: 0...1000),
                                     isAlcohol: true,
                                     tax: 0)

        print("\t***** Начало генерации товаров ***** \n")

        for i in output {
            print("Сгенерировали - \(i.key).")
            print("Название - \(i.value.title)")
            print("Цена - \(i.value.price)")
            print("Является алкоголем? - \(i.value.isAlcohol)")
            print("Налог - \(i.value.tax) \n" )
        }

         print("\t***** Конец генерации товаров ***** \n")

        return output
    }
}

extension Dictionary where Key == String, Value == Float {
    
    static func generate() -> [String: Float] {
        var output = [String: Float]()
        
        output["Товар 1"] = Float.random(in: 0...1000)
        output["Товар 2"] = Float.random(in: 0...1000)
        output["Товар 3"] = Float.random(in: 0...1000)
        output["Товар 4"] = Float.random(in: 0...1000)
        
        print("\t***** Начало генерации количества товаров ***** \n")

        for i in output {
            print("На складе \(i.key) содержится в количестве \(i.value) \n")
        }

         print("\t***** Конец генерации количества товаров ***** \n")
        
        return output
    }
}
