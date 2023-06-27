import SwiftUI
import SpriteKit
import Foundation
import AVFoundation

class AnimationTriangleScene: SKScene, SKPhysicsContactDelegate{
    weak var gameManager: GameManager?
    
    var background: SKSpriteNode!
    var sequence = 1
    
    override func didMove(to view: SKView){
        background = SKSpriteNode(imageNamed: "animationT1")
        
        background.size = CGSize (width: frame.maxX, height: frame.maxY)
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        
        self.addChild(background)
        
        background.run(.sequence([
            .wait(forDuration: 0.3)
        ]),completion: {
            self.background.texture = SKTexture(imageNamed: "animationT2")
            self.background.run(.sequence([
                .wait(forDuration: 0.3)
            ]),completion: {
                self.background.texture = SKTexture(imageNamed: "animationT3")
                self.background.run(.sequence([
                    .wait(forDuration: 0.3)
                ]),completion: {
                    self.background.texture = SKTexture(imageNamed: "animationT4")
                    self.background.run(.sequence([
                        .wait(forDuration: 0.3)
                    ]),completion: {
                        self.background.texture = SKTexture(imageNamed: "animationT5")
                        self.background.run(.sequence([
                            .wait(forDuration: 0.3)
                        ]),completion: {
                            self.background.texture = SKTexture(imageNamed: "animationT6")
                            self.background.run(.sequence([
                                .wait(forDuration: 0.3)
                            ]),completion: {
                                self.background.texture = SKTexture(imageNamed: "animationT7")
                                self.background.run(.sequence([
                                    .wait(forDuration: 0.3)
                                ]),completion: {
                                    self.background.texture = SKTexture(imageNamed: "animationT8")
                                    self.background.run(.sequence([
                                        .wait(forDuration: 0.3)
                                    ]),completion: {
                                        self.background.texture = SKTexture(imageNamed: "animationT9")
                                        self.background.run(.sequence([
                                            .wait(forDuration: 0.3)
                                        ]),completion: {
                                            self.background.texture = SKTexture(imageNamed: "animationT10")
                                            self.background.run(.sequence([
                                                .wait(forDuration: 0.3)
                                            ]),completion: {
                                                self.background.texture = SKTexture(imageNamed: "animationT11")
                                                self.background.run(.sequence([
                                                    .wait(forDuration: 0.6)
                                                ]),completion: {
                                                    self.gameManager?.goToScene(.triangleScene)
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
