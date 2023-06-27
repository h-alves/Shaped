import SwiftUI
import SpriteKit
import Foundation
import AVFoundation

class DragginScene: SKScene, SKPhysicsContactDelegate{
    weak var gameManager: GameManager?
    
    var dragging: SKSpriteNode!
    var zTop: CGFloat = 1
    
    var arty = SKSpriteNode()
    var sombra = SKSpriteNode()
    
    var shape = 0
    
    var lock = false
    
    var squares = SKSpriteNode()
    var triangles = SKSpriteNode()
    
    var angrySq = false
    var angryTr = false
    
    var pathSq = SKSpriteNode()
    var pathTr = SKSpriteNode()
    
    var balloon = SKSpriteNode()
    var balloonChange = SKSpriteNode()
    var balloonQ = SKSpriteNode()
    var balloonT = SKSpriteNode()
    
    var buttonChange = SKSpriteNode()
    var change = 0
    
    override func didMove(to view: SKView){
        removeAllChildren()
        
        let background = SKSpriteNode(imageNamed: "isleBackground")
        
        background.size = CGSize (width: self.size.width, height: self.size.height)
        background.anchorPoint = CGPoint(x: 0, y: 0)
        
        self.addChild(background)
        
        //Square group
        
        if angrySq == false{
            squares = SKSpriteNode(imageNamed: "squares")
        }else{
            squares = SKSpriteNode(imageNamed: "squaresAngry")
        }
        
        squares.setScale(1.0)
        squares.size = CGSize (width: frame.width * 0.13, height: frame.height * 0.1)
        squares.position = CGPointMake(frame.width * 0.71, frame.height * 0.82)
        
        squares.zPosition = zTop
        zTop += 1
        
        self.addChild(squares)
        
        if angrySq == false{
            pathSq = SKSpriteNode(imageNamed: "caminhoQ")
            
            pathSq.setScale(1.0)
            pathSq.size = CGSize (width: frame.width * 0.16, height: frame.height * 0.26)
            pathSq.position = CGPointMake(frame.width * 0.61, frame.height * 0.64)
            
            self.addChild(pathSq)
        }
        
        //Triangle group
        
        if angryTr == false{
            triangles = SKSpriteNode(imageNamed: "triangles")
        }else{
            triangles = SKSpriteNode(imageNamed: "trianglesAngry")
        }
        
        triangles.setScale(1.0)
        triangles.size = CGSize (width: frame.width * 0.1, height: frame.height * 0.12)
        triangles.position = CGPointMake(frame.width * 0.3, frame.height * 0.275)
        
        triangles.zPosition = zTop
        zTop += 1
        
        self.addChild(triangles)
        
        if angryTr == false{
            pathTr = SKSpriteNode(imageNamed: "caminhoT")
            
            pathTr.setScale(1.0)
            pathTr.size = CGSize(width: frame.width * 0.13, height: frame.height * 0.2)
            pathTr.position = CGPointMake(frame.width * 0.42, frame.height * 0.37)
            
            self.addChild(pathTr)
        }
        
        sombra = SKSpriteNode(imageNamed: "sombra")
        
        sombra.setScale(1.0)
        sombra.size = CGSize(width: frame.width * 0.08, height: frame.height * 0.04)
        sombra.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - frame.height * 0.01)
        
        sombra.zPosition = zTop
        zTop += 1
        
        self.addChild(sombra)
        
        //Main character
        
        arty = SKSpriteNode(imageNamed: "abstract")
        
        arty.setScale(1.0)
        arty.size = CGSize(width: frame.width * 0.06, height: frame.height * 0.09)
        arty.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + frame.height * 0.03)
        
        arty.zPosition = zTop
        zTop += 1
        
        self.addChild(arty)
        
        if angrySq == false && angryTr == false{
            let text = SKSpriteNode(imageNamed: "textDraggin")
            
            text.setScale(1.0)
            text.size = CGSize(width: frame.width * 0.45, height: frame.height * 0.18)
            text.position = CGPointMake(CGRectGetMidX(self.frame) - frame.width * 0.21, frame.height * 0.84)
            text.zPosition = zTop
            zTop += 1
            
            self.addChild(text)
            
        }else if angrySq == true && angryTr == true{
            self.gameManager?.goToScene(.endingScene)
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if arty.contains(pos) && lock == false{
            dragging = arty
            arty.setScale(1.2)
            arty.zPosition = zTop
            zTop += 1
            
            sombra.run(.sequence([
                .removeFromParent()
            ]))
        }else if buttonChange.contains(pos){
            if change == 1{
                buttonChange.run(.sequence([
                    .wait(forDuration: 0.05)
                ]),completion: {
                    self.buttonChange.size.height = self.frame.height * 0.133
                    self.buttonChange.texture = SKTexture(imageNamed: "buttonChangeQ2")
                    self.buttonChange.run(.sequence([
                        .wait(forDuration: 0.05)
                    ]),completion: {
                        self.buttonChange.size.height = self.frame.height * 0.128
                        self.buttonChange.texture = SKTexture(imageNamed: "buttonChangeQ3")
                        self.buttonChange.run(.sequence([
                            .wait(forDuration: 0.05)
                        ]),completion: {
                            self.buttonChange.size.height = self.frame.height * 0.122
                            self.buttonChange.texture = SKTexture(imageNamed: "buttonChangeQ4")
                            self.buttonChange.run(.sequence([
                                .wait(forDuration: 0.05)
                            ]),completion: {
                                self.buttonChange.size.height = self.frame.height * 0.128
                                self.buttonChange.texture = SKTexture(imageNamed: "buttonChangeQ3")
                                self.buttonChange.run(.sequence([
                                    .wait(forDuration: 0.05)
                                ]),completion: {
                                    self.buttonChange.size.height = self.frame.height * 0.133
                                    self.buttonChange.texture = SKTexture(imageNamed: "buttonChangeQ2")
                                    self.buttonChange.run(.sequence([
                                        .wait(forDuration: 0.05)
                                    ]),completion: {
                                        self.buttonChange.size.height = self.frame.height * 0.14
                                        self.buttonChange.texture = SKTexture(imageNamed: "buttonChangeQ1")
                                        self.gameManager?.goToScene(.changeQScene)
                                    })
                                })
                            })
                        })
                    })
                })
                
            }else if change == 2{
                buttonChange.run(.sequence([
                    .wait(forDuration: 0.05)
                ]),completion: {
                    self.buttonChange.size.height = self.frame.height * 0.133
                    self.buttonChange.texture = SKTexture(imageNamed: "buttonChangeT2")
                    self.buttonChange.run(.sequence([
                        .wait(forDuration: 0.05)
                    ]),completion: {
                        self.buttonChange.size.height = self.frame.height * 0.128
                        self.buttonChange.texture = SKTexture(imageNamed: "buttonChangeT3")
                        self.buttonChange.run(.sequence([
                            .wait(forDuration: 0.05)
                        ]),completion: {
                            self.buttonChange.size.height = self.frame.height * 0.122
                            self.buttonChange.texture = SKTexture(imageNamed: "buttonChangeT4")
                            self.buttonChange.run(.sequence([
                                .wait(forDuration: 0.05)
                            ]),completion: {
                                self.buttonChange.size.height = self.frame.height * 0.128
                                self.buttonChange.texture = SKTexture(imageNamed: "buttonChangeT3")
                                self.buttonChange.run(.sequence([
                                    .wait(forDuration: 0.05)
                                ]),completion: {
                                    self.buttonChange.size.height = self.frame.height * 0.133
                                    self.buttonChange.texture = SKTexture(imageNamed: "buttonChangeT2")
                                    self.buttonChange.run(.sequence([
                                        .wait(forDuration: 0.05)
                                    ]),completion: {
                                        self.buttonChange.size.height = self.frame.height * 0.14
                                        self.buttonChange.texture = SKTexture(imageNamed: "buttonChangeT1")
                                        self.gameManager?.goToScene(.changeTScene)
                                    })
                                })
                            })
                        })
                    })
                })
            }
        }
    }

    func touchMoved(toPoint pos : CGPoint) {
        if dragging != nil {
            dragging.position = pos
        }
    }

    func touchUp(atPoint pos : CGPoint) {
        if dragging != nil {
            dragging.setScale(1.0)
            
            sombra = SKSpriteNode(imageNamed: "sombra")
            
            sombra.setScale(1.0)
            sombra.size = CGSize(width: frame.width * 0.08, height: frame.height * 0.04)
            sombra.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - frame.height * 0.01)
            
            self.addChild(sombra)
            
            if dragging.position != CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + frame.height * 0.03){
                if squares.contains(pos){
                    buttonChange.run(.sequence([.removeFromParent()]))
                    balloon.run(.sequence([.removeFromParent()]))
                    balloonQ.run(.sequence([.removeFromParent()]))
                    balloonT.run(.sequence([.removeFromParent()]))
                    balloonChange.run(.sequence([.removeFromParent()]))
                    
                    dragging.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + frame.height * 0.03)
                    arty.zPosition = zTop
                    zTop += 1
                    
                    lock = true
                    balloon = SKSpriteNode(imageNamed: "balloonNo")
                    balloon.size = CGSize(width: frame.width * 0.22, height: frame.height * 0.14)
                    balloon.position = CGPointMake(frame.width * 0.62, frame.height * 0.87)
                    balloon.setScale(0.4)
                    balloon.zPosition = zTop
                    zTop += 1
                    
                    self.addChild(balloon)
                    
                    if angrySq == false{
                        balloon.run(.sequence([
                            .wait(forDuration: 1)
                        ]),completion: {
                            self.balloonQ = SKSpriteNode(imageNamed: "balloonQ")
                            self.balloonQ.size = CGSize(width: self.frame.width * 0.22, height: self.frame.height * 0.14)
                            self.balloonQ.position = CGPointMake(self.frame.width * 0.8, self.frame.height * 0.87)
                            self.balloonQ.setScale(0.4)
                            self.balloonQ.zPosition = self.zTop
                            self.zTop += 1
                            
                            self.addChild(self.balloonQ)
                            
                            self.balloonQ.run(.sequence([
                                .wait(forDuration: 1)
                            ]),completion: {
                                self.balloonChange = SKSpriteNode(imageNamed: "balloonChangeQ")
                                self.balloonChange.size = CGSize(width: self.frame.width * 0.26, height: self.frame.height * 0.14)
                                self.balloonChange.position = CGPointMake(CGRectGetMidX(self.frame) + self.frame.width * 0.07, CGRectGetMidY(self.frame) + self.frame.height * 0.09)
                                self.balloonChange.setScale(0.4)
                                self.balloonChange.zPosition = self.zTop
                                self.zTop += 1
                                
                                self.addChild(self.balloonChange)
                                
                                self.balloonChange.run(.sequence([
                                    .wait(forDuration: 2)
                                ]),completion: {
                                    self.change = 1
                                    self.buttonChange = SKSpriteNode(imageNamed: "buttonChangeQ1")
                                    self.buttonChange.size = CGSize(width: self.frame.width * 0.26, height: self.frame.height * 0.14)
                                    self.buttonChange.position = CGPointMake(self.frame.width * 0.84, self.frame.height * 0.1)
                                    self.buttonChange.setScale(1.0)
                                    self.buttonChange.zPosition = self.zTop
                                    self.zTop += 1
                                    
                                    self.addChild(self.buttonChange)
                                    
                                    self.lock = false
                                })
                            })
                        })
                    }else{
                        balloon.run(.sequence([
                            .wait(forDuration: 1)
                        ]),completion: {
                            self.lock = false
                        })
                    }
                }else if triangles.contains(pos){
                    buttonChange.run(.sequence([.removeFromParent()]))
                    balloon.run(.sequence([.removeFromParent()]))
                    balloonQ.run(.sequence([.removeFromParent()]))
                    balloonT.run(.sequence([.removeFromParent()]))
                    balloonChange.run(.sequence([.removeFromParent()]))
                    
                    dragging.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + frame.height * 0.03)
                    lock = true
                    
                    balloon = SKSpriteNode(imageNamed: "balloonNo")
                    balloon.size = CGSize(width: frame.width * 0.22, height: frame.height * 0.14)
                    balloon.position = CGPointMake(frame.width * 0.21, frame.height * 0.33)
                    balloon.setScale(0.4)
                    balloon.zPosition = zTop
                    zTop += 1
                    
                    self.addChild(balloon)
                    
                    if angryTr == false{
                        balloon.run(.sequence([
                            .wait(forDuration: 1)
                        ]),completion: {
                            self.balloonT = SKSpriteNode(imageNamed: "balloonT")
                            self.balloonT.size = CGSize(width: self.frame.width * 0.22, height: self.frame.height * 0.14)
                            self.balloonT.position = CGPointMake(self.frame.width * 0.38, self.frame.height * 0.33)
                            self.balloonT.setScale(0.4)
                            self.balloonT.zPosition = self.zTop
                            self.zTop += 1
                            
                            self.addChild(self.balloonT)
                            
                            self.balloonT.run(.sequence([
                                .wait(forDuration: 1)
                            ]),completion: {
                                self.balloonChange = SKSpriteNode(imageNamed: "balloonChangeT")
                                self.balloonChange.size = CGSize(width: self.frame.width * 0.26, height: self.frame.height * 0.14)
                                self.balloonChange.position = CGPointMake(CGRectGetMidX(self.frame) + self.frame.width * 0.07, CGRectGetMidY(self.frame) + self.frame.height * 0.09)
                                self.balloonChange.setScale(0.4)
                                self.balloonChange.zPosition = self.zTop
                                self.zTop += 1
                                
                                self.addChild(self.balloonChange)
                                
                                self.balloonChange.run(.sequence([
                                    .wait(forDuration: 2)
                                ])) {
                                    self.change = 2
                                    self.buttonChange = SKSpriteNode(imageNamed: "buttonChangeT1")
                                    self.buttonChange.size = CGSize(width: self.frame.width * 0.26, height: self.frame.height * 0.14)
                                    self.buttonChange.position = CGPointMake(self.frame.width * 0.84, self.frame.height * 0.1)
                                    self.buttonChange.setScale(1.0)
                                    self.buttonChange.zPosition = self.zTop
                                    self.zTop += 1
                                    
                                    self.addChild(self.buttonChange)
                                    
                                    self.lock = false
                                }
                            })
                        })
                    }else{
                        balloon.run(.sequence([
                            .wait(forDuration: 1)
                        ]),completion: {
                            self.lock = false
                        })
                    }
                }else{
                    //Tremer o personagem (feedback de lugar invalido)
                    dragging.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + frame.height * 0.03)
                }
            }
            dragging = nil
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchDown(atPoint: t.location(in: self))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchMoved(toPoint: t.location(in: self))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchUp(atPoint: t.location(in: self))
        }
    }
}
