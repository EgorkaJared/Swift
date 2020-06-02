//
//  main.swift
//  Lesson6
//
//  Created by Егор Ненастьев on 28.05.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import Foundation

var t: Int = 1
var k: Int = 0

enum Products {
    
    case sausage, bread, milk, chewing, gum, coffee, cake, cheese, toast, sauce, eggs, cookies
}

enum PreoritiOreder: Int {
    case hight = 1
    case middle = 2
    case low = 3
    }
    
enum StatusProcess{
    case new
    case prework
    case work
    case done
    case cancel
        
    }

enum NameCollector {
    case Иван, Олег, Яна, Анатолий, Света
}

class processingQueue {
    var sum: Double
    var idOreder: Int = t 
    var preoriti: PreoritiOreder
    var statusProcessing: StatusProcess = .new
    var structureOrder: [Products]
    
    init(sum: Double, preoriti: PreoritiOreder, structureOrder:[Products]) {
        self.sum = sum
        self.preoriti = preoriti
        self.structureOrder = structureOrder
        t = t + 1
        
    }
}

class collectionQueue: SumOrder&IdOrder  {   // очередь на сборку
    var nameCollector: NameCollector
    var sum: Double
    var id: Int
    var status: StatusProcess = .new
    
    init(sum: Double, id: Int, nameCollector: NameCollector) {
        self.id = id
        self.sum = sum
        self.nameCollector = nameCollector
    }
}

class shipmentQueue: SumOrder&IdOrder {  // очередь на сборку
    
    var sum: Double
    var nameCollector: NameCollector
    var id: Int
    var status: StatusProcess = .new
    
    init(sum: Double, Курьер: NameCollector, id: Int) {
        self.nameCollector = Курьер
        self.id = id
        self.sum = sum
    }
}
struct newOrder {
    private var order : [processingQueue] = []
    mutating func pushNewOreder(_ newOrder: processingQueue){
        order.append(newOrder)
        order.sort()
        }
    
    mutating func popNewOrder() -> processingQueue? {
        if order.isEmpty == false
        {
        let workOrder = order[0]
        return workOrder
        }
        return nil
    }
    mutating func removeNewOrede() {
        if order.isEmpty == false {
            order.removeFirst()
        }
    }
}
struct addOrder<T:SumOrder&IdOrder> {
    private var order : [T] = []
    mutating func pushNewOreder(_ newOrder: T){
        order.append(newOrder)
        }
    
    mutating func popNewOrder() -> T? {
        if order.isEmpty == false
        {
            var workOrder = (order.first{$0.status == .new})!
            workOrder.status = .prework
            return workOrder
        }
        return nil
    }
    mutating func removeNewOrede() {
        if order.isEmpty == false {
            order.removeFirst()
        }
    }
    mutating func filter(name: NameCollector) -> [T] {
         let OrderName = order.filter{$0.nameCollector == name}
        return OrderName
            }
    subscript (order: Int ...) -> Double {
        var sum = 0.0
        for index in order where index < self.order.count {
            sum += self.order[index].sum
            }
        return sum
    }
    subscript (status: NameCollector ) -> [Int] {
        let allOrder = order.filter{$0.nameCollector == status}
        return allOrder.map{$0.id}
    }
    subscript (idX: Int) -> StatusProcess? {
        get
        {
            let zakaz = self.order.first(where: {$0.id == idX})
            if zakaz != nil {
                return  zakaz?.status
            }
            else {return nil}
        }
        set
        {
            var zakaz = self.order.first(where: {$0.id == idX})
            if zakaz != nil {
                zakaz?.status = newValue! }
        }
    }
}
protocol SumOrder {
    var sum : Double {get set}
    var nameCollector: NameCollector { get set }
    var status: StatusProcess { get set }
}

protocol IdOrder {
    var id: Int { get set }
}

extension processingQueue: Comparable{
    static func < (lhs: processingQueue, rhs: processingQueue) -> Bool{
        return lhs.preoriti.rawValue < rhs.preoriti.rawValue
        }
    
    static func == (lhs: processingQueue, rhs: processingQueue) -> Bool{
        return lhs.preoriti.rawValue == rhs.preoriti.rawValue
        }
    
    static func > (lhs: processingQueue, rhs: processingQueue) -> Bool {
          return lhs.preoriti.rawValue > rhs.preoriti.rawValue
        }
    
    static func >= (lhs: processingQueue, rhs:processingQueue) -> Bool{
        return lhs.preoriti.rawValue >= rhs.preoriti.rawValue
        }
    
    static func <= (lhs: processingQueue, rhs: processingQueue) -> Bool{
        return lhs.preoriti.rawValue <= rhs.preoriti.rawValue
        }
    
}
var NewOrderStack = newOrder()
var CollectionStack = addOrder<collectionQueue>()
var ShipmentStack = addOrder<shipmentQueue>()

for _ in 0...3 {
    NewOrderStack.pushNewOreder(processingQueue(sum: 100, preoriti: .low, structureOrder: [.bread,.cake,.coffee,.eggs]))
    NewOrderStack.pushNewOreder(processingQueue(sum: 100, preoriti: .middle, structureOrder: [.bread,.cake,.coffee,.eggs]))
    NewOrderStack.pushNewOreder(processingQueue(sum: 100, preoriti: .hight, structureOrder: [.bread,.cake,.coffee,.eggs]))
}

func processing () { // функция подтверждение и передачи заказа сборщику
    let ActionOrder = NewOrderStack.popNewOrder()
    
    if ActionOrder != nil {
        NewOrderStack.removeNewOrede()
        print("первый заказ в очереди с id = \(ActionOrder!.idOreder) состав заказа \(ActionOrder!.structureOrder))")
        ActionOrder!.statusProcessing = .work
        print("Идет обработка заказа, для перехода к сборке нажмите Y, для отмены нажмите Q")
        let answer = readLine()
        if answer == "Y" || answer == "y" { // не стал дописывать проверки тк сейчас в этом нет необходимости
            ActionOrder!.statusProcessing = .done
            switch k {
                case 0 :
                    let Z1 = collectionQueue(sum:ActionOrder!.sum, id: ActionOrder!.idOreder, nameCollector: .Анатолий)
                    CollectionStack.pushNewOreder(Z1)
                    k = k + 1
                case 1 :
                    let Z1 = collectionQueue(sum:ActionOrder!.sum, id: ActionOrder!.idOreder, nameCollector: .Иван)
                    CollectionStack.pushNewOreder(Z1)
                    k = k + 1
                case 2 :
                    let Z1 = collectionQueue(sum:ActionOrder!.sum, id: ActionOrder!.idOreder, nameCollector: .Олег)
                        CollectionStack.pushNewOreder(Z1)
                        k = k + 1
                case 3 :
                    let Z1 = collectionQueue(sum:ActionOrder!.sum, id: ActionOrder!.idOreder, nameCollector: .Света)
                        CollectionStack.pushNewOreder(Z1)
                        k = k + 1
            default:
                let Z1 = collectionQueue(sum:ActionOrder!.sum, id: ActionOrder!.idOreder, nameCollector: .Яна)
                    CollectionStack.pushNewOreder(Z1)
                    k = 0
            }
        }
        else {NewOrderStack.popNewOrder()!.statusProcessing = .cancel}
         }
    else {print("нет заказов")}
}
func collecting() {//функция сборки
}

processing()
processing()
processing()
processing()
processing()
processing()
processing()
processing()
processing()
processing()
processing()
processing()
processing()
processing()
processing()
processing()
processing()
processing()
processing()
processing()
processing()

print(" id заказов \(CollectionStack.filter(name: .Анатолий).map{$0.id}) на сумму \(CollectionStack.filter(name: .Анатолий).map{$0.sum})")
print("Сумма заказов =",CollectionStack[1,3,5])

print(CollectionStack[.Анатолий])
print("статус заказ = \(CollectionStack[60])")
CollectionStack[60] = .done
print("статус заказ = \(CollectionStack[60])")
print(CollectionStack[1,3])








 

