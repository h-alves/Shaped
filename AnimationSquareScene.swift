import SwiftUI
import SpriteKit
import Foundation
import AVFoundation

class AnimationSquareScene: SKScene, SKPhysicsContactDelegate{
    weak var gameManager: GameManager?
    
    var background: SKSpriteNode!
    var sequence = 1
    
    override func didMove(to view: SKView){
        background = SKSpriteNode(imageNamed: "animationQ1")
        
        background.size = CGSize (width: frame.maxX, height: frame.maxY)
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        
        self.addChild(background)
        
        background.run(.sequence([
            .wait(forDuration: 0.3)
        ]),completion: {
            self.background.texture = SKTexture(imageNamed: "animationQ2")
            self.background.run(.sequence([
                .wait(forDuration: 0.3)
            ]),completion: {
                self.background.texture = SKTexture(imageNamed: "animationQ3")
                self.background.run(.sequence([
                    .wait(forDuration: 0.3)
                ]),completion: {
                    self.background.texture = SKTexture(imageNamed: "animationQ4")
                    self.background.run(.sequence([
                        .wait(forDuration: 0.3)
                    ]),completion: {
                        self.background.texture = SKTexture(imageNamed: "animationQ5")
                        self.background.run(.sequence([
                            .wait(forDuration: 0.3)
                        ]),completion: {
                            self.background.texture = SKTexture(imageNamed: "animationQ6")
                            self.background.run(.sequence([
                                .wait(forDuration: 0.3)
                            ]),completion: {
                                self.background.texture = SKTexture(imageNamed: "animationQ7")
                                self.background.run(.sequence([
                                    .wait(forDuration: 0.3)
                                ]),completion: {
                                    self.background.texture = SKTexture(imageNamed: "animationQ8")
                                    self.background.run(.sequence([
                                        .wait(forDuration: 0.3)
                                    ]),completion: {
                                        self.background.texture = SKTexture(imageNamed: "animationQ9")
                                        self.background.run(.sequence([
                                            .wait(forDuration: 0.3)
                                        ]),completion: {
                                            self.background.texture = SKTexture(imageNamed: "animationQ10")
                                            self.background.run(.sequence([
                                                .wait(forDuration: 0.3)
                                            ]),completion: {
                                                self.background.texture = SKTexture(imageNamed: "animationQ11")
                                                self.background.run(.sequence([
                                                    .wait(forDuration: 0.6)
                                                ]),completion: {
                                                    self.gameManager?.goToScene(.squareScene)
                                                })
                                            })
                                        })
                                    })
                                })
                            })
                        })
                    })
                })
            })
        })
    }
}
