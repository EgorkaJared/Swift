//
//  main.swift
//  Lesson6
//
//  Created by Егор Ненастьев on 28.05.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import Foundation

var t: Int = 1

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
    case work
    case done
    case cancel
        
    }

enum NameCollector {
    case Иван, Олег, Яна, Анатолий, Света
}

class processingQueue {     //очередь на обработку
    
    var idOreder: Int = t 
    var preoriti: PreoritiOreder
    var statusProcessing: StatusProcess = .new
    var structureOrder: [Products]
    
    init(preoriti: PreoritiOreder, structureOrder:[Products]) {
        self.preoriti = preoriti
        self.structureOrder = structureOrder
        t = t + 1
        
    }
        
}

class collectionQueue {  // очередь на сборку
    
    var nameCollector: NameCollector? = nil
    var id: Int
    var status: StatusProcess = .new
    
    init(id: Int) {
        self.id = id
    }
    
}

class shipmentQueue {  // очередь на сборку
    
    var nameCollector: NameCollector
    var id: Int
    var status: StatusProcess = .new
    
    init(Курьер: NameCollector, id: Int) {
        self.nameCollector = Курьер
        self.id = id
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

struct addOrder<T> {
    private var order : [T] = []
    mutating func pushNewOreder(_ newOrder: T){
        order.append(newOrder)
        }
    
    mutating func popNewOrder() -> T? {
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

var F1 = processingQueue(preoriti: .middle, structureOrder: [.bread,.cake,.coffee,.eggs])
var F2 = processingQueue(preoriti: .low, structureOrder: [.bread,.cake,.coffee,.eggs])
var F3 = processingQueue(preoriti: .hight, structureOrder: [.bread,.cake,.coffee,.eggs])
var F4 = processingQueue(preoriti: .middle, structureOrder: [.bread,.cake,.coffee,.eggs])
var F5 = processingQueue(preoriti: .middle, structureOrder: [.bread,.cake,.coffee,.eggs])
var F6 = processingQueue(preoriti: .hight, structureOrder: [.bread,.cake,.coffee,.eggs])


NewOrderStack.pushNewOreder(F1)
NewOrderStack.pushNewOreder(F2)
NewOrderStack.pushNewOreder(F3)
NewOrderStack.pushNewOreder(F4)
NewOrderStack.pushNewOreder(F5)
NewOrderStack.pushNewOreder(F6)

func processing () { // функция получения и удаления первого заказа в очереди
    if NewOrderStack.popNewOrder() != nil {
        print("первый заказ в очереди с id = \(NewOrderStack.popNewOrder()!.idOreder) состав заказа \((NewOrderStack.popNewOrder()!.structureOrder))")
        NewOrderStack.popNewOrder()!.statusProcessing = .work
        print("Идет обработка заказа, для перехода к сборке нажмите Y, для отмены нажмите Q")
        let answer = readLine()
        if answer == "Y" || answer == "y" { // не стал дописывать проверки тк сейчас в этом нет необходимости
            NewOrderStack.popNewOrder()!.statusProcessing = .done
            let Z1 = collectionQueue(id: NewOrderStack.popNewOrder()!.idOreder)
            CollectionStack.pushNewOreder(Z1)
        }
            
        else {NewOrderStack.popNewOrder()!.statusProcessing = .cancel}
     
        NewOrderStack.removeNewOrede()
          
    }
    else {print("нет заказов")}
}

processing()
print(F3.statusProcessing)
processing()

print(CollectionStack.popNewOrder()!.id)
print(NameCollector.Анатолий)






 

