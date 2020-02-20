import Foundation
import Photos

struct PhotoRequest {
    func photoRequest() -> Bool {
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .denied {
            return false
        }
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization( {
                status in
                if status == .authorized{
                } else {
                }
            })
        }
        return true
    }
}
