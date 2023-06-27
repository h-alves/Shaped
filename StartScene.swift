import SwiftUI
import SpriteKit
import Foundation
import AVFoundation

class StartScene: SKScene{
    weak var gameManager: GameManager?
    
    var buttonChange: SKSpriteNode!
    
    override func didMove(to view: SKView){
        let background = SKSpriteNode(imageNamed: "backgroundStart")
        
        background.size = CGSize (width: frame.width, height: frame.height)
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        
        self.addChild(background)
        
        buttonChange = SKSpriteNode(imageNamed: "buttonStart1")
        buttonChange.size = CGSize(width: frame.width * 0.08, height: frame.height * 0.13)
        buttonChange.position = CGPoint(x: frame.midX, y: frame.midY - frame.height * 0.17)
        addChild(buttonChange)

        backgroundColor = .systemTeal
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        if buttonChange.contains(location) {
            buttonChange.run(.sequence([
                .wait(forDuration: 0.05)
            ]),completion: {
                self.buttonChange.size.height = self.frame.height * 0.12
                self.buttonChange.texture = SKTexture(imageNamed: "buttonStart2")
                self.buttonChange.run(.sequence([
                    .wait(forDuration: 0.05)
                ]),completion: {
                    self.buttonChange.size.height = self.frame.height * 0.12
                    self.buttonChange.texture = SKTexture(imageNamed: "buttonStart3")
                    self.buttonChange.run(.sequence([
                        .wait(forDuration: 0.05)
                    ]),completion: {
                        self.buttonChange.size.height = self.frame.height * 0.11
                        self.buttonChange.texture = SKTexture(imageNamed: "buttonStart4")
                        self.buttonChange.run(.sequence([
                            .wait(forDuration: 0.05)
                        ]),completion: {
                            self.buttonChange.size.height = self.frame.height * 0.12
                            self.buttonChange.texture = SKTexture(imageNamed: "buttonStart3")
                            self.buttonChange.run(.sequence([
                                .wait(forDuration: 0.05)
                            ]),completion: {
                                self.buttonChange.size.height = self.frame.height * 0.12
                                self.buttonChange.texture = SKTexture(imageNamed: "buttonStart2")
                                self.buttonChange.run(.sequence([
                                    .wait(forDuration: 0.05)
                                ]),completion: {
                                    self.buttonChange.size.height = self.frame.height * 0.13
                                    self.buttonChange.texture = SKTexture(imageNamed: "buttonStart1")
                                    self.gameManager?.goToScene(.introScene)
                                })
                            })
                        })
                    })
                })
            })
        }
    }
}
