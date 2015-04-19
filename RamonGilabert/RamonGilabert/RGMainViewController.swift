import UIKit

class RGMainViewController: UIViewController, UIScrollViewDelegate {
    
    let viewModel = ViewModel()
    let transitionManager = CustomControllerTransitions()
    var scrollView = UIScrollView()
    var arrayWithControllers = NSMutableArray()

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView = self.viewModel.initMainScrollViewInView(view)
        self.scrollView.delegate = self

        for index in 0...2 {
            self.arrayWithControllers.addObject(NSNull())
        }

        let menuViewController = RGMenuViewController()
        menuViewController.transitioningDelegate = self.transitionManager
        
        self.transitionManager.sourceViewController = self
        self.transitionManager.exitViewController = menuViewController

        loadScrollViewInPage(0)
        loadScrollViewInPage(1)
    }

    // MARK: ScrollView methods

    func loadScrollViewInPage(page: Int) {

        if page >= Constant.Setup.NumberOfPagesScrolling || page <= -1 {
            return
        }

        let viewController = self.arrayWithControllers[page] as? RGStoryViewController

        if !(viewController != nil) {
            if page == 0 {
                loadViewController(RGStoryViewController(), page: page)
            } else if page == 1 {
                loadViewController(RGSkillsViewController(), page: page)
            } else {
                loadViewController(RGProjectsViewController(), page: page)
            }
        } else {
            viewController?.scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
        }
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageWidth = CGRectGetWidth(self.scrollView.frame)
        let page = Int(floor(((self.scrollView.contentOffset.x - Constant.Size.DeviceWidth) / 2) / Constant.Size.DeviceWidth + 1))

        loadScrollViewInPage(page - 1)
        loadScrollViewInPage(page + 1)
    }

    // MARK: Helper methods

    func loadViewController(viewController: UIViewController, page: Int) {
        viewController.view.frame = CGRectMake(viewController.view.bounds.width * CGFloat(page), 0, viewController.view.bounds.width, viewController.view.bounds.height)

        self.addChildViewController(viewController)
        self.scrollView.addSubview(viewController.view)

        self.arrayWithControllers.replaceObjectAtIndex(page, withObject: viewController)
    }
}
