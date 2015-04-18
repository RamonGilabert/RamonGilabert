import UIKit

class RGMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        #if !TARGET_IPHONE_SIMULATOR
            var backgroundImageView = UIImageView(image: UIImage(named: "background-image-menu-simulator"))
            backgroundImageView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight)
            backgroundImageView.contentMode = UIViewContentMode.ScaleAspectFill
            self.view.addSubview(backgroundImageView)
        #endif
    }
}
