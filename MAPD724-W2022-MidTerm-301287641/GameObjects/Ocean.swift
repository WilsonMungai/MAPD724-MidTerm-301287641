//
//  Ocean.swift
//  MAPD724-W2022-MidTerm-301287641
//
//  Created by Wilson Mungai on 2023-03-01.
//

import GameplayKit
import SpriteKit

class Ocean: GameObject {
    // constructor / initializer
    init()
    {
        super.init(imageString: "ocean", initialScale: 1.5)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func Start() {
        zPosition = Layer.ocean.rawValue
        verticalSpeed = 5.0
        rotation()
    }
    
    override func Update() {
        Move()
        CheckBounds()
    }
    
    // change position on x axis
    func Move() {
        position.x -= verticalSpeed!
    }
    
    // check object position
    override func CheckBounds() {
        if(position.x <= -705) {
            Reset()
        }
    }
    
    // Reset object
    override func Reset() {
        position.x = 705
    }
    
    // rotate the object
    func rotation() {
        zRotation = CGFloat.pi / -2.0
    }
}
