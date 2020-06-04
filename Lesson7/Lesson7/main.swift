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

enum Fio : String {
    case Ivanov = "Иванов"
    case Petrov = "Попов"
    case Myasnikov = "Мясников"
    case Subbotina = "Субботина"
    case Papanin = "Папанин"
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
    func allName () -> [Fio.RawValue:ZP.RawValue] {
        var all: [Fio.RawValue:ZP.RawValue] = [:]
        for indX in self.massive {
            all[indX.name.rawValue] = indX.zp.rawValue
        }
        return all
    }
    
    subscript (ofFio: Fio) -> ZP.RawValue {
        let soloZP = massive.first {$0.name == ofFio}
        guard soloZP != nil else {return 0}
        return soloZP!.zp.rawValue
       }
    subscript () -> Double {
        var sumZp : Double = 0
        guard massive.isEmpty == false  else {
            print("нет сотрудников")
            return sumZp
        }
        for idX in massive {
            sumZp = Double(sumZp + idX.zp.rawValue)
            }
        return sumZp
    }
   
}

//let one = Groop(vedeomst: [.Иванов : .hight
//    , .Мясников : .low , .Полякова : .middle])

//print (one.solo(ofFio: .Иванов)!)
//print (one.average())

var StaffStack = Staff<Groop>()

StaffStack.pushMassive(Groop(name: .Ivanov, zp: .hight))
StaffStack.pushMassive(Groop(name: .Myasnikov, zp: .low))
//StaffStack.pushMassive(Groop(name: .Полякова, zp: .middle))

//print(StaffStack)

print(StaffStack[.Ivanov])


class office  {
    var sumZarplat: Double = StaffStack[]
    var allStaff : [Fio.RawValue:ZP.RawValue]  = StaffStack.allName()
    var allmoneyNakormaney : Double
    
    
    init(allmoney:Double) {
        self.allmoneyNakormaney = allmoney
    }
}

let z = office(allmoney: 1000000)
print("Сумма зарплат = \(z.sumZarplat)")
print("Сумма зарплат = \(z.allStaff)")



