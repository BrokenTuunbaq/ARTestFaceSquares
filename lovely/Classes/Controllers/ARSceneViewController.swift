import UIKit
import ARKit
import SceneKit
import Photos

class ARSceneViewController: UIViewController {
    
    @IBOutlet weak var captureButton: UIButton!
    @IBOutlet weak var cameraSceneView: ARSCNView!
    let config = ARFaceTrackingConfiguration()
    var storedImage: UIImage?
    let eyeOptions = ["EYE_IMAGE"]
    let features = ["leftEye", "rightEye"]
    let featureIndices = [[1064], [42]]//will be deleted
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config.isLightEstimationEnabled = true
        cameraSceneView.session.run(config)
        cameraSceneView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let storedImageController = segue.destination as! StoredImageViewController
        storedImageController.storedImage = storedImage
    }
    
    @IBAction func captureButtonPressed(_ sender: Any) {
        storedImage = cameraSceneView.snapshot()
    }
}
