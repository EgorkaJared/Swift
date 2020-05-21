//
//  main.swift
//  Auto
//
//  Created by Егор Ненастьев on 16.05.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import Foundation

struct Truck {
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
    var action: ActionCargo = .notuch // что делать с грузом
    var volumeCargo: Double = 0  { //количество груза
        didSet {
            if oldValue < volumeCargo {
                action = .load
                let mas = volumeCargo
                print(action,mas,"кг")
                        volumeTrunk < volumeCargo ? print("Данный авто не вмещает столько груза") :
                        (volumeCargo = oldValue + volumeCargo)
            }
            if oldValue > volumeCargo {
                action = .unload
                    oldValue == 0 ? print("Груза нет") : oldValue < volumeCargo ? print("Недосьаточно груза, имеется", oldValue) : (volumeCargo = oldValue - volumeCargo)
            }
            if oldValue == volumeCargo {
                action = .notuch
                print ("Действия с грузом не производятся")
                
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
    var action: ActionCargo = .notuch // что делать с грузом
    var volumeCargo: Double = 0  {//количество груза
        didSet {
            switch action {
            case .load :
                let mas = volumeCargo
                print(action,mas,"кг")
                   volumeTrunk < volumeCargo ? print("Данный авто не вмещает столько груза") :
                        (volumeCargo = oldValue + volumeCargo)
            case .unload :
                    oldValue == 0 ? print("Груза нет") : oldValue < volumeCargo ? print("Недосьаточно груза, имеется", oldValue) : (volumeCargo = oldValue - volumeCargo)
            case  .notuch :
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
    case notuch = "Не переносить"
    
}

enum Brand {
    case Opel,BMW,Lada,MercedesBenz
}

var car1 = PassengerCar(id: 1, brand: .BMW, yar: 1998, volumeTrunk: 150, engineStatus: .noWork, windowStatus: .open)
var car2 = PassengerCar(id: 2, brand: .Lada, yar: 2008, volumeTrunk: 250, engineStatus: .noWork, windowStatus: .open, volumeCargo: 0)
var truck1 = Truck(id: 3, brand: .Opel, yar: 2010, volumeTrunk: 1000, engineStatus: .noWork, windowStatus: .close, action: .unload, volumeCargo: 1500)// не смог понять как ограничить значение при создании, volumeCargo должно быть всегда меньше VolumeTrunk



print(car1)
car1.startEngine()
car1.windowStatus = .close
car1.action = .load
car1.volumeCargo = 10
print(car1.volumeCargo as Any)
print(car1)
car2.action = ActionCargo(rawValue: "Разгрузить")!
print(car2.action.rawValue)
car2.volumeCargo = 40





