import UIKit

struct PanGestureTranslation {
    static let SideXTranslation = 120 as CGFloat
    static let SideYTranslation = 75 as CGFloat
    static let SideYTranslationTitle = 100 as CGFloat
}

class CustomTipsTransition: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate, UIViewControllerInteractiveTransitioning {

    private var panGestureRecognizer = UIPanGestureRecognizer()
    private var presenting = false
    private var interactive = false

    // MARK: Setters

    var exitViewController: RGTipsViewController! {
        didSet {
            self.panGestureRecognizer.addTarget(self, action:"onPanGestureRecognizer:")
            self.exitViewController.view.addGestureRecognizer(self.panGestureRecognizer)
        }
    }

    // MARK: UIPanGestureHandlers

    func onPanGestureRecognizer(panGesture: UIPanGestureRecognizer) {
        let translation = panGesture.translationInView(self.exitViewController.view)

        switch panGesture.state {
        case UIGestureRecognizerState.Began:
            if translation.x < 0 {
                self.interactive = true
                self.exitViewController.dismissViewControllerAnimated(true, completion: nil)
            }

            break
        case UIGestureRecognizerState.Changed:
            self.updateInteractiveTransition((-translation.x + 25)/Constant.Size.DeviceWidth/10)

            break
        default:
            self.interactive = false

            if -translation.x/100 > 1.75 {
                self.finishInteractiveTransition()
            } else {
                self.cancelInteractiveTransition()
            }
        }
    }

    // MARK: UIViewControllerAnimatedTransitioning protocol methods

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView()

        let screens: (from: UIViewController, to: UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!, transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)

        let mainViewController = !self.presenting ? screens.to as! RGMainViewController : screens.from as! RGMainViewController
        let tipsViewController = !self.presenting ? screens.from as! RGTipsViewController : screens.to as! RGTipsViewController

        let menuView = tipsViewController.view
        let bottomView = mainViewController.view

        if (self.presenting) {
            self.offStageMenuController(tipsViewController)
        }

        container.addSubview(bottomView)
        container.addSubview(menuView)

        let duration = self.transitionDuration(transitionContext)

        UIView.animateWithDuration(duration/1.5, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.8, options: nil, animations: {
            if self.presenting {
                self.onStageMenuController(tipsViewController)
            } else {
                self.offStageMenuController(tipsViewController)
            }}, completion: { finished in
                if transitionContext.transitionWasCancelled() {
                    transitionContext.completeTransition(false)
                    UIApplication.sharedApplication().keyWindow!.addSubview(screens.from.view)
                } else {
                    transitionContext.completeTransition(true)
                    UIApplication.sharedApplication().keyWindow!.addSubview(screens.from.view)
                    UIApplication.sharedApplication().keyWindow!.addSubview(screens.to.view)
                }
        })
    }

    func offStageMenuController(tipsViewController: RGTipsViewController) {
        tipsViewController.backgroundView.alpha = 0

        tipsViewController.swipeSidesIcon.transform = CGAffineTransformMakeTranslation(-400, 0)
        tipsViewController.swipeSidesLabel.transform = CGAffineTransformMakeTranslation(-400, 0)
        tipsViewController.scrollDownIcon.transform = CGAffineTransformMakeTranslation(400, 0)
        tipsViewController.scrollDownLabel.transform = CGAffineTransformMakeTranslation(400, 0)
        tipsViewController.pinchMenuIcon.transform = CGAffineTransformMakeTranslation(-400, 0)
        tipsViewController.pinchMenuLabel.transform = CGAffineTransformMakeTranslation(-400, 0)
    }

    func onStageMenuController(tipsViewController: RGTipsViewController) {
        tipsViewController.backgroundView.alpha = 0.85

        for view in tipsViewController.view.subviews as! [UIView] {
            view.transform = CGAffineTransformIdentity
        }
    }

    // MARK: Delegate methods

    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactive ? self : nil
    }

    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactive ? self : nil
    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }

    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }

    func transitionDuration(videoViewController: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.75
    }
}
