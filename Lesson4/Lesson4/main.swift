//
//  main.swift
//  Lesson4
//
//  Created by Егор Ненастьев on 22.05.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//
import Foundation


enum OptionBrand {
    case BMW, OPEL, Lambarghini, AlphaRomeo, Lada, MClaren
}

enum WindowStatus : String {
    case open = "Открыты"
    case close = "Закрыты"
}

enum EngineStatus : String {
    case work = "Заведен"
    case noWork = "Хаглушен"
    
    enum EngineHalse {
        case Good
        case Brake
    }
}

enum RuleCar {
    case MusleCar
    case HyperCar
    case SuperCar
    case RaceCar
    
}

enum LotPassenger {
    case two
    case four
    
}

enum  LocationICE {
    case front
    case behind
}

enum Tax {
    case lower
    case low
    case middle
    case high
    case highest
}

enum LetPetrol{
    case full
    case zero
    case middle(liter: Double)
}




class car {
    let  id : Int
    let  brand : OptionBrand
    var  color : String
    var  windowStatus : WindowStatus
    var  engineStatus : EngineStatus
    var  engineHelse : EngineStatus.EngineHalse
    {
        willSet {
            if newValue == .Brake {print("Двигатель сломался"); engineStatus = .noWork }
        }
    }
    
    func go(){}

    
    init(id: Int, brand: OptionBrand, color: String, windowStatus: WindowStatus, engineStatus: EngineStatus, engineHelse: EngineStatus.EngineHalse )
    {
        self.id = id
        self.brand = brand
        self.color = color
        self.windowStatus = windowStatus
        self.engineStatus = engineStatus
        self.engineHelse = engineHelse
    }
}

class sportCar: car {
    let volumeTunk : Double
    var letPetrol : LetPetrol
    var carClass : RuleCar
    override func go() {
    }
    init(id: Int, brand: OptionBrand, color: String, windowStatus: WindowStatus, engineStatus: EngineStatus, engineHelse: EngineStatus.EngineHalse, volumeTunk: Double, letPetrol: LetPetrol, carClass: RuleCar) {
        self.volumeTunk = volumeTunk
        self.carClass = carClass
        self.letPetrol = letPetrol
        super.init(id: id, brand: brand, color: color, windowStatus: windowStatus, engineStatus: engineStatus, engineHelse: engineHelse)
    }
}

class passengerСar: car {
    let lotPassenger: LotPassenger
    let locationICE: LocationICE
    var powerEngine: Double
    var tax: Tax
    
    init(id: Int, brand: OptionBrand, color: String, windowStatus: WindowStatus, engineStatus: EngineStatus, engineHelse: EngineStatus.EngineHalse, lotPassenger: LotPassenger, locationICE: LocationICE, powerEngine: Double, tax: Tax) {
        self.lotPassenger = lotPassenger
        self.locationICE = locationICE
        self.powerEngine = powerEngine
        self.tax = tax
        super.init(id: id, brand: brand, color: color, windowStatus: windowStatus, engineStatus: engineStatus, engineHelse: engineHelse)
    }
}

    
    
var sportCar1 = sportCar(id: 1, brand: .BMW, color: "Black", windowStatus: .close, engineStatus: .noWork, engineHelse: .Good, volumeTunk: 50, letPetrol: .full, carClass: .SuperCar)

var passengerCar1 = passengerСar(id: 2, brand: .OPEL, color: "White", windowStatus: .close, engineStatus: .work, engineHelse: .Good, lotPassenger: .two, locationICE: .front, powerEngine: 112, tax: .low)

passengerCar1.engineHelse = .Brake
print(passengerCar1.engineStatus)
print(sportCar1.brand)

