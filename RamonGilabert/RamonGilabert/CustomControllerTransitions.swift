import UIKit

class CustomControllerTransitions: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate, UIViewControllerInteractiveTransitioning {

    private let pinchGesture = UIPinchGestureRecognizer()
    private var presenting = false
    private var interactive = false

    var sourceViewController: UIViewController! {
        didSet {
            self.pinchGesture.addTarget(self, action:"onPinchedGestureRecognizer:")
            self.sourceViewController.view.addGestureRecognizer(self.pinchGesture)
        }
    }

    func onPinchedGestureRecognizer(pinchGesture: UIPinchGestureRecognizer){
        let translation = pinchGesture.scale

        switch (pinchGesture.state) {

        case UIGestureRecognizerState.Began:
            self.interactive = true

            let menuViewController = RGMenuViewController()
            menuViewController.transitioningDelegate = self
            self.sourceViewController.presentViewController(menuViewController, animated: true, completion: nil)

            break
        case UIGestureRecognizerState.Changed:
            self.updateInteractiveTransition(1 - translation)

            break
        default:
            self.interactive = false

            if (translation < 0.3) {
                self.finishInteractiveTransition()
            } else {
                self.cancelInteractiveTransition()
            }
        }
    }

    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactive ? self : nil
    }

    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactive ? self : nil
    }

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView()

        let screens : (from:UIViewController, to:UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!, transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)

        let mainViewController = !self.presenting ? screens.to as! RGMainViewController : screens.from as! RGMainViewController
        let menuViewController = !self.presenting ? screens.from as! RGMenuViewController : screens.to as! RGMenuViewController

        let mainView = mainViewController.view
        let menuView = menuViewController.view

        if (self.presenting){
            menuView.alpha = 0
        }

        container.addSubview(mainView)
        container.addSubview(menuView)

        let duration = self.transitionDuration(transitionContext)

        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: nil, animations: {
            if (self.presenting) {
                self.onStageMenuController(menuViewController)
            } else {
                mainView.transform = CGAffineTransformIdentity
                self.offStageMenuController(menuViewController)
            } }, completion: { finished in
                if (transitionContext.transitionWasCancelled()) {
                    transitionContext.completeTransition(false)
                } else {
                    transitionContext.completeTransition(true)
                }
        })
    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }

    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }

    func offStage(amount: CGFloat) -> CGAffineTransform {
        return CGAffineTransformMakeTranslation(amount, 0)
    }

    func offStageMenuController(menuViewController: RGMenuViewController){
        menuViewController.view.alpha = 0
        let topRowOffset : CGFloat = 300
        let middleRowOffset : CGFloat = 150
        let bottomRowOffset : CGFloat = 50
    }

    func onStageMenuController(menuViewController: RGMenuViewController){
        menuViewController.view.alpha = 1
    }

}
