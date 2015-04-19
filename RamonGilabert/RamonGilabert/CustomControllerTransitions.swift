import UIKit

class CustomControllerTransitions: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {

    private var presenting = false

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView()

        let screens : (from:UIViewController, to:UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!, transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)

        let mainViewController = !self.presenting ? screens.from as? RGMainViewController : screens.to as? RGMainViewController
        let menuViewController = !self.presenting ? screens.to as? RGMenuViewController : screens.from as? RGMenuViewController

        if (self.presenting){
            self.offStageMenuController(mainViewController!)
        }

        let menuView = mainViewController?.view
        let bottomView = menuViewController?.view

        container.addSubview(bottomView!)
        container.addSubview(menuView!)

        let duration = self.transitionDuration(transitionContext)

        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: nil, animations: {

            if (self.presenting){
                self.onStageMenuController(mainViewController!)
            } else {
                self.offStageMenuController(mainViewController!)
            } }, completion: { finished in
                transitionContext.completeTransition(true)
        })
    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

    func offStage(amount: CGFloat) -> CGAffineTransform {
        return CGAffineTransformMakeTranslation(amount, 0)
    }

    func offStageMenuController(menuViewController: RGMainViewController){

        menuViewController.view.alpha = 0
        let topRowOffset  :CGFloat = 300
        let middleRowOffset :CGFloat = 150
        let bottomRowOffset  :CGFloat = 50
    }

    func onStageMenuController(menuViewController: RGMainViewController){
        menuViewController.view.alpha = 1
    }

}
