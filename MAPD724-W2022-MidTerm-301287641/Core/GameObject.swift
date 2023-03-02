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

class GameObject: SKSpriteNode, GameProtocol
{
    // public instance members
    // item horizontal speed
    var horizontalSpeed: CGFloat?
    // item vertical speed
    var verticalSpeed: CGFloat?
    // item width
    var width: CGFloat?
    // item height
    var height: CGFloat?
    // item
    var halfWidth: CGFloat?
    var halfHeight: CGFloat?
    // item scale
    var scale: CGFloat?
    // collision
    var isColliding: Bool?
    // random position generator
    var randomSource: GKARC4RandomSource?
    var randomDist: GKRandomDistribution?
    
    // Constructor / Initializer
    init(imageString: String, initialScale: CGFloat)
    {
        // initialize the game object with an image
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: texture.size())
        
        // configuration
        scale = initialScale
        setScale(scale!)
        // if scale is 2, multiply the texture width by 2
        width = texture.size().width * scale!
        // if scale is 2, multiply the texture height by 2
        height = texture.size().height * scale!
        halfWidth = width! * 0.5
        halfHeight = height! * 0.5
        isColliding = false
        name = imageString
        randomSource = GKARC4RandomSource()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError( )
    }
    
    // LifeCycle Functions
    func Start()
    {
        
    }
    
    func Update()
    {
        
    }
    
    func CheckBounds()
    {
        
    }
    
    func Reset()
    {
        
    }
  
}
