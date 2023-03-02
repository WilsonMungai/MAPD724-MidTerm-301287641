//
//  Player.swift
//  MAPD724-W2022-MidTerm-301287641
//
//  Created by Wilson Mungai on 2023-03-01.
//

import GameKit
import SpriteKit

class Player: GameObject {
    init() {
        super.init(imageString: "plane", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func Start() {
        zPosition = Layer.plane.rawValue
        rotation()
        Reset()
    }
    
    override func Update() {
        CheckBounds()
    }
    
    override func CheckBounds() {
        // constraint player at the top boundary
        if(position.y >= 140) {
            position.y = 140
        }
        
        // constraint player bottom
        if(position.y <= -140) {
            position.y = -140
        }
    }
    
    override func Reset() {
        position.x = -342
    }
    
    func TouchMove(newPos: CGPoint) {
        position = newPos
    }
    
    // rotate the object
    func rotation() {
        zRotation = CGFloat.pi / -2.0
    }
}
