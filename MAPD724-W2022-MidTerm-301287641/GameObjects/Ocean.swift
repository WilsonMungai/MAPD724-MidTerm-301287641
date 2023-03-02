/*
 
 MAPD 724 Mail Pilot
 
 Mid Term Test
 
 Muguthi, Wilson Mungai / Student Number: 301287641
 
 A game built with SpriteKit and UIKit. A game plane where the player has to control a plane to maneuver over islands to acuumulate points. The player has to avoid colliding with clouds which results in losing lives. The player has 5 lives. There are three scenes; start scene, game over scene, and game over scene.
 
 Version 1
 
 Last modified: 02/March/2023
 
 */

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
