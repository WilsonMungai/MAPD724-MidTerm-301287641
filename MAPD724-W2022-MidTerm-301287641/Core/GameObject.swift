//
//  GameObject.swift
//  MAPD724-W2022-MidTerm-301287641
//
//  Created by Wilson Mungai on 2023-03-01.
//

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
