import UIKit

class RGProjectsViewController: UIViewController {

    let viewModel = ViewModel()
    var arrayWithProjects = NSMutableArray(array: Projects.ArrayWithProjects)
    var panGestureRecognizer = UIPanGestureRecognizer()
    var scrollView = UIScrollView()
    var mainView = UIView()
    var backgroundImageView = UIImageView()
    var animator: UIDynamicAnimator!
    var attachmentBehavior: UIAttachmentBehavior!
    var gravityBehaviour: UIGravityBehavior!
    var snapBehavior: UISnapBehavior!

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.backgroundImageView = self.viewModel.setBackgroundProjects(self.view)

        self.animator = UIDynamicAnimator(referenceView: self.view)
        self.panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onMainViewMoved:")

        prepareCards()
    }

    // MARK: UIGestureRecognizers

    func onMainViewMoved(panGestureRecognizer: UIPanGestureRecognizer) {
        let location = panGestureRecognizer.locationInView(self.view)
        let boxLocation = panGestureRecognizer.locationInView(self.mainView)

        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            self.animator.removeBehavior(snapBehavior)

            let centerOffset = UIOffsetMake(boxLocation.x - CGRectGetMidX(self.mainView.bounds), boxLocation.y - CGRectGetMidY(self.mainView.bounds));
            self.attachmentBehavior = UIAttachmentBehavior(item: self.mainView, offsetFromCenter: centerOffset, attachedToAnchor: location)
            self.attachmentBehavior.frequency = 0

            self.animator.addBehavior(attachmentBehavior)
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            self.attachmentBehavior.anchorPoint = location
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            self.animator.removeBehavior(attachmentBehavior)

            self.snapBehavior = UISnapBehavior(item: self.mainView, snapToPoint: self.backgroundImageView.center)
            self.animator.addBehavior(self.snapBehavior)

            let translation = panGestureRecognizer.translationInView(self.view)
            if translation.y > Projects.AnimatorBehaviour.MaximumTranslation || translation.y < -Projects.AnimatorBehaviour.MaximumTranslation {
                self.animator.removeAllBehaviors()

                let gravity = UIGravityBehavior(items: [self.mainView])

                if translation.y > Projects.AnimatorBehaviour.MaximumTranslation {
                    gravity.gravityDirection = CGVectorMake(0, Projects.AnimatorBehaviour.Gravity)
                } else {
                    gravity.gravityDirection = CGVectorMake(0, -Projects.AnimatorBehaviour.Gravity)
                }

                self.animator.addBehavior(gravity)

                self.mainView.removeGestureRecognizer(self.panGestureRecognizer)
                self.arrayWithProjects.removeObjectAtIndex(0)

                if self.arrayWithProjects.count == 0 {
                    self.arrayWithProjects = NSMutableArray(array: Projects.ArrayWithProjects)
                }

                prepareCards()
            }
        }
    }

    // MARK: Cards

    func prepareCards() {
        let dictionary = self.arrayWithProjects[0] as! NSDictionary
        let imageName = dictionary["image"] as! String

        self.mainView = self.viewModel.setMainView(self.view)
        self.viewModel.setImageViewProject(self.mainView, image: imageName)
        self.viewModel.setExplanationProject(self.mainView, text: dictionary["text"] as! String)
        self.viewModel.setTitleProject(self.mainView, text: dictionary["title"] as! String)
        self.viewModel.setSubtitleProject(self.mainView, text: dictionary["position"] as! String)

        self.backgroundImageView.alpha = 0
        self.backgroundImageView.image = UIImage(named: "\(imageName)-blur")

        UIView.animateWithDuration(Projects.AnimatorBehaviour.SpringAnimationBackgroundDuration, animations: { () -> Void in
            self.backgroundImageView.alpha = 1
        })

        self.mainView.addGestureRecognizer(self.panGestureRecognizer)

        self.mainView.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(Projects.AnimatorBehaviour.InitialScaleValue, Projects.AnimatorBehaviour.InitialScaleValue), CGFloat(rand()%RAND_MAX) / CGFloat(RAND_MAX) - 0.5)

        UIView.animateWithDuration(Projects.AnimatorBehaviour.SpringAnimationMainViewDuration, delay: 0, usingSpringWithDamping: Projects.AnimatorBehaviour.SpringAnimationDamping, initialSpringVelocity: Projects.AnimatorBehaviour.SpringAnimationInitialVelocity, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.mainView.transform = CGAffineTransformIdentity
        }, completion: nil)
    }
}
