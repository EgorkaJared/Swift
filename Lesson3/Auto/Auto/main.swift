//
//  main.swift
//  Auto
//
//  Created by Егор Ненастьев on 16.05.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import Foundation

struct PassengerCar {
    let brand: Brand
    let yar: Int
    let volumeTrunk: Double
    var engineStatus: StatusEngine
    var windowStatus: Bool
    var action: ActionCargo?
    var volumeCargo: Double
    
    mutating func openWindow(){
        self .windowStatus = true
    }
    mutating func closeWindow(){
        self .windowStatus = false
    }
    mutating func startEngine(){
        self .engineStatus == .work ?
            print("Двигатель уже запущен") : (self .engineStatus = .work)
    }
    mutating func stopEngine(){
           self .engineStatus == .noWork ?
               print("Двигатель уже заглушен") : (self .engineStatus = .noWork)
    }
}

enum StatusEngine:String {
    case work = "Двигатель заведен"
    case noWork = "Двигатель заглушен"
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

enum Brand {
    case Opel
    case BMW
    case Lada
    case MercedesBenz
}

var car1 = PassengerCar(brand: .BMW, yar: 1998, volumeTrunk: 150, engineStatus: .work, windowStatus: false, volumeCargo: 20.0)

car1.openWindow()
car1.startEngine()
print(car1)



