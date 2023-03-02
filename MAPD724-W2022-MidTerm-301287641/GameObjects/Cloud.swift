/*
 
 MAPD 724 Mail Pilot
 
 Mid Term Test
 
 Muguthi, Wilson Mungai / Student Number: 301287641
 
 A game built with SpriteKit and UIKit. A game plane where the player has to control a plane to maneuver over islands to acuumulate points. The player has to avoid colliding with clouds which results in losing lives. The player has 5 lives. There are three scenes; start scene, game over scene, and game over scene.
 
 Version 1
 
 Last modified: 02/March/2023
 
 */

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

