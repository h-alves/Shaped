import SwiftUI
import SpriteKit
import Foundation
import AVFoundation

class SquareScene: SKScene, SKPhysicsContactDelegate{
    weak var gameManager: GameManager?
    
    var zTop: CGFloat = 1
    
    var background: SKSpriteNode!
    var arty: SKSpriteNode!
    var balloon: SKSpriteNode!
    
    var shape: CGFloat = 24
    
    var lock = true
    
    override func didMove(to view: SKView){
        background = SKSpriteNode(imageNamed: "backgroundSquare")
        
        background.size = CGSize (width: frame.maxX, height: frame.maxY)
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        
        self.addChild(background)
        
        arty = SKSpriteNode(imageNamed: "abstractQ3medium")
        
        arty.size = CGSize(width: frame.width * 0.14, height: frame.height * 0.19)
        arty.setScale(1.0)
        arty.position = CGPointMake(CGRectGetMidX(self.frame) + frame.width * 0.015, CGRectGetMidY(self.frame) - frame.height * 0.08)
        arty.zPosition = zTop
        zTop += 1
        
        self.addChild(arty)
        
        arty.run(.sequence([
            .wait(forDuration: 2)
        ]),completion: {
            self.arty.setScale(1.0)
            self.arty.size = CGSize(width: self.frame.width * 0.15, height: self.frame.height * 0.22)
            self.arty.position = CGPointMake(CGRectGetMidX(self.frame) + self.frame.width * 0.015, CGRectGetMidY(self.frame) - self.frame.height * 0.07)
            self.arty.texture = SKTexture(imageNamed: "abstractQ2medium")
            self.arty.run(.sequence([
                .wait(forDuration: 1)
            ]),completion: {
                self.balloon = SKSpriteNode(imageNamed: "balloonGoBackSq")
                self.balloon.setScale(1.0)
                self.balloon.size = CGSize(width: self.frame.width * 0.67, height: self.frame.height * 0.32)
                self.balloon.position = CGPointMake(CGRectGetMidX(self.frame) + self.frame.width * 0.014, CGRectGetMidY(self.frame) + self.frame.height * 0.19)
                self.balloon.zPosition = self.zTop
                self.zTop += 1
                
                self.addChild(self.balloon)
                
                self.lock = false
                
                self.balloon.run(.sequence([
                    .wait(forDuration: 4),
                    .removeFromParent()
                ]),completion: {
                    self.goBack()
                })
            })
        })
    }
    
    func goBack(){
        let timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            print(self.shape)
            if self.shape > 32{
                self.shape = 32
            }else if self.shape <= 32 && self.shape > 24{
                self.shape -= 8
                self.arty.setScale(1.0)
                self.arty.size = CGSize(width: self.frame.width * 0.14, height: self.frame.height * 0.19)
                self.arty.position = CGPointMake(CGRectGetMidX(self.frame) + self.frame.width * 0.015, CGRectGetMidY(self.frame) - self.frame.height * 0.08)
                self.arty.texture = SKTexture(imageNamed: "abstractQ3medium")
            }else if self.shape <= 24 && self.shape > 16{
                self.shape -= 6
                self.arty.setScale(1.0)
                self.arty.size = CGSize(width: self.frame.width * 0.15, height: self.frame.height * 0.22)
                self.arty.position = CGPointMake(CGRectGetMidX(self.frame) + self.frame.width * 0.015, CGRectGetMidY(self.frame) - self.frame.height * 0.07)
                self.arty.texture = SKTexture(imageNamed: "abstractQ2medium")
            }else if self.shape <= 16 && self.shape > 8{
                self.shape -= 4
                self.arty.setScale(1.0)
                self.arty.size = CGSize(width: self.frame.width * 0.16, height: self.frame.height * 0.22)
                self.arty.position = CGPointMake(CGRectGetMidX(self.frame) + self.frame.width * 0.018, CGRectGetMidY(self.frame) - self.frame.height * 0.07)
                self.arty.texture = SKTexture(imageNamed: "abstractQ1medium")
            }else if self.shape <= 8 && self.shape >= 0{
                self.shape -= 4
                self.arty.setScale(1.0)
                self.arty.size = CGSize(width: self.frame.width * 0.14, height: self.frame.height * 0.21)
                self.arty.position = CGPointMake(CGRectGetMidX(self.frame) + self.frame.width * 0.017, CGRectGetMidY(self.frame) - self.frame.height * 0.08)
                self.arty.texture = SKTexture(imageNamed: "abstractMedium")
            }else if self.shape <= 0{
                timer.invalidate()
                self.lock = true
                self.sad()
            }
        }
    }
    
    func sad(){
        //Arty percebe que não pode se forçar a ser um quadrado e os triangulos ficam bravos
        balloon = SKSpriteNode(imageNamed: "balloonSadSq")
        balloon.setScale(1.0)
        balloon.size = CGSize(width: frame.width * 0.47, height: frame.height * 0.22)
        balloon.position = CGPointMake(CGRectGetMidX(self.frame) - frame.width * 0.059, CGRectGetMidY(self.frame) + frame.height * 0.15)
        balloon.zPosition = zTop
        zTop += 1
        
        self.addChild(balloon)
        
        balloon.run(.sequence([
            .wait(forDuration: 3),
            .removeFromParent()
        ]),completion: {
            self.background.texture = SKTexture(imageNamed: "backgroundSquareAngry")
            self.background.run(.sequence([
                .wait(forDuration: 3)
            ]),completion: {
                self.gameManager?.angrySq()
            })
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let clickZoomIn = SKAction.scale(to: 0.8, duration: 0.1)
        let clickZoomOut = SKAction.scale(to: 1.0, duration: 0.1)
        let clickZoom = SKAction.sequence([clickZoomIn, clickZoomOut])

        guard let touch = touches.first else { return }
            
        let location = touch.location(in: self)
            
        if arty.contains(location) && lock == false{
            run(.sequence([
                .wait(forDuration: 1)
            ]),completion: {
                self.shape += 1
                if self.shape >= 32{
                    self.shape = 32
                }
            })
            self.arty.run(clickZoom)
        }
    }
}
