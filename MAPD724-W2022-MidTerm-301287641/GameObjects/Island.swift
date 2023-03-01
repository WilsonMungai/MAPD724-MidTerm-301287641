//
//  Island.swift
//  MAPD724-W2022-MidTerm-301287641
//
//  Created by Wilson Mungai on 2023-03-01.
//

import GameKit
import SpriteKit

class Island: GameObject {
    
    init() {
        super.init(imageString: "island", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func Start() {
        zPosition = Layer.island.rawValue
        verticalSpeed = 5.0
        Reset()
        
    }
    
    override func Update() {
        Move()
        CheckBounds()
    }
    
    func Move() {
//        guard let speed = verticalSpeed else { return }
        position.x -= verticalSpeed!
    }
    
    override func CheckBounds() {
        if(position.x <= -406) {
            Reset()
        }
    }
    
    override func Reset() {
        // reset positiom
        position.x = 406
        
        // random position
        let randomY: Int = (randomSource?.nextInt(upperBound: 300))! - 150
        position.y = CGFloat(randomY)
        isColliding = false
    }
}
