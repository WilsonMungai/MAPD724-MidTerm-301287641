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
    var ocean1: Ocean?
    var ocean2: Ocean?
    var player: Player?
    
    override func sceneDidLoad() {
        name = "GAME"
        
        // add ocean1 to scene
        ocean1 = Ocean()
        ocean1?.Reset()
        addChild(ocean1!)
        
        // add ocean2 to scene
        ocean2 = Ocean()
        ocean2?.position.x = 270
        addChild(ocean2!)
        
        // add player to scene
        player = Player()
        player?.Reset()
        player?.zRotation = M_PI / -2.0
        addChild(player!)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: -342, y: pos.y))
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        player?.TouchMove(newPos:  CGPoint(x: -342, y: pos.y))
    }
    
    func touchUp(atPoint pos : CGPoint) {
        player?.TouchMove(newPos:  CGPoint(x: -342, y: pos.y))
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
        ocean1?.Update()
        ocean2?.Update()
        player?.Update()
    }
}
