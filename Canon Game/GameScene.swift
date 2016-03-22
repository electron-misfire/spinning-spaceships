//
//  GameScene.swift
//  Canon Game
//
//  Created by Alexandra Haendel on 16/03/2016.
//  Copyright (c) 2016 Alexandra Haendel. All rights reserved.
//

import SpriteKit
import AVFoundation

class GameScene: SKScene {
    
    var myLabel : SKLabelNode!
    //let fadeTransit = SKTransition.fadeWithColor(duration: 2)
    var sprite:SKSpriteNode!
    let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.Alert)
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Click to add spinning spaceships!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        myLabel.removeFromParent()
        for touch in touches {
            let location = touch.locationInNode(self)
            
            sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.3
            sprite.yScale = 0.3
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.3
            sprite.yScale = 0.3
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
 
    func removeShips(redun: Bool){
        self.removeAllChildren()
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
