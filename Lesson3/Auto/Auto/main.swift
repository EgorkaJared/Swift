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
    var windowStatus: WindowStatus {
        willSet {
            newValue == .open ? print("Окна открываются") : print("Окна закрываются")
        }
    }
    var action: ActionCargo?
    var volumeCargo: Double?  {
        didSet {
            if oldValue == nil{
            print("Груза нет")
            volumeCargo = nil
            }
            else
            {
            let mas = volumeCargo!
            print(action!,mas,"кг")
            }
            
        }
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

enum WindowStatus {
    case open, close
}

enum StatusEngine {
    case work, noWork
}

enum ActionCargo {
    case load
    case unload
}

enum Brand {
    case Opel
    case BMW
    case Lada
    case MercedesBenz
}

var car1 = PassengerCar(brand: .BMW, yar: 1998, volumeTrunk: 150, engineStatus: .work, windowStatus: .open, volumeCargo: 10)

print(car1)
car1.startEngine()
car1.windowStatus = .close
car1.action =  .load
car1.volumeCargo = 10
print(car1)



