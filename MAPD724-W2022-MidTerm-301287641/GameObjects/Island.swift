/*
 
 MAPD 724 Mail Pilot
 
 Mid Term Test
 
 Muguthi, Wilson Mungai / Student Number: 301287641
 
 A game built with SpriteKit and UIKit. A game plane where the player has to control a plane to maneuver over islands to acuumulate points. The player has to avoid colliding with clouds which results in losing lives. The player has 5 lives. There are three scenes; start scene, game over scene, and game over scene.
 
 Version 1
 
 Last modified: 02/March/2023
 
 */

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
