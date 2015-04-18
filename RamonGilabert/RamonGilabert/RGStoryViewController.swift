import UIKit

class RGStoryViewController: UIViewController {

    var scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView = UIScrollView(frame: CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight))
        self.scrollView.contentSize = CGSizeMake(Constant.Size.DeviceWidth, Constant.Size.DeviceHeight * 5)
        self.scrollView.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.scrollView)
    }
}
