import Foundation
import ARKit

extension ARSceneViewController: ARSCNViewDelegate {
  
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let _ = anchor as? ARFaceAnchor,
          let device = cameraSceneView.device else {
          return nil
        }
        let faceGeometry = ARSCNFaceGeometry(device: device)
        let node = SCNNode(geometry: faceGeometry)
        node.geometry?.firstMaterial?.fillMode = .lines

        let leftEyeNode = EyeNode().leftEyeCreate()
        node.addChildNode(leftEyeNode)
        
        let rightEyeNode = EyeNode().rightEyeCreate()
        node.addChildNode(rightEyeNode)
        return node
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor,
        let faceGeometry = node.geometry as? ARSCNFaceGeometry else {
          return
        }
        faceGeometry.update(from: faceAnchor.geometry)
    }
}
