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

protocol lotPetrolProtocol{
    var letPetrol: Int {get set}
}

protocol carProtocol{
    func openDoor()
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
    func openDoor() {
        print("Двери открываются")
    }
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

extension Car {
    func refueling() {
        print ("Заправлено \(volumeTunk - (letPetrol.litr() ?? 0)) дитров, бак полон")
        letPetrol = .full
    }
}

var car1 = Car(КоличествоБензина: .middle(litr: 10), СостоянеиеДвигателя: .good, СтатусЗажигания: .noWork, Объем_бака: 50, количество_пассажиров: 4)

car1.openDoor()
car1.refueling()
    
    

