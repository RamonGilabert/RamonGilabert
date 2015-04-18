import UIKit

struct Constant {
    struct Setup {
        static let NumberOfPagesScrolling = 3.0 as CGFloat
    }
}

class RGMainViewController: UIViewController {

    var scrollView = UIScrollView()
    let deviceWidth = UIScreen.mainScreen().bounds.width
    let deviceHeight = UIScreen.mainScreen().bounds.height

    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView = UIScrollView(frame: CGRectMake(0, 0, self.deviceWidth, self.deviceHeight))
        self.scrollView.contentSize = CGSizeMake(self.deviceWidth * Constant.Setup.NumberOfPagesScrolling, self.deviceHeight)
        self.scrollView.backgroundColor = UIColor.whiteColor()
        self.scrollView.pagingEnabled = true
        self.view.addSubview(self.scrollView)
    }
}
