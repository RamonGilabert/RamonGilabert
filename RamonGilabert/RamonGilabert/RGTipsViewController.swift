import UIKit

class RGTipsViewController: UIViewController {

    let viewModel = ViewModel()
    var swipeSidesIcon = UIImageView()
    var scrollDownIcon = UIImageView()
    var pinchMenuIcon = UIImageView()
    var swipeSidesLabel = UILabel()
    var scrollDownLabel = UILabel()
    var pinchMenuLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.swipeSidesIcon = UIImageView(frame: CGRectMake((Constant.Size.DeviceWidth - (98 * Constant.Size.RelationHeights)) / 2, 30 * Constant.Size.RelationHeights, (98 * Constant.Size.RelationHeights), (53 * Constant.Size.RelationHeights)))
        self.swipeSidesIcon.image = UIImage(named: "swipe-right-left")
        self.swipeSidesIcon.contentMode = UIViewContentMode.ScaleAspectFill
        self.swipeSidesIcon.clipsToBounds = true
        self.view.addSubview(self.swipeSidesIcon)

        self.swipeSidesLabel = UILabel(frame: CGRectMake(30 * Constant.Size.RelationHeights, self.swipeSidesIcon.frame.origin.y + self.swipeSidesIcon.frame.height + 30 * Constant.Size.RelationHeights, Constant.Size.DeviceWidth - ((30 * Constant.Size.RelationHeights) * 2), 0))
        self.swipeSidesLabel.text = "Swipe left / right - Switch between the main views"
    }
}
