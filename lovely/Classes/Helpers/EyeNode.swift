import Foundation
import ARKit
//SIMD3 numbers are internal Apple vectors of face parts - magic numbers
class EyeNode {
    func leftEyeCreate() -> FaceNode {
        let leftEyeNode = FaceNode()
        leftEyeNode.name = "leftEye"
        leftEyeNode.rotation = SCNVector4(0, 1, 0, GLKMathDegreesToRadians(180.0))
        leftEyeNode.geometry?.materials.first?.diffuse.contents = UIImage(named: "LovelyLogo")
        leftEyeNode.scale = SCNVector3(0.5, 0.5, 0.5)
        leftEyeNode.updatePosition(for: [SIMD3(0.030883406, 0.02676856, 0.03826298)])
        return leftEyeNode
    }
    
    func rightEyeCreate() -> FaceNode {
        let rightEyeNode = FaceNode()
        rightEyeNode.name = "rightEye"
        rightEyeNode.rotation = SCNVector4(0, 1, 0, GLKMathDegreesToRadians(180.0))
        rightEyeNode.geometry?.materials.first?.diffuse.contents = UIImage(named: "LovelyLogo")
        rightEyeNode.scale = SCNVector3(0.5, 0.5, 0.5)
        rightEyeNode.updatePosition(for: [SIMD3(-0.030883406, 0.02676856, 0.03826298)])
        return rightEyeNode
    }
}
