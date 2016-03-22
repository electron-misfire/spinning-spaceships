//
//  startMenu.swift
//  Canon Game
//
//  Created by Alexandra Haendel on 17/03/2016.
//  Copyright © 2016 Alexandra Haendel. All rights reserved.
//

//import UIKit
import SpriteKit

class startMenu: SKScene {

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let game:GameScene = GameScene(fileNamed: "GameScene")!
        self.view?.presentScene(game, transition: SKTransition.fadeWithDuration(1))
    }
}
