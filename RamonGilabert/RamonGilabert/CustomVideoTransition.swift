import UIKit

class CustomVideoTransition: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {

    private var presenting = false

    // MARK: UIViewControllerAnimatedTransitioning protocol methods

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView()

        let screens: (from: UIViewController, to: UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!, transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)

        let mainViewController = !self.presenting ? screens.to as! RGMainViewController : screens.from as! RGMainViewController
        let videoViewController = !self.presenting ? screens.from as UIViewController : screens.to as UIViewController

        let menuView = videoViewController.view
        let bottomView = mainViewController.view

        if (self.presenting) {
            self.offStageMenuController(videoViewController)
        }

        container.addSubview(bottomView)
        container.addSubview(menuView)

        let duration = self.transitionDuration(transitionContext)

        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: nil, animations: {

            if (self.presenting) {
                self.onStageMenuController(videoViewController)
            } else {
                self.offStageMenuController(videoViewController)
            }}, completion: { finished in
                transitionContext.completeTransition(true)
                UIApplication.sharedApplication().keyWindow!.addSubview(screens.from.view)
                UIApplication.sharedApplication().keyWindow!.addSubview(screens.to.view)
        })
    }

    func offStageMenuController(videoViewController: UIViewController) {
        videoViewController.view.alpha = 0
        videoViewController.view.transform = CGAffineTransformMakeScale(1.5, 1.5)
    }

    func onStageMenuController(videoViewController: UIViewController) {
        videoViewController.view.alpha = 1
        videoViewController.view.transform = CGAffineTransformIdentity
    }

    func transitionDuration(videoViewController: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.75
    }

    // MARK: UIViewControllerTransitioningDelegate protocol methods

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }

    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
}
