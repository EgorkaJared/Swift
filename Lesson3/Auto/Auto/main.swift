//
//  main.swift
//  Auto
//
//  Created by Егор Ненастьев on 16.05.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import Foundation

struct Car {
    let brand: String
    let yar: Int
    let volumeTrunk: Double
    var engineStatus: Bool
    var windowStatus: Bool
    var action: ActionCargo?
    var volumeCargo: Double
}

enum ActionEngine:String {
    case start = "Завести двигатель"
    case stop = "Заглушить двигатель"
}

enum WindowStatus:String {
    case open = "Открыть окна"
    case close = "Закрыть окна"
}

enum ActionCargo: String {
    case load = "Погрузить"
    case unload = "Пазгрузить"
}

var car1 = Car(brand: "Opel", yar: 1998, volumeTrunk: 150, engineStatus: true, windowStatus: false, volumeCargo: 20.0)



