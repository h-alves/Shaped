import SwiftUI
import SpriteKit
import Foundation
import AVFoundation

class IntroScene: SKScene, SKPhysicsContactDelegate{
    weak var gameManager: GameManager?
    
    var background: SKSpriteNode!
    var sequence = 1
    
    override func didMove(to view: SKView){
        background = SKSpriteNode(imageNamed: "intro1")
        
        background.size = CGSize (width: frame.maxX, height: frame.maxY)
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        
        self.addChild(background)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        if background.contains(location) {
            sequence += 1
            if sequence == 2{
                background.texture = SKTexture(imageNamed: "intro2")
            }else if sequence == 3{
                background.texture = SKTexture(imageNamed: "intro3")
            }else if sequence >= 4{
                gameManager?.goToScene(.dragginScene)
            }
        }
    }
}
