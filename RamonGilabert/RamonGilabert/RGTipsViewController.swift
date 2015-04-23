import UIKit

class RGTipsViewController: UIViewController {

    let viewModel = ViewModel()
    var swipeSidesIcon = UIImageView()
    var scrollDownIcon = UIImageView()
    var pinchMenuIcon = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.swipeSidesIcon = UIImageView(frame: CGRectMake((Constant.Size.DeviceWidth - (98 * Constant.Size.RelationHeights)) / 2, 30 * Constant.Size.RelationHeights, (98 * Constant.Size.RelationHeights), (53 * Constant.Size.RelationHeights)))
        self.swipeSidesIcon.image = UIImage(named: "swipe-right-left")
        self.swipeSidesIcon.contentMode = UIViewContentMode.ScaleAspectFill
        self.swipeSidesIcon.clipsToBounds = true
        self.view.addSubview(self.swipeSidesIcon)
    }
}
