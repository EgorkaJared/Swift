//
//  main.swift
//  Auto
//
//  Created by Егор Ненастьев on 16.05.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import Foundation

struct PassengerCar {
    let id: Int
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
            switch action {
            case .load :
                let mas = volumeCargo!
                print(action!,mas,"кг")
                    oldValue == nil ?
                    (volumeCargo = (oldValue ?? 0) + volumeCargo!) :
                        volumeTrunk < volumeCargo! ? print("Lданный авто не вмещает столько груза") :
                        (volumeCargo = oldValue! + volumeCargo!)
            case .unload :
                    oldValue == nil ? print("Груза нет") : oldValue! < volumeCargo! ? print("Недосьаточно груза, имеется", oldValue!) : (volumeCargo = oldValue! - volumeCargo!)
            case  nil :
                print ("Действия с грузом не производятся")
                volumeCargo = oldValue
            }
        }
    }
    mutating func startEngine(){ //завести двигатель
        self .engineStatus == .work ?
            print("Двигатель уже запущен") : (self .engineStatus = .work)
    }
    mutating func stopEngine(){
           self .engineStatus == .noWork ? //заглушить двигатель
               print("Двигатель уже заглушен") : (self .engineStatus = .noWork)
    }
}

enum WindowStatus {
    case open, close
}

enum StatusEngine {
    case work, noWork
}

enum ActionCargo: String {
    case load = "Погрузить"
    case unload = "Разгрузить"
}

enum Brand {
    case Opel,BMW,Lada,MercedesBenz
}

var car1 = PassengerCar(id: 1, brand: .BMW, yar: 1998, volumeTrunk: 150, engineStatus: .noWork, windowStatus: .open)
var car2 = PassengerCar(id: 2, brand: .Lada, yar: 2008, volumeTrunk: 250, engineStatus: .noWork, windowStatus: .open, action: .load, volumeCargo: 60)

print(car1)
car1.startEngine()
car1.windowStatus = .close
car1.action = .load
car1.volumeCargo = 10
print(car1.volumeCargo as Any)
print(car1)
car2.action = ActionCargo(rawValue: "Разгрузить")
print(car2.action as Any)
car2.volumeCargo = 40
print(car2)


