//
//  main.swift
//  Lesson6
//
//  Created by Егор Ненастьев on 28.05.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import Foundation

var t: Int = 0

enum PreoritiOreder {
    case hight
    case middle
    case low
    }
    
enum StatusProcess{
    case new
    case work
    case done
        
    }

class processingQueue {     //очередб на обработку
    
    var idOreder: Int = t
    var preoriti: PreoritiOreder
    var statusProcessing: StatusProcess = .new
    
    init(preoriti: PreoritiOreder) {
        self.preoriti = preoriti
        t = t + 1
        
    }
        
}
struct newOrder {
    private var order : [processingQueue] = []
    mutating func pushNewOreder(_ newOrder: processingQueue){
        order.append(newOrder)
    }
    mutating func popNewOrde() -> processingQueue? {
        return order.removeFirst()
    }
}

class collectionQueue {  // очередь на сборку
}

class shipmentQueue { // очередь на отправку
}


var order = processingQueue(preoriti: .hight)
var order2 = processingQueue(preoriti: .low)
var order3 = processingQueue(preoriti: .hight)
var order4 = processingQueue(preoriti: .hight)

print(order.idOreder)
print(order2.idOreder)
print(order3.idOreder)

var newOrderStack = newOrder()

newOrderStack.pushNewOreder(order2)
newOrderStack.pushNewOreder(order)
newOrderStack.pushNewOreder(order3)

print(newOrderStack.popNewOrde()!)
