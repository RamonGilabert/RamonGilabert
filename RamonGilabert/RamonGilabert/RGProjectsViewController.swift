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
            if translation.y > 250 || translation.y < -250 {
                self.animator.removeAllBehaviors()

                let gravity = UIGravityBehavior(items: [self.mainView])

                if translation.y > 250 {
                    gravity.gravityDirection = CGVectorMake(0, 20)
                } else {
                    gravity.gravityDirection = CGVectorMake(0, -20)
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

        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.backgroundImageView.alpha = 1
        })

        self.mainView.addGestureRecognizer(self.panGestureRecognizer)

        self.mainView.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(0.3, 0.3), CGFloat(rand()%RAND_MAX) / CGFloat(RAND_MAX) - 0.5)

        UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.4, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.mainView.transform = CGAffineTransformIdentity
        }, completion: nil)
    }
}
