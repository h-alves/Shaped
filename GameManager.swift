import SwiftUI

class GameManager: ObservableObject {
    @Published var selectedScene: Scenes = .startScene
    
    lazy var dragginScene: DragginScene = {
        let scene = DragginScene(size: UIScreen.main.bounds.size)
        scene.scaleMode = .fill
        scene.gameManager = self
        return scene
    }()

    func goToScene(_ scene: Scenes) {
        selectedScene = scene
    }
    
    func angrySq(){
        self.dragginScene.angrySq = true
        selectedScene = .dragginScene
    }
    
    func angryTr(){
        self.dragginScene.angryTr = true
        selectedScene = .dragginScene
    }
    
    func resetGame(){
        self.dragginScene.angrySq = false
        self.dragginScene.angryTr = false
        
        selectedScene = .startScene
    }
}
