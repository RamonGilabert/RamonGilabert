import UIKit

class RGStoryViewController: UIViewController {

    let viewModel = ViewModel()
    var scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView = self.viewModel.initChildScrollViewsInView(self.view)
        self.scrollView.backgroundColor = UIColor.redColor()
        var backgroundImageView = UIImageView(image: UIImage(named: "background-image-menu-simulator"))
        backgroundImageView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight)
        backgroundImageView.contentMode = UIViewContentMode.ScaleAspectFill
        self.scrollView.addSubview(backgroundImageView)
    }
}
