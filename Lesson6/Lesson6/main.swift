//
//  main.swift
//  Lesson6
//
//  Created by Егор Ненастьев on 28.05.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import Foundation

var t: Int = 0

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

struct newOrder<T> {
    private var order : [T] = []
    mutating func pushNewOreder(_ newOrder: T){
        order.append(newOrder)
    }
    mutating func popNewOrder() -> T? {
        if order.isEmpty == false
        {
        let workOrder = order[0]
        order.removeFirst()
        return workOrder
        }
        return nil
    }
    
    mutating func sortOrder(mass: [T]) {}
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


var OrderStack = newOrder<processingQueue>()
OrderStack.pushNewOreder(processingQueue(preoriti: .hight))
OrderStack.pushNewOreder(processingQueue(preoriti: .low))

OrderStack.

OrderStack.popNewOrder() != nil ? print(OrderStack.popNewOrder()!.idOreder) : print("заказов нет")


 

