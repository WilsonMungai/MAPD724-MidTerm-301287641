//
//  Cloud.swift
//  MAPD724-W2022-MidTerm-301287641
//
//  Created by Wilson Mungai on 2023-03-01.
//

import SpriteKit
import GameKit

class Cloud: GameObject {
    init() {
        super.init(imageString: "cloud", initialScale: 0.5)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func Start() {
        zPosition = Layer.cloud.rawValue
        verticalSpeed = 5.0
        // transparency
        alpha = 0.5
        Reset()
    }
    
    override func Update() {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds() {
        if(position.x <= -406) {
            Reset()
        }
    }
    
    override func Reset() {
        // vertical random speed
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0 // speed of 5 to 10
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 4.0 ) - 2.0 // speed of 2
        
        // random y position
        let randomY: Int = (randomSource?.nextInt(upperBound: 324))! - 162 // 162 to -162
        position.y = CGFloat(randomY)
        
        // random x position
        let randomX: Int = (randomSource?.nextInt(upperBound: 30))! + 430 // 430 to 460
        position.x = CGFloat(randomX)

        isColliding = false
    }
    
    func Move() {
//        guard let speed = verticalSpeed else { return }
        position.x -= verticalSpeed!
        position.y -= horizontalSpeed!
    }
}

