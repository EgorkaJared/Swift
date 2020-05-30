//
//  main.swift
//  Lesson6
//
//  Created by Егор Ненастьев on 28.05.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import Foundation

var t: Int = 1

enum PreoritiOreder: Int {
    case hight = 1
    case middle = 2
    case low = 3
    }
    
enum StatusProcess{
    case new
    case work
    case done
        
    }

enum NameCollector {
    case Иван, Олег, Яна, Анатолий, Света
}

class processingQueue {     //очередь на обработку
    
    var idOreder: Int = t
    var preoriti: PreoritiOreder
    var statusProcessing: StatusProcess = .new
    
    init(preoriti: PreoritiOreder) {
        self.preoriti = preoriti
        t = t + 1
        
    }
        
}

class collectionQueue {  // очередь на сборку
    
    var nameCollector: NameCollector
    var id: Int
    var preoriti: PreoritiOreder
    var status: StatusProcess = .new
    
    init(Сборщик: NameCollector, id: Int, Преоритет: PreoritiOreder) {
        self.nameCollector = Сборщик
        self.id = id
        self.preoriti = Преоритет
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
    mutating func revoveNewOrede() {
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


//
//class shipmentQueue { // очередь на отправку
//}


var OrderStack = newOrder()

var F1 = processingQueue(preoriti: .middle)
var F2 = processingQueue(preoriti: .low)
var F3 = processingQueue(preoriti: .hight)
var F4 = processingQueue(preoriti: .middle)
var F5 = processingQueue(preoriti: .middle)
var F6 = processingQueue(preoriti: .hight)


OrderStack.pushNewOreder(F1)
OrderStack.pushNewOreder(F2)
OrderStack.pushNewOreder(F3)
OrderStack.pushNewOreder(F4)
OrderStack.pushNewOreder(F5)
OrderStack.pushNewOreder(F6)

func processing () { // функция получения и удаления первого заказа в очереди
    if OrderStack.popNewOrder() != nil {
        print("первый заказ в очереди с id = \(OrderStack.popNewOrder()!.idOreder) \(OrderStack.popNewOrder()!.statusProcessing)")
        OrderStack.revoveNewOrede()
    }
    else {print("нет заказов")}
}

processing()
processing()






 

