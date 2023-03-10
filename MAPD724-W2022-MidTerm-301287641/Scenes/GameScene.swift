/*
 
 MAPD 724 Mail Pilot
 
 Mid Term Test
 
 Muguthi, Wilson Mungai / Student Number: 301287641
 
 A game built with SpriteKit and UIKit. A game plane where the player has to control a plane to maneuver over islands to acuumulate points. The player has to avoid colliding with clouds which results in losing lives. The player has 5 lives. There are three scenes; start scene, game over scene, and game over scene.
 
 Version 1
 
 Last modified: 02/March/2023
 
 */

import SpriteKit
import GameplayKit
import AVFoundation
import UIKit

class GameScene: SKScene {
    
    // varaibles
    var ocean1: Ocean?
    var ocean2: Ocean?
    var player: Player?
    var island: Island?
    var clouds: [Cloud] = []
    
    override func sceneDidLoad() {
        name = "GAME"
        
        // add ocean1 to scene
        ocean1 = Ocean()
        ocean1?.Reset()
        addChild(ocean1!)
        
        // add ocean2 to scene
        ocean2 = Ocean()
        ocean2?.position.x = -705
        addChild(ocean2!)
        
        // add player to scene
        player = Player()
        addChild(player!)
        
        // add island to scene
        island = Island()
        addChild(island!)
        
        for _ in 0...1 {
            let cloud = Cloud()
            clouds.append(cloud)
            addChild(cloud)
        }
        
        // Engine Sound - Background noise / music
        let engineSound = SKAudioNode(fileNamed: "engine.mp3")
        addChild(engineSound)
        engineSound.autoplayLooped = true
        engineSound.run(SKAction.changeVolume(to: 0.5, duration: 0))

        // preload / prewarm impulse sounds
        do
        {
            let sounds: [String] = ["thunder", "yay"]
            for sound in sounds
            {
                let path: String = Bundle.main.path(forResource: sound, ofType: "mp3")!
                let url:URL = URL(fileURLWithPath: path)
                let avPlayer: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                avPlayer.prepareToPlay()
            }
        }
        catch
        {
            
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: -342, y: pos.y))
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        player?.TouchMove(newPos:  CGPoint(x: -342, y: pos.y))
    }
    
    func touchUp(atPoint pos : CGPoint) {
        player?.TouchMove(newPos:  CGPoint(x: -342, y: pos.y))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        ocean1?.Update()
        ocean2?.Update()
        player?.Update()
        island?.Update()
        
        CollisionManager.SquaredRadiusCheck(scene: self, object1: player!, object2: island!)
        
        // update each cloud in the clouds array
        for cloud in clouds {
            cloud.Update()
            CollisionManager.SquaredRadiusCheck(scene: self, object1: player!, object2: cloud)
        }

    }
}
