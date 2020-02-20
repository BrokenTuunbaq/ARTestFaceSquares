import UIKit

class StoredImageViewController: UIViewController {

    @IBOutlet weak var storedImageView: UIImageView!
    var storedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let storedImage = storedImage else {
            return
        }
        storedImageView.image = storedImage
    }
}
