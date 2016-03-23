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
    let game:GameScene = GameScene(fileNamed: "GameScene")!
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches{
            let touchLocation = touch.locationInNode(self)
            let spaceship1 = SKSpriteNode(imageNamed: "spaceship1")
            let spaceship2 = SKSpriteNode(imageNamed: "spaceship2")
            let spaceship3 = SKSpriteNode(imageNamed: "spaceship3")
            let spaceship4 = SKSpriteNode(imageNamed: "spaceship4")

            if(spaceship1.containsPoint(touchLocation))
            {
                game.shipType = "Spaceship1"
            }
            if(spaceship2.containsPoint(touchLocation))
            {
                game.shipType = "Spaceship2"
            }
            if(spaceship3.containsPoint(touchLocation))
            {
                game.shipType = "Spaceship3"
            }
            if(spaceship4.containsPoint(touchLocation))
            {
                game.shipType = "Spaceship4"
            }
        }
        self.view?.presentScene(game, transition: SKTransition.fadeWithDuration(1))
    }
    
}
