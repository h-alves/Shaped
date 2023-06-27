import SwiftUI
import SpriteKit

struct ContentView: View {
    @StateObject var gameManager = GameManager()
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var body: some View {
        VStack{
            switch gameManager.selectedScene {
            case .startScene:
                SpriteView(scene: getStartScene())
            case .introScene:
                SpriteView(scene: getIntroScene())
            case .dragginScene:
                SpriteView(scene: gameManager.dragginScene)
            case .squareScene:
                SpriteView(scene: getSquareScene())
            case .triangleScene:
                SpriteView(scene: getTriangleScene())
            case .animationSquareScene:
                SpriteView(scene: getAnimationSquareScene())
            case .animationTriangleScene:
                SpriteView(scene: getAnimationTriangleScene())
            case .changeQScene:
                SpriteView(scene: getChangeQScene())
            case .changeTScene:
                SpriteView(scene: getChangeTScene())
            case .endingScene:
                SpriteView(scene: getEndingScene())
            }
        }
        .ignoresSafeArea()
    }
    
    func getStartScene() -> SKScene{
        let scene = StartScene(size: CGSize(width: width, height: height))
        scene.scaleMode = .fill
        scene.gameManager = gameManager
        return scene
    }
    
    func getIntroScene() -> SKScene{
        let scene = IntroScene(size: CGSize(width: width, height: height))
        scene.scaleMode = .fill
        scene.gameManager = gameManager
        return scene
    }
    
    func getDragginScene() -> SKScene{
        let scene = DragginScene(size: CGSize(width: width, height: height))
        scene.scaleMode = .fill
        scene.gameManager = gameManager
        return scene
    }
                           
    func getSquareScene() -> SKScene{
        let scene = SquareScene(size: CGSize(width: width, height: height))
        scene.scaleMode = .fill
        scene.gameManager = gameManager
        return scene
    }
    
    func getTriangleScene() -> SKScene{
        let scene = TriangleScene(size: CGSize(width: width, height: height))
        scene.scaleMode = .fill
        scene.gameManager = gameManager
        return scene
    }
    
    func getAnimationSquareScene() -> SKScene{
        let scene = AnimationSquareScene(size: CGSize(width: width, height: height))
        scene.scaleMode = .fill
        scene.gameManager = gameManager
        return scene
    }
    
    func getAnimationTriangleScene() -> SKScene{
        let scene = AnimationTriangleScene(size: CGSize(width: width, height: height))
        scene.scaleMode = .fill
        scene.gameManager = gameManager
        return scene
    }
    
    func getChangeQScene() -> SKScene{
        let scene = ChangeQScene(size: CGSize(width: width, height: height))
        scene.scaleMode = .fill
        scene.gameManager = gameManager
        return scene
    }
    
    func getChangeTScene() -> SKScene{
        let scene = ChangeTScene(size: CGSize(width: width, height: height))
        scene.scaleMode = .fill
        scene.gameManager = gameManager
        return scene
    }
    
    func getEndingScene() -> SKScene{
        let scene = EndingScene(size: CGSize(width: width, height: height))
        scene.scaleMode = .fill
        scene.gameManager = gameManager
        return scene
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
