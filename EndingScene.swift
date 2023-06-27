import SwiftUI
import SpriteKit
import Foundation
import AVFoundation

class EndingScene: SKScene, SKPhysicsContactDelegate{
    weak var gameManager: GameManager?
    
    var background: SKSpriteNode!
    
    var contagem = 0
    
    override func didMove(to view: SKView){
        background = SKSpriteNode(imageNamed: "endingBackground1")
        
        background.size = CGSize (width: frame.maxX, height: frame.maxY)
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        
        self.addChild(background)
        
        background.run(.sequence([
            .wait(forDuration: 2)
        ]), completion: {
            self.background.texture = SKTexture(imageNamed: "endingBackground2")
            self.background.run(.sequence([
                .wait(forDuration: 0.5)
            ]), completion: {
                self.background.texture = SKTexture(imageNamed: "endingBackground3")
                self.background.run(.sequence([
                    .wait(forDuration: 0.5)
                ]), completion: {
                    self.background.texture = SKTexture(imageNamed: "endingBackground4")
                    self.background.run(.sequence([
                        .wait(forDuration: 0.5)
                    ]), completion: {
                        self.background.texture = SKTexture(imageNamed: "endingBackground5")
                        self.background.run(.sequence([
                            .wait(forDuration: 0.7)
                        ]), completion: {
                            self.background.texture = SKTexture(imageNamed: "endingBackground6")
                            self.background.run(.sequence([
                                .wait(forDuration: 0.7)
                            ]), completion: {
                                self.background.texture = SKTexture(imageNamed: "endingBackground7")
                                self.background.run(.sequence([
                                    .wait(forDuration: 0.7)
                                ]), completion: {
                                    self.background.texture = SKTexture(imageNamed: "endingBackground8")
                                    self.background.run(.sequence([
                                        .wait(forDuration: 0.7)
                                    ]), completion: {
                                        self.background.texture = SKTexture(imageNamed: "endingBackground9")
                                        self.background.run(.sequence([
                                            .wait(forDuration: 0.7)
                                        ]), completion: {
                                            self.background.texture = SKTexture(imageNamed: "endingBackground10")
                                            self.background.run(.sequence([
                                                .wait(forDuration: 0.7)
                                            ]), completion: {
                                                self.background.texture = SKTexture(imageNamed: "endingBackground11")
                                                self.background.run(.sequence([
                                                    .wait(forDuration: 2)
                                                ]), completion: {
                                                    self.background.texture = SKTexture(imageNamed: "endingBackground12")
                                                    self.background.run(.sequence([
                                                        .wait(forDuration: 2)
                                                    ]), completion: {
                                                        self.background.texture = SKTexture(imageNamed: "endingBackground13")
                                                        self.background.run(.sequence([
                                                            .wait(forDuration: 1.5)
                                                        ]), completion: {
                                                            self.background.texture = SKTexture(imageNamed: "endingBackground14")
                                                            self.background.run(.sequence([
                                                                .wait(forDuration: 2)
                                                            ]), completion: {
                                                                self.background.texture = SKTexture(imageNamed: "endingBackground15")
                                                                self.contagem = 15
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
                })
            })
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self)
        
        if background.contains(location) {
            contagem = contagem+1
            if(contagem == 16) {
                background.texture = SKTexture(imageNamed: "endingBackground16")
            }else if(contagem  == 17) {
                background.texture = SKTexture(imageNamed: "endingBackground17")
            }else if(contagem == 18) {
                gameManager?.resetGame()
            }
        }
    }
}
