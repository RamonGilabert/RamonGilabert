import UIKit

class RGMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let blurrEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurrView = UIVisualEffectView(effect: blurrEffect)
        blurrView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight)
        self.view.addSubview(blurrView)

        self.view.alpha = 0.5
    }
}
