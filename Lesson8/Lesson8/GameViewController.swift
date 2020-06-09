//
//  GameViewController.swift
//  Lesson8
//
//  Created by Егор Ненастьев on 04.06.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
      let scene = GameScene(size: view.bounds.size)
          let skView = view as! SKView
          skView.showsFPS = true
          skView.showsNodeCount = true
          skView.ignoresSiblingOrder = true
          scene.scaleMode = .aspectFit
          skView.presentScene(scene)

    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
