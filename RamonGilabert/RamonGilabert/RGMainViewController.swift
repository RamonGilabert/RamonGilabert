import UIKit

class RGMainViewController: UIViewController, UIScrollViewDelegate {
    
    let viewModel = ViewModel()
    let transitionManager = CustomControllerTransitions()
    let transitionVideoManager = CustomVideoTransition()
    let skillsViewController = RGSkillsViewController()
    let tipsViewController = RGTipsViewController()
    let tipsTransitionManager = CustomTipsTransition()
    var scrollView = UIScrollView()
    var arrayWithControllers = NSMutableArray()
    var currentPage = 0

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
        menuViewController.skillsViewController = self.skillsViewController
        
        self.transitionManager.sourceViewController = self
        self.transitionManager.exitViewController = menuViewController

        self.tipsViewController.transitioningDelegate = self.tipsTransitionManager
        self.tipsTransitionManager.exitViewController = self.tipsViewController

        loadScrollViewInPage(0)
        loadScrollViewInPage(1)
        loadScrollViewInPage(2)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "moviePlayerFinishedAndDismissed:" , name: Constant.Setup.NameOfNotification, object: nil)
    }

    func moviePlayerFinishedAndDismissed(notification: NSNotification) {
        let checkFirstLunch = NSUserDefaults.standardUserDefaults().boolForKey("FirstLaunchTips")

        if !checkFirstLunch {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "FirstLaunch")
            self.presentViewController(self.tipsViewController, animated: true, completion: nil)
        }
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
                loadViewController(self.skillsViewController, page: page)
            } else {
                loadViewController(RGProjectsViewController(), page: page)
            }
        } else {
            viewController?.scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
        }
    }

    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
        let pageWidth = CGRectGetWidth(self.scrollView.frame)
        let page = Int(floor((self.scrollView.contentOffset.x - Constant.Size.DeviceWidth) / Constant.Size.DeviceWidth + 1))

        if self.currentPage == 0 || self.currentPage == 2 {
            self.skillsViewController.boolValue = true
            self.skillsViewController.tableView.reloadData()
        }
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageWidth = CGRectGetWidth(self.scrollView.frame)
        self.currentPage = Int(floor(((self.scrollView.contentOffset.x - Constant.Size.DeviceWidth) / 1) / Constant.Size.DeviceWidth + 1))

        if self.currentPage != 1 {
            self.skillsViewController.boolValue = false
            self.skillsViewController.tableView.reloadData()
        }
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        if self.scrollView.contentOffset.x < 0 {
            self.scrollView.setContentOffset(CGPointMake(0, 0), animated: false)
        } else if self.scrollView.contentOffset.x > Constant.Size.DeviceWidth * 2 {
            self.scrollView.setContentOffset(CGPointMake(Constant.Size.DeviceWidth * 2, 0), animated: false)
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
