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

        self.swipeSidesLabel = self.viewModel.setTipsTitle(self.view, yPosition: self.swipeSidesIcon.frame.origin.y + self.swipeSidesIcon.frame.height + 15, text: "Swipe left / right - Switch between the main views")
        self.scrollDownLabel = self.viewModel.setTipsTitle(self.view, yPosition: self.scrollDownIcon.frame.origin.y + self.scrollDownIcon.frame.height + 15, text: "Scroll down - Discover the content")
        self.pinchMenuLabel = self.viewModel.setTipsTitle(self.view, yPosition: self.pinchMenuIcon.frame.origin.y + self.pinchMenuIcon.frame.height + 15, text: "Pinch to see the menu - More fun inside")
    }
}
