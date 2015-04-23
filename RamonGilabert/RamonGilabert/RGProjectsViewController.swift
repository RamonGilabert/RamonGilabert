import UIKit

struct AnimatorBehaviour {
    static let MaximumTranslation = 200 as CGFloat
    static let Gravity = 20 as CGFloat
    static let SpringAnimationBackgroundDuration = 0.4
    static let SpringAnimationMainViewDuration = 0.6
    static let SpringAnimationDamping = 0.5 as CGFloat
    static let SpringAnimationInitialVelocity = 0 as CGFloat
    static let InitialScaleValue = 0.6 as CGFloat
}

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
            if translation.y > AnimatorBehaviour.MaximumTranslation || translation.y < -AnimatorBehaviour.MaximumTranslation {
                self.animator.removeAllBehaviors()

                let gravity = UIGravityBehavior(items: [self.mainView])

                if translation.y > AnimatorBehaviour.MaximumTranslation {
                    gravity.gravityDirection = CGVectorMake(0, AnimatorBehaviour.Gravity)
                } else {
                    gravity.gravityDirection = CGVectorMake(0, -AnimatorBehaviour.Gravity)
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

        UIView.animateWithDuration(AnimatorBehaviour.SpringAnimationBackgroundDuration, animations: { () -> Void in
            self.backgroundImageView.alpha = 1
            self.backgroundImageView.image = UIImage(named: "\(imageName)-blur")
        })

        self.mainView.addGestureRecognizer(self.panGestureRecognizer)

        self.mainView.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(AnimatorBehaviour.InitialScaleValue, AnimatorBehaviour.InitialScaleValue), CGFloat(rand()%RAND_MAX) / CGFloat(RAND_MAX) - 0.5)

        UIView.animateWithDuration(AnimatorBehaviour.SpringAnimationMainViewDuration, delay: 0, usingSpringWithDamping: AnimatorBehaviour.SpringAnimationDamping, initialSpringVelocity: AnimatorBehaviour.SpringAnimationInitialVelocity, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.mainView.transform = CGAffineTransformIdentity
        }, completion: nil)
    }
}
