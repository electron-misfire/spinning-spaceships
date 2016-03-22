//
//  GameViewController.swift
//  Canon Game
//
//  Created by Alexandra Haendel on 16/03/2016.
//  Copyright (c) 2016 Alexandra Haendel. All rights reserved.
//

import UIKit
import SpriteKit
import Social

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = GameScene(fileNamed:"startMenu") {
            // Configure the view.
            let skView = self.view as! SKView
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFit
            
            skView.presentScene(scene)
            let tap = UITapGestureRecognizer(target: self, action: "doubleTapped")
            tap.numberOfTapsRequired = 2
            view.addGestureRecognizer(tap)
            
            let tap3 = UITapGestureRecognizer(target: self, action: "tripleTapped")
            tap3.numberOfTapsRequired = 3
            view.addGestureRecognizer(tap3)
            //let tap4 = UITouch()
                }
            }
    func doubleTapped(){
        

        
        //Create the UIImage
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)


        
    }
    func tripleTapped(){
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let shareImageF = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let messageFB = "Look what I made on spinning spaceships!"
        print(messageFB)
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            let fbSheet = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            fbSheet.completionHandler = {
                result in
                switch result {
                case SLComposeViewControllerResult.Cancelled:
                    break
                case SLComposeViewControllerResult.Done:
                    break
                }
            }
            fbSheet.addImage(shareImageF)
            fbSheet.setInitialText("\(messageFB)")
            print(messageFB)
            self.presentViewController(fbSheet, animated: false, completion: {
            })
        }
        else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    


    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        //let sprite:SKSpriteNode
        viewDidLoad()
        
    }
    
}
