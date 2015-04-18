import UIKit

class RGMainViewController: UIViewController {
    
    let viewModel = ViewModel()
    var scrollView = UIScrollView()
    var arrayWithControllers = NSMutableArray()

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView = self.viewModel.initMainScrollViewInView(view)

        for index in 0...2 {
            self.arrayWithControllers.addObject(NSNull())
        }

        loadScrollViewInPage(0)
        loadScrollViewInPage(1)
        loadScrollViewInPage(2)
    }

    // MARK: ScrollView methods

    func loadScrollViewInPage(page: Int) {
        if page >= Constant.Setup.NumberOfPagesScrolling {
            return
        }

        let viewController = self.arrayWithControllers[page] as? UIViewController

        if !(viewController != nil) {
            if page == 0 {
                loadViewController(RGStoryViewController(), page: page)
            } else if page == 1 {
                loadViewController(RGSkillsViewController(), page: page)
            } else {
                loadViewController(RGProjectsViewController(), page: page)
            }
        }
    }

    // MARK: Helper methods

    func loadViewController(viewController: UIViewController, page: Int) {
        viewController.view.frame = CGRectMake(viewController.view.bounds.width * CGFloat(page), 0, viewController.view.bounds.width, viewController.view.bounds.height)

        self.addChildViewController(viewController)
        self.scrollView.addSubview(viewController.view)

        self.arrayWithControllers.replaceObjectAtIndex(page, withObject: viewController)
    }
}
