import SwiftUI

enum Scenes: String, Identifiable, CaseIterable {
    case startScene, introScene, dragginScene, squareScene, triangleScene, animationSquareScene, animationTriangleScene, changeQScene, changeTScene, endingScene

    var id: String { self.rawValue }
}
