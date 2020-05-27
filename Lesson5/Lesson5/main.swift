//
//  main.swift
//  Lesson5
//
//  Created by Егор Ненастьев on 25.05.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import Foundation

enum LetPetrol {
    case full
    case Zero
    case middle(litr:Double)
    
    func litr() -> Double? {
        switch self {
        case .middle(let litr) :
            return litr
        default:
           return nil
        }
    }
}

enum ActionEngine {
    case work
    case noWork
    enum HelthEngine {
        case brake
        case good
    }
}

enum ClassCar {
    case superCar, hyperCar, musleCar, raceCar
}

protocol lotPetrolProtocol{
    var letPetrol: Int {get set}
}

protocol carProtocol{
    func actionEngine()
    var volumeTunk: Double {get set}
    var statusEngine: ActionEngine {get set}
    var healthEngine : ActionEngine.HelthEngine {get set}
    
}

class Car: carProtocol {
    
    var letPetrol: LetPetrol
    var healthEngine: ActionEngine.HelthEngine
    var statusEngine: ActionEngine
    var volumeTunk: Double
    let lotPassanger : Int
    func actionEngine() {
        if self.healthEngine == .brake{print("Двигатель сломан"); self.statusEngine = .noWork}
    }
    
        
    init (КоличествоБензина:LetPetrol,СостоянеиеДвигателя: ActionEngine.HelthEngine, СтатусЗажигания: ActionEngine, Объем_бака: Double, количество_пассажиров: Int) {
        
        self.letPetrol = КоличествоБензина
        self.healthEngine = СостоянеиеДвигателя
        self.statusEngine = СтатусЗажигания
        self.volumeTunk = Объем_бака
        self.lotPassanger = количество_пассажиров
        
        if (letPetrol.litr() ?? 0) > volumeTunk {print("Вы пытаетесь залить больше, объема бака \(volumeTunk) л, бак заполнен полностью, значение заменено на full");
            letPetrol = .full
        }
        
        
    }
}

class sportCar: Car {
    var powerEngine: Double
    
    init(КоличествоБензина: LetPetrol, СостоянеиеДвигателя: ActionEngine.HelthEngine, СтатусЗажигания: ActionEngine, Объем_бака: Double, количество_пассажиров: Int, Мощностьдвигателя: Double) {
        self.powerEngine = Мощностьдвигателя
        super.init(КоличествоБензина: КоличествоБензина, СостоянеиеДвигателя: СостоянеиеДвигателя, СтатусЗажигания: СтатусЗажигания, Объем_бака: Объем_бака, количество_пассажиров: количество_пассажиров)
    }
}

class trunkCar: Car {
var tonnage: Double
    init(КоличествоБензина: LetPetrol, СостоянеиеДвигателя: ActionEngine.HelthEngine, СтатусЗажигания: ActionEngine, Объем_бака: Double, количество_пассажиров: Int, Грузоподъеиность: Double) {
        self.tonnage = Грузоподъеиность
        super.init(КоличествоБензина: КоличествоБензина, СостоянеиеДвигателя: СостоянеиеДвигателя, СтатусЗажигания: СтатусЗажигания, Объем_бака: Объем_бака, количество_пассажиров: количество_пассажиров)
    
    }

}

extension Car {
    func refueling() {
        switch letPetrol {
        case .full:
            print("Бак уже полон, запралено 0 л")
        case .middle(_):
            print ("Заправлено \(volumeTunk - (letPetrol.litr() ?? 0)) дитров, бак полон")
            letPetrol = .full
        default:
            print("Бак полностью наполнен \(volumeTunk)")
        }
    }
}
    
extension trunkCar {
    func openDoor() {
        print("Двери открывются")
    }
}

extension sportCar {
    var classCar: ClassCar {
        get {
            if powerEngine <= 200 {return .raceCar}
            if powerEngine > 200 && powerEngine <= 300 {return .musleCar}
            if powerEngine > 300 && powerEngine <= 400 {return .superCar}
            return .hyperCar
            }
        }
    }




var car1 = trunkCar(КоличествоБензина: .full, СостоянеиеДвигателя: .good, СтатусЗажигания: .noWork, Объем_бака: 100, количество_пассажиров: 2, Грузоподъеиность: 1000)

var sportcar1 = sportCar(КоличествоБензина: .full, СостоянеиеДвигателя: .good, СтатусЗажигания: .work, Объем_бака: 50, количество_пассажиров: 2, Мощностьдвигателя: 250)


car1.openDoor()
car1.refueling()

print(sportcar1.classCar)
    
    

