import UIKit

class CustomControllerTransitions: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate, UIViewControllerInteractiveTransitioning {

    private let pinchGesture = UIPinchGestureRecognizer()
    private let pinchGestureExit = UIPinchGestureRecognizer()
    private var presenting = false
    private var interactive = false

    var sourceViewController: UIViewController! {
        didSet {
            self.pinchGesture.addTarget(self, action:"onPinchedGestureRecognizer:")
            self.sourceViewController.view.addGestureRecognizer(self.pinchGesture)
        }
    }

    var exitViewController: UIViewController! {
        didSet {
            self.pinchGestureExit.addTarget(self, action:"onPinchedExitGestureRecognizer:")
            self.exitViewController.view.addGestureRecognizer(self.pinchGestureExit)
        }
    }

    func onPinchedGestureRecognizer(pinchGesture: UIPinchGestureRecognizer) {
        let translation = pinchGesture.scale

        switch pinchGesture.state {
            case UIGestureRecognizerState.Began:
                if pinchGesture.velocity < 0 {
                    self.interactive = true

                    self.sourceViewController.presentViewController(self.exitViewController, animated: true, completion: nil)
                }

                break
            case UIGestureRecognizerState.Changed:
                self.updateInteractiveTransition((1 - translation)/2)

                break
            default:
                self.interactive = false

                if translation < 0.6 {
                    self.finishInteractiveTransition()
                } else {
                    self.cancelInteractiveTransition()
                }
        }
    }

    func onPinchedExitGestureRecognizer(pinchGesture: UIPinchGestureRecognizer) {
        let translation = pinchGesture.scale/7

        switch pinchGesture.state {
            case UIGestureRecognizerState.Began:

                if pinchGesture.velocity > 0 {
                    self.interactive = true

                    self.exitViewController.dismissViewControllerAnimated(true, completion: nil)
                }

                break
            case UIGestureRecognizerState.Changed:
                self.updateInteractiveTransition(translation/5)

                break
            default:
                self.interactive = false

                if translation > 0.6 {
                    self.finishInteractiveTransition()
                } else {
                    self.cancelInteractiveTransition()
                    onStageMenuController(self.exitViewController as! RGMenuViewController)
                }
        }
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView()

        let screens : (from:UIViewController, to:UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!, transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)

        let mainViewController = !self.presenting ? screens.to as! RGMainViewController : screens.from as! RGMainViewController
        let menuViewController = !self.presenting ? screens.from as! RGMenuViewController : screens.to as! RGMenuViewController

        let mainView = mainViewController.view
        let menuView = menuViewController.view

        if self.presenting {
            offStageMenuController(menuViewController)
        }

        container.addSubview(mainView)
        container.addSubview(menuView)

        let duration = self.transitionDuration(transitionContext)

        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: nil, animations: {
            if self.presenting {
                self.onStageMenuController(menuViewController)
            } else {
                self.offStageMenuController(menuViewController)
            } }, completion: { finished in
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

    // MARK: Final position methods

    func offStageMenuController(menuViewController: RGMenuViewController){
        menuViewController.view.alpha = 0

        menuViewController.crossButton.transform = CGAffineTransformMakeScale(0, 0)
        menuViewController.titleLabel.transform = CGAffineTransformMakeTranslation(0, -100)
        menuViewController.storyButton.transform = CGAffineTransformMakeTranslation(-120, -75)
        menuViewController.projectsButton.transform = CGAffineTransformMakeTranslation(120, -75)
        menuViewController.skillsetButton.transform = CGAffineTransformMakeTranslation(-120, 0)
        menuViewController.videoButton.transform = CGAffineTransformMakeTranslation(120, 0)
        menuViewController.gameButton.transform = CGAffineTransformMakeTranslation(-120, 75)
        menuViewController.contactButton.transform = CGAffineTransformMakeTranslation(120, 75)
    }

    func onStageMenuController(menuViewController: RGMenuViewController){
        menuViewController.view.alpha = 1

        for view in menuViewController.view.subviews as! [UIView] {
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

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.75
    }

}
