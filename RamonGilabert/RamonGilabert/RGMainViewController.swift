import UIKit

struct Constant {
    struct Setup {
        static let NumberOfPagesScrolling = 3 as Int
    }
}

class RGMainViewController: UIViewController {

    let deviceWidth = UIScreen.mainScreen().bounds.width
    let deviceHeight = UIScreen.mainScreen().bounds.height
    var scrollView = UIScrollView()
    var arrayWithControllers = NSMutableArray()

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView = UIScrollView(frame: CGRectMake(0, 0, self.deviceWidth, self.deviceHeight))
        self.scrollView.contentSize = CGSizeMake(self.deviceWidth * CGFloat(Constant.Setup.NumberOfPagesScrolling), self.deviceHeight)
        self.scrollView.backgroundColor = UIColor.whiteColor()
        self.scrollView.pagingEnabled = true
        self.view.addSubview(self.scrollView)

        for index in 0...2 {
            self.arrayWithControllers.addObject(NSNull())
        }

        loadScrollViewInPage(0)
    }

    // MARK: ScrollView methods

    func loadScrollViewInPage(page: Int) {
        if page >= Constant.Setup.NumberOfPagesScrolling {
            return
        }

        let viewController = self.arrayWithControllers[page] as? UIViewController

        if !(viewController != nil) {
            if page == 0 {

            } else if page == 1 {

            } else {

            }
        }
    }
}
