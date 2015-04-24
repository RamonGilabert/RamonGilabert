import UIKit

class RGWebViewController: UIViewController {

    let transitionManager = CustomVideoTransition()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.transitioningDelegate = self.transitionManager
    }
}
