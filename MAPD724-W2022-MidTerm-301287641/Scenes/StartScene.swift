/*
 
 MAPD 724 Mail Pilot
 
 Mid Term Test
 
 Muguthi, Wilson Mungai / Student Number: 301287641
 
 A game built with SpriteKit and UIKit. A game plane where the player has to control a plane to maneuver over islands to acuumulate points. The player has to avoid colliding with clouds which results in losing lives. The player has 5 lives. There are three scenes; start scene, game over scene, and game over scene.
 
 Version 1
 
 Last modified: 02/March/2023
 
 */
import SpriteKit
import GameplayKit
import AVFoundation
import UIKit

class StartScene: SKScene
{
    // instance variables
    var ocean1: Ocean?
    var ocean2: Ocean?
    
    override func sceneDidLoad()
    {
        name = "START"
        
        // add the first ocean to the Scene
        ocean1 = Ocean()
        ocean1?.Reset()
        addChild(ocean1!)
        
        // add the second ocean to the scene
        ocean2 = Ocean()
        ocean2?.position.x = -705
        addChild(ocean2!)
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        ocean1?.Update()
        ocean2?.Update()
    }
}

