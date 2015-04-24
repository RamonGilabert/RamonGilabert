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
    var backgroundViewSocial = UIView()
    var viewSocial = UIView()

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

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let checkFirstLunch = NSUserDefaults.standardUserDefaults().boolForKey("FirstLaunch")

        if !checkFirstLunch {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "FirstLaunch")

            let videoViewController = RGVideoViewController()
            videoViewController.view.removeFromSuperview()

            self.presentViewController(videoViewController, animated: true, completion: nil)
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

    // MARK: Notification methods

    func moviePlayerFinishedAndDismissed(notification: NSNotification) {
        let checkFirstLunch = NSUserDefaults.standardUserDefaults().boolForKey("FirstLaunchTips")

        if !checkFirstLunch {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "FirstLaunch")
            self.presentViewController(self.tipsViewController, animated: true, completion: nil)
        }
    }

    // MARK: Button handlers

    func onCrossButtonPressed(sender: UIButton) {
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: nil, animations: {
            self.backgroundViewSocial.alpha = 0
            self.viewSocial.transform = CGAffineTransformMakeTranslation(0, Constant.SocialViewPositioning.HeightOfView)
            sender.transform = CGAffineTransformMakeScale(0, 0)
            }, completion: { finished in
        })
    }

    // MARK: Helper methods

    func setAllSocialViews() {
        self.backgroundViewSocial = self.viewModel.setBackgroundViewSocial(self.view)
        self.viewSocial = self.viewModel.setContainerOfViewSocial(self.view)
        let buttonCross = self.viewModel.setCrossButtonSocial(viewSocial)
        buttonCross.addTarget(self, action: "onCrossButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)

        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: nil, animations: {
            self.backgroundViewSocial.alpha = 0.6
            self.viewSocial.transform = CGAffineTransformIdentity
            buttonCross.transform = CGAffineTransformIdentity
        }, completion: { finished in
        })
    }

    func loadViewController(viewController: UIViewController, page: Int) {
        viewController.view.frame = CGRectMake(viewController.view.bounds.width * CGFloat(page), 0, viewController.view.bounds.width, viewController.view.bounds.height)

        self.addChildViewController(viewController)
        self.scrollView.addSubview(viewController.view)

        self.arrayWithControllers.replaceObjectAtIndex(page, withObject: viewController)
    }
}
