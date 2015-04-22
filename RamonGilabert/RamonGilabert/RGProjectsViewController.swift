import UIKit

class RGProjectsViewController: UIViewController {

    let viewModel = ViewModel()
    let arrayWithProjects = NSMutableArray(array: Projects.ArrayWithProjects)
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
        self.mainView = self.viewModel.setMainView(self.view)

        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onMainViewMoved:")
        self.mainView.addGestureRecognizer(panGestureRecognizer)

        self.animator = UIDynamicAnimator(referenceView: self.view)

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
            if translation.y > 250 {
                self.animator.removeAllBehaviors()

                var gravity = UIGravityBehavior(items: [self.mainView])
                gravity.gravityDirection = CGVectorMake(0, 15)
                self.animator.addBehavior(gravity)

                self.mainView.removeFromSuperview()
                self.arrayWithProjects.removeObjectAtIndex(0)

                prepareCards()
            }
        }
    }

    // MARK: Cards

    func prepareCards() {
        let dictionary = self.arrayWithProjects[0] as! NSDictionary
        let imageName = dictionary["image"] as! String

        self.viewModel.setImageViewProject(self.mainView, image: imageName)
        self.viewModel.setExplanationProject(self.mainView, text: dictionary["text"] as! String)
        self.viewModel.setTitleProject(self.mainView, text: dictionary["title"] as! String)
        self.viewModel.setSubtitleProject(self.mainView, text: dictionary["position"] as! String)

        self.backgroundImageView.image = UIImage(named: "\(imageName)-blur")
    }
}
