//
//  main.swift
//  Lesson7
//
//  Created by Егор Ненастьев on 04.06.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import Foundation

protocol Name {
    var name: Fio { get set }
    var zp : ZP { get set }
    
}

enum Fio {
    case Иванов, Петров, Мясников, Полякова, Травник
}
enum ZP: Double {
    case hight = 300000
    case middle = 200000
    case low = 100000
}


class Groop : Name {
    var name: Fio
    var zp: ZP
    
    init(name:Fio, zp: ZP) {
        self.name = name
        self.zp = zp
      }
    
//    func solo (ofFio: Fio) -> ZP.RawValue? {
//        return vedomost[ofFio].map { $0.rawValue }
//    }
//
//    func average() -> Double {
//        var sumSalary: Int = 0
//        for ind in vedomost {
//            sumSalary = sumSalary + ind.value.rawValue
//        }
//        return Double(sumSalary/vedomost.count)
//    }
}

struct Staff<T:Name> {
    private var massive: [T] = []
    mutating func pushMassive(_ newStaff : T) {
        massive.append(newStaff)
    }
    
    subscript (ofFio: Fio) -> ZP.RawValue? {
        let soloZP = massive.first {$0.name == ofFio}
        return soloZP?.zp.rawValue
       }
    subscript (allZp: [Fio]) -> Double {
        var sumZp : Double = 0
        for ind in allZp {
            for idX in massive {
                if ind == idX.name {
                    sumZp = Double(sumZp + idX.zp.rawValue)
                }
            }
        }
        return sumZp
    }
   
}

//let one = Groop(vedeomst: [.Иванов : .hight
//    , .Мясников : .low , .Полякова : .middle])

//print (one.solo(ofFio: .Иванов)!)
//print (one.average())

var StaffStack = Staff<Groop>()

StaffStack.pushMassive(Groop(name: .Иванов, zp: .hight))
StaffStack.pushMassive(Groop(name: .Мясников, zp: .low))
StaffStack.pushMassive(Groop(name: .Полякова, zp: .middle))

print(StaffStack)

print(StaffStack[.Иванов]!)
print(StaffStack[[.Иванов,.Мясников,.Травник]])
