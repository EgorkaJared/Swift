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
    
    enum EngileHalse {
        case Good
        case Brake
    }
}


class Car {
    let  id : Int
    let  brand : OptionBrand
    var  color : String
    var  windowStatus : WindowStatus
    var  engineStatus : EngineStatus
    var  engineHelse : EngineStatus.EngileHalse
    
    func go(){}

    
    init(id: Int, brand: OptionBrand, color: String, windowStatus: WindowStatus, engineStatus: EngineStatus, engineHelse: EngineStatus.EngileHalse )
    {
        self.id = id
        self.brand = brand
        self.color = color
        self.windowStatus = windowStatus
        self.engineStatus = engineStatus
        self.engineHelse = engineHelse
    }
}

