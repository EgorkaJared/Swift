//
//  SnakeHead2.swift
//  Lesson8
//
//  Created by Егор Ненастьев on 09.06.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import UIKit

class SnakeHead2: SnakeBodyPart {
    override init(atPoint point: CGPoint){
        super.init(atPoint:point)
// категория - голова
        self.physicsBody?.categoryBitMask = CollisionCategories.SnakeHead2
// пересекается с телом, яблоком и границей экрана
        self.physicsBody?.contactTestBitMask = CollisionCategories.EdgeBody | CollisionCategories.Apple 
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
