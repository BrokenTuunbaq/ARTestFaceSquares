import UIKit
import AVFoundation

class EnterViewController: UIViewController {

    @IBOutlet weak var cameraPermissionButton: UIButton!
    
    @IBAction func cameraPermissionPressed(_ sender: Any) {
        checkCameraAccess()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func checkCameraAccess() {
        if AVCaptureDevice.authorizationStatus(for: .video) == .authorized {
            self.performSegue(withIdentifier: "EnterToInstructionSegue", sender: nil)
        } else {
            AVCaptureDevice.requestAccess(for: .video, completionHandler: {
                (granted: Bool) in
                if granted {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "EnterToInstructionSegue", sender: nil)
                    }
                } else {
                    self.presentCameraSettings()
                }
            })
        }
    }
        
    func presentCameraSettings() {
        let alertController = UIAlertController(title: "Разрешить приложению «LOVELY» доступ к камере", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Разрешить", style: .cancel, handler: { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: { _ in
                })
            }
        }))
        alertController.addAction(UIAlertAction(title: "Не разрешать", style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
}
