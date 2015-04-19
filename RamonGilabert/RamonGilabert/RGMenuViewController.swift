import UIKit

class RGMenuViewController: UIViewController {

    let crossButton = UIButton(frame: CGRectMake(0, 0, 0, 0))
    let storyButton = UIButton(frame: CGRectMake(Constant.Positioning.XPositionLeftMenuButton, Constant.Size.DeviceHeight / 7.5, Constant.Positioning.WidthMenuButton, Constant.Positioning.HeightMenuButton))
    let projectsButton = UIButton(frame: CGRectMake(Constant.Positioning.XPositionRightMenuButton, 0, Constant.Positioning.WidthMenuButton, Constant.Positioning.HeightMenuButton))
    let skillsetButton = UIButton(frame: CGRectMake(Constant.Positioning.XPositionLeftMenuButton, 0, Constant.Positioning.WidthMenuButton, Constant.Positioning.HeightMenuButton))
    let videoButton = UIButton(frame: CGRectMake(Constant.Positioning.XPositionRightMenuButton, 0, Constant.Positioning.WidthMenuButton, Constant.Positioning.HeightMenuButton))
    let gameButton = UIButton(frame: CGRectMake(Constant.Positioning.XPositionLeftMenuButton, 0, Constant.Positioning.WidthMenuButton, Constant.Positioning.HeightMenuButton))
    let contactButton = UIButton(frame: CGRectMake(Constant.Positioning.XPositionRightMenuButton, 0, Constant.Positioning.WidthMenuButton, Constant.Positioning.HeightMenuButton))

    override func viewDidLoad() {
        super.viewDidLoad()

        let blurrEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurrView = UIVisualEffectView(effect: blurrEffect)
        blurrView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight)
        self.view.addSubview(blurrView)

        self.storyButton.setBackgroundImage(UIImage(named: "menu-button-image"), forState: UIControlState.Normal)
        self.view.addSubview(self.storyButton)
    }
}
