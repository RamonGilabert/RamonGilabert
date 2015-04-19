import UIKit

class RGMenuViewController: UIViewController {

    let crossButton = UIButton(frame: CGRectMake(0, 0, 0, 0))
    let storyButton = UIButton(frame: CGRectMake(Constant.Positioning.XPositionLeftMenuButton, Constant.Size.DeviceHeight / 7.5, Constant.Positioning.WidthMenuButton, Constant.Positioning.HeightMenuButton))
    let projectsButton = UIButton(frame: CGRectMake(Constant.Positioning.XPositionRightMenuButton, Constant.Size.DeviceHeight / 7.5, Constant.Positioning.WidthMenuButton, Constant.Positioning.HeightMenuButton))
    let skillsetButton = UIButton(frame: CGRectMake(Constant.Positioning.XPositionLeftMenuButton, Constant.Size.DeviceHeight / 7.5 + Constant.Positioning.HeightMenuButton + 45, Constant.Positioning.WidthMenuButton, Constant.Positioning.HeightMenuButton))
    let videoButton = UIButton(frame: CGRectMake(Constant.Positioning.XPositionRightMenuButton, Constant.Size.DeviceHeight / 7.5 + Constant.Positioning.HeightMenuButton + 45, Constant.Positioning.WidthMenuButton, Constant.Positioning.HeightMenuButton))
    let gameButton = UIButton(frame: CGRectMake(Constant.Positioning.XPositionLeftMenuButton, Constant.Size.DeviceHeight / 7.5 + (Constant.Positioning.HeightMenuButton * 2) + 90, Constant.Positioning.WidthMenuButton, Constant.Positioning.HeightMenuButton))
    let contactButton = UIButton(frame: CGRectMake(Constant.Positioning.XPositionRightMenuButton, Constant.Size.DeviceHeight / 7.5 + (Constant.Positioning.HeightMenuButton * 2) + 90, Constant.Positioning.WidthMenuButton, Constant.Positioning.HeightMenuButton))

    override func viewDidLoad() {
        super.viewDidLoad()

        let blurrEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurrView = UIVisualEffectView(effect: blurrEffect)
        blurrView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight)
        self.view.addSubview(blurrView)

        self.storyButton.setBackgroundImage(UIImage(named: "menu-button-image"), forState: UIControlState.Normal)
        self.storyButton.setTitle("STORY", forState: UIControlState.Normal)
        self.view.addSubview(self.storyButton)

        self.projectsButton.setBackgroundImage(UIImage(named: "menu-button-image"), forState: UIControlState.Normal)
        self.storyButton.setTitle("STORY", forState: UIControlState.Normal)
        self.view.addSubview(self.projectsButton)

        self.skillsetButton.setBackgroundImage(UIImage(named: "menu-button-image"), forState: UIControlState.Normal)
        self.storyButton.setTitle("STORY", forState: UIControlState.Normal)
        self.view.addSubview(self.skillsetButton)

        self.videoButton.setBackgroundImage(UIImage(named: "menu-button-image"), forState: UIControlState.Normal)
        self.storyButton.setTitle("STORY", forState: UIControlState.Normal)
        self.view.addSubview(self.videoButton)

        self.gameButton.setBackgroundImage(UIImage(named: "menu-button-image"), forState: UIControlState.Normal)
        self.storyButton.setTitle("STORY", forState: UIControlState.Normal)
        self.view.addSubview(self.gameButton)

        self.contactButton.setBackgroundImage(UIImage(named: "menu-button-image"), forState: UIControlState.Normal)
        self.storyButton.setTitle("STORY", forState: UIControlState.Normal)
        self.view.addSubview(self.contactButton)
    }
}
