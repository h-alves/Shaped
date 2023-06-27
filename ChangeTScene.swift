import SwiftUI
import SpriteKit
import Foundation
import AVFoundation

class ChangeTScene: SKScene, SKPhysicsContactDelegate{
    weak var gameManager: GameManager?
    
    var zTop: CGFloat = 1
    
    var arty: SKSpriteNode!
    
    var contagem = 0
    
    override func didMove(to view: SKView){
        let background = SKSpriteNode(imageNamed: "backgroundChange")
        
        background.size = CGSize (width: frame.maxX, height: frame.maxY)
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        
        self.addChild(background)
        
        arty = SKSpriteNode(imageNamed: "abstractBig")
        
        arty.setScale(1.0)
        arty.size = CGSize(width: frame.width * 0.22, height: frame.height * 0.33)
        arty.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        arty.zPosition = zTop
        zTop += 1
        
        self.addChild(arty)
        
        arty.run(.sequence([
            .wait(forDuration: 0.5)
        ]),completion: {
            let balloon = SKSpriteNode(imageNamed: "balloonClick")
            balloon.size = CGSize(width: self.frame.width * 0.83, height: self.frame.height * 0.26)
            balloon.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.height * 0.83)
            balloon.setScale(1.0)
            balloon.zPosition = self.zTop
            self.zTop += 1

            self.addChild(balloon)

            balloon.run(.sequence([
                .wait(forDuration: 3),
                .removeFromParent()
            ]))
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let clickZoomIn = SKAction.scale(to: 0.8, duration: 0.1)
        let clickZoomOut = SKAction.scale(to: 1.0, duration: 0.1)
        let clickZoom = SKAction.sequence([clickZoomIn, clickZoomOut])
        
        let location = touch.location(in: self)
        
        if arty.contains(location) {
            contagem = contagem+1
            self.arty.run(clickZoom)
            print("Clicou botao " + String(contagem))
            if(contagem >= 4 && contagem < 8) {
                arty.setScale(1.0)
                arty.size = CGSize(width: frame.width * 0.25, height: frame.height * 0.36)
                arty.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + self.frame.height * 0.02)
                arty.texture = SKTexture(imageNamed: "abstractT1")
            }else if(contagem >= 8 && contagem < 16) {
                arty.setScale(1.0)
                arty.texture = SKTexture(imageNamed: "abstractT2")
            }else if(contagem >= 16) {
                arty.setScale(1.0)
                arty.size = CGSize(width: frame.width * 0.23, height: frame.height * 0.37)
                arty.texture = SKTexture(imageNamed: "abstractT3")
                arty.run(.sequence([
                    .wait(forDuration: 1)
                ]),completion: {
                    
                    self.changeScene()
                })
            }
        }
    }
    
    func changeScene(){
        gameManager?.goToScene(.animationTriangleScene)
    }
}
