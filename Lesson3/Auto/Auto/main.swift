//
//  main.swift
//  Auto
//
//  Created by Егор Ненастьев on 16.05.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import Foundation

struct PassengerCar {
    let brand: Brand  // марка
    let yar: Int     // год
    let volumeTrunk: Double  //объем багажника
    var engineStatus: StatusEngine // статус двигателя
    var windowStatus: WindowStatus { //статус окон
        willSet {
            newValue == .open ? print("Окна открываются") : print("Окна закрываются")
        }
    }
    var action: ActionCargo? // что делать с грузом
    var volumeCargo: Double?  { //количество груза
        didSet {
            if action == .load
                {
                let mas = volumeCargo!
                print(action!,mas,"кг")
                    oldValue == nil ?
                    (volumeCargo = (oldValue ?? 0) + volumeCargo!) :
                        volumeTrunk < volumeCargo! ? print("Lданный авто не вмещает столько груза") :
                        (volumeCargo = oldValue! + volumeCargo!)
                }
            
            if action == .unload
                {
                    oldValue == nil ? print("Груза нет") : oldValue! < volumeCargo! ? print("Недосьаточно груза, имеется", oldValue!) : (volumeCargo = oldValue! - volumeCargo!)
                }
            if action == nil
            {
                print ("Действия с грузом не производятся")
                volumeCargo = oldValue
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
    case load,unload
}

enum Brand {
    case Opel,BMW,Lada,MercedesBenz
}

var car1 = PassengerCar(brand: .BMW, yar: 1998, volumeTrunk: 150, engineStatus: .noWork, windowStatus: .open, volumeCargo: 60)

print(car1)
car1.startEngine()
car1.windowStatus = .close
car1.action = .load
car1.volumeCargo = 10
print(car1.volumeCargo!)
print(car1)



