//
//  GameScene.swift
//  MAPD724-W2022-MidTerm-301287641
//
//  Created by Wilson Mungai on 2023-03-01.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // varaibles
    var ocean: Ocean?
    
    
    override func sceneDidLoad() {
        name = "GAME"
        
        // add ocean to scene
        ocean = Ocean()
        ocean?.Reset()
        addChild(ocean!)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        print("Touch Down")
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        print("touch Move")
    }
    
    func touchUp(atPoint pos : CGPoint) {
        print("Touch Up")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        ocean?.Update()
    }
}
