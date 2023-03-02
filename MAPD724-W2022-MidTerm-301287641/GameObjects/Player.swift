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
