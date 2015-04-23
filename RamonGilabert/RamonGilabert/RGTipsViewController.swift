import UIKit

class RGTipsViewController: UIViewController {

    let viewModel = ViewModel()
    let transitionManager = CustomTipsTransition()
    var slideToStartLabel = UILabel()
    var swipeSidesIcon = UIImageView()
    var scrollDownIcon = UIImageView()
    var pinchMenuIcon = UIImageView()
    var swipeSidesLabel = UILabel()
    var scrollDownLabel = UILabel()
    var pinchMenuLabel = UILabel()
    var backgroundView = UIView()

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setIconsAndLabels()
    }

    // MARK: Helper methods

    func setIconsAndLabels() {
        self.backgroundView = self.viewModel.setBlurView()
        self.view.addSubview(self.backgroundView)

        self.swipeSidesIcon = self.viewModel.setTipsIcon(self.view, frame: CGRectMake((Constant.Size.DeviceWidth - Constant.TipsViewPositioning.WidthTipFirstIcon)/2, Constant.TipsViewPositioning.MinimumViewPadding, Constant.TipsViewPositioning.WidthTipFirstIcon, Constant.TipsViewPositioning.HeightTipFirstIcon), image: Constant.TipsViewPositioning.FirstIconImage)

        self.swipeSidesLabel = self.viewModel.setTipsTitle(self.view, yPosition: self.swipeSidesIcon.frame.origin.y + self.swipeSidesIcon.frame.height + 15, text: "Swipe left / right - Switch between the main views")

        self.scrollDownIcon = self.viewModel.setTipsIcon(self.view, frame: CGRectMake((Constant.Size.DeviceWidth - Constant.TipsViewPositioning.WidthTipSecondIcon)/2, self.swipeSidesLabel.frame.origin.y + self.swipeSidesLabel.frame.height + Constant.TipsViewPositioning.MinimumViewPadding, Constant.TipsViewPositioning.WidthTipSecondIcon, Constant.TipsViewPositioning.HeightTipSecondIcon), image: Constant.TipsViewPositioning.SecondIconImage)

        self.scrollDownLabel = self.viewModel.setTipsTitle(self.view, yPosition: self.scrollDownIcon.frame.origin.y + self.scrollDownIcon.frame.height + 15, text: "Scroll down - Discover the content")

        self.pinchMenuIcon = self.viewModel.setTipsIcon(self.view, frame: CGRectMake((Constant.Size.DeviceWidth - Constant.TipsViewPositioning.WidthTipThirdIcon)/2, self.scrollDownLabel.frame.origin.y + self.scrollDownLabel.frame.height + Constant.TipsViewPositioning.MinimumViewPadding/2, Constant.TipsViewPositioning.WidthTipThirdIcon, Constant.TipsViewPositioning.HeightTipThirdIcon), image: Constant.TipsViewPositioning.ThirdIconImage)

        self.pinchMenuLabel = self.viewModel.setTipsTitle(self.view, yPosition: self.pinchMenuIcon.frame.origin.y + self.pinchMenuIcon.frame.height + 15, text: "Pinch to see the menu - More fun inside")

        self.slideToStartLabel = self.viewModel.setTipsTitle(self.view, yPosition: Constant.Size.DeviceHeight - Constant.TipsViewPositioning.PositionPaddingFromBottom, text: Constant.TipsViewPositioning.TextForSlider)
    }
}
