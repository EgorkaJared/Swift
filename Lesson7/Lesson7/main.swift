//
//  main.swift
//  Lesson7
//
//  Created by Егор Ненастьев on 04.06.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import Foundation

enum Fio {
    case Иванов, Петров, Мясников, Полякова, Травник
}
enum ZP: Int {
    case hight = 300000
    case middle = 200000
    case low = 100000
}


class Groop {
    var vedomost = [Fio: ZP]()
    
    init(vedeomst:[Fio: ZP]) {
          self.vedomost = vedeomst
      }
    
    func solo (ofFio: Fio) -> ZP.RawValue? {
        return vedomost[ofFio].map { $0.rawValue }
    }
    
    func average() -> Double {
        var sumSalary: Int = 0
        for ind in vedomost {
            sumSalary = sumSalary + ind.value.rawValue
        }
        return Double(sumSalary/vedomost.count)
    }
}

struct Staff<T> {
    private var massive: [T] = []
    func pushMassive(_ : T) -> [T] {
        <#function body#>
    }
}

let one = Groop(vedeomst: [.Иванов : .hight
    , .Мясников : .low , .Полякова : .middle])

print (one.solo(ofFio: .Иванов)!)
print (one.average())
