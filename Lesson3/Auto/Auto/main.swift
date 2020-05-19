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
    var action: ActionCargo? // что делать с грузом
    var volumeCargo: Double?  { //количество груза
        didSet {
            if oldValue! < volumeCargo! {
                action = .load
                let mas = volumeCargo!
                print(action!,mas,"кг")
                    oldValue == nil ?
                    (volumeCargo = (oldValue ?? 0) + volumeCargo!) :
                        volumeTrunk < volumeCargo! ? print("Данный авто не вмещает столько груза") :
                        (volumeCargo = oldValue! + volumeCargo!)
            }
            if oldValue! > volumeCargo! {
                action = .unload
                    oldValue == nil ? print("Груза нет") : oldValue! < volumeCargo! ? print("Недосьаточно груза, имеется", oldValue!) : (volumeCargo = oldValue! - volumeCargo!)
            }
            if oldValue! == volumeCargo! {
                action = nil
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
                        volumeTrunk < volumeCargo! ? print("Данный авто не вмещает столько груза") :
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
var truck1 = Truck(id: 3, brand: .Opel, yar: 2010, volumeTrunk: 1000, engineStatus: .noWork, windowStatus: .close, action: .unload, volumeCargo: 1000)

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



