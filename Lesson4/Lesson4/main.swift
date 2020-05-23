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
    case noWork = "Заглушен"
    
    enum EngineHalse : String {
        case Good = "Исправен"
        case Brake = "Неисправен"
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

enum Tax: String {
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
    
    func litter() -> Double? {
        switch self {
        case .middle(let liter):
            return liter
        default:
            return nil
        }
    }
}
enum IdString : String{
    case sport = "Спорт"
    case pasNg = "Пасажирская"
}





class car {
    let  id : (IdString,Int)
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

    
    init(id: (IdString,Int), brand: OptionBrand, color: String, windowStatus: WindowStatus, engineStatus: EngineStatus, engineHelse: EngineStatus.EngineHalse )
    {
        self.id = id
        self.brand = brand
        self.color = color
        self.windowStatus = windowStatus
        self.engineStatus = engineStatus
        self.engineHelse = engineHelse
        
        if self.engineHelse == .Brake { print("В автомобиле c id (\(id.0.rawValue) \(id.1)) двигатель сломан и не может быть заведен"); self.engineStatus = .noWork}
    }
}

class sportCar: car {
    let volumeTunk : Double
    var letPetrol : LetPetrol
    var carClass : RuleCar
    override func go() {
        switch self.letPetrol {
        case .full:
            print("Бак Полон")
        case .middle:
            let filling:Double = volumeTunk - (letPetrol.litter() ?? 0)
            print("в авто (\(id.0.rawValue) \(id.1))Заправлено \(filling) л")
            self.letPetrol = .full
        case .zero:
            let filling:Double = volumeTunk
            print("Заправлено \(filling) л")
            self.letPetrol = .full
        }
    }
    init(id:(IdString ,Int), brand: OptionBrand, color: String, windowStatus: WindowStatus, engineStatus: EngineStatus, engineHelse: EngineStatus.EngineHalse, volumeTunk: Double, letPetrol: LetPetrol, carClass: RuleCar) {
        self.volumeTunk = volumeTunk
        self.carClass = carClass
        self.letPetrol = letPetrol
        super.init(id: id, brand: brand, color: color, windowStatus: windowStatus, engineStatus: engineStatus, engineHelse: engineHelse)
        
        if (letPetrol.litter() ?? 0) > volumeTunk {
            print("В автомобиле c id (\(id.0.rawValue) \(id.1)) бак на \(volumeTunk) л. Вы попытались ввести значение больше, значение заменено на full")
            self.letPetrol = .full
        }
    }
}

class passengerСar: car {
    let lotPassenger: LotPassenger
    let locationICE: LocationICE
    var powerEngine: Double
    var tax: Tax {
    get {
        switch self.powerEngine {
        case 0...100:
            return .lower
        case 100...150:
            return .low
        case 150...200:
            return .middle
        case 200...250:
            return .high
        default:
            return .highest
            }
        }
    }
    
    override func go(){
        print("id (\(id.0.rawValue) \(id.1)), цвет \(color), окна \(windowStatus.rawValue), двигатель \(engineStatus.rawValue) и \(engineHelse.rawValue)")
    }
    
    init(id:(IdString, Int), brand: OptionBrand, color: String, windowStatus: WindowStatus, engineStatus: EngineStatus, engineHelse: EngineStatus.EngineHalse, lotPassenger: LotPassenger, locationICE: LocationICE, powerEngine: Double, tax: Tax) {
        self.lotPassenger = lotPassenger
        self.locationICE = locationICE
        self.powerEngine = powerEngine
        super.init(id: id, brand: brand, color: color, windowStatus: windowStatus, engineStatus: engineStatus, engineHelse: engineHelse)
    }
}

    
    
var sportCar1 = sportCar(id:(.sport,1), brand: .BMW, color: "Black", windowStatus: .close, engineStatus: .noWork, engineHelse: .Good, volumeTunk: 50, letPetrol: .middle(liter: 90), carClass: .SuperCar)
var sportCar2 = sportCar(id:(.sport,2), brand: .BMW, color: "Black", windowStatus: .close, engineStatus: .noWork, engineHelse: .Good, volumeTunk: 50, letPetrol: .middle(liter: 20), carClass: .SuperCar)

var passengerCar1 = passengerСar(id:(.pasNg,1), brand: .OPEL, color: "White", windowStatus: .close, engineStatus: .work, engineHelse: .Brake, lotPassenger: .two, locationICE: .front, powerEngine: 112, tax: .highest)

passengerCar1.engineHelse = .Brake
print(passengerCar1.engineStatus)
print(sportCar1.brand)


print(passengerCar1.tax)
passengerCar1.go()

sportCar1.go()
sportCar2.go()
//sportCar1.go()

