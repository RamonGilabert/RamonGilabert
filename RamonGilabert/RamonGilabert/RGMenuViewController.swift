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

        let imageView = UIImageView(frame: CGRectMake((Constant.Positioning.WidthMenuButton - 39.5)/2, (Constant.Positioning.HeightMenuButton - 39.5)/2 - 9, 39.5, 39.5))
        imageView.image = UIImage(named: "story-image")
        self.storyButton.addSubview(imageView)
        self.storyButton.setBackgroundImage(UIImage(named: "menu-button-image"), forState: UIControlState.Normal)
        self.storyButton.setTitle("STORY", forState: UIControlState.Normal)
        self.storyButton.titleEdgeInsets = UIEdgeInsetsMake(140, 0, 0, 0)
        self.view.addSubview(self.storyButton)

        let imageViewTwo = UIImageView(frame: CGRectMake((Constant.Positioning.WidthMenuButton - 39.5)/2, (Constant.Positioning.HeightMenuButton - 39.5)/2 - 9, 39.5, 39.5))
        imageViewTwo.contentMode = UIViewContentMode.ScaleAspectFit
        imageViewTwo.image = UIImage(named: "projects-image")
        self.projectsButton.addSubview(imageViewTwo)
        self.projectsButton.setBackgroundImage(UIImage(named: "menu-button-image"), forState: UIControlState.Normal)
        self.projectsButton.setTitle("WORK", forState: UIControlState.Normal)
        self.projectsButton.titleEdgeInsets = UIEdgeInsetsMake(140, 0, 0, 0)
        self.view.addSubview(self.projectsButton)

        let imageViewThree = UIImageView(frame: CGRectMake((Constant.Positioning.WidthMenuButton - 39.5)/2, (Constant.Positioning.HeightMenuButton - 39.5)/2 - 9, 39.5, 39.5))
        imageViewThree.contentMode = UIViewContentMode.ScaleAspectFit
        imageViewThree.image = UIImage(named: "skills-image")
        self.skillsetButton.addSubview(imageViewThree)
        self.skillsetButton.setBackgroundImage(UIImage(named: "menu-button-image"), forState: UIControlState.Normal)
        self.skillsetButton.setTitle("SKILLSET", forState: UIControlState.Normal)
        self.skillsetButton.titleEdgeInsets = UIEdgeInsetsMake(140, 0, 0, 0)
        self.view.addSubview(self.skillsetButton)

        let imageViewFour = UIImageView(frame: CGRectMake((Constant.Positioning.WidthMenuButton - 39.5)/2, (Constant.Positioning.HeightMenuButton - 39.5)/2 - 9, 39.5, 39.5))
        imageViewFour.contentMode = UIViewContentMode.ScaleAspectFit
        imageViewFour.image = UIImage(named: "video-image")
        self.videoButton.addSubview(imageViewFour)
        self.videoButton.setBackgroundImage(UIImage(named: "menu-button-image"), forState: UIControlState.Normal)
        self.videoButton.setTitle("VIDEO", forState: UIControlState.Normal)
        self.videoButton.titleEdgeInsets = UIEdgeInsetsMake(140, 0, 0, 0)
        self.view.addSubview(self.videoButton)

        let imageViewFive = UIImageView(frame: CGRectMake((Constant.Positioning.WidthMenuButton - 39.5)/2, (Constant.Positioning.HeightMenuButton - 39.5)/2 - 9, 39.5, 39.5))
        imageViewFive.contentMode = UIViewContentMode.ScaleAspectFit
        imageViewFive.image = UIImage(named: "game-image")
        self.gameButton.addSubview(imageViewFive)
        self.gameButton.setBackgroundImage(UIImage(named: "menu-button-image"), forState: UIControlState.Normal)
        self.gameButton.setTitle("GAME", forState: UIControlState.Normal)
        self.gameButton.titleEdgeInsets = UIEdgeInsetsMake(140, 0, 0, 0)
        self.view.addSubview(self.gameButton)

        let imageViewSix = UIImageView(frame: CGRectMake((Constant.Positioning.WidthMenuButton - 39.5)/2, (Constant.Positioning.HeightMenuButton - 39.5)/2 - 9, 39.5, 39.5))
        imageViewSix.contentMode = UIViewContentMode.ScaleAspectFit
        imageViewSix.image = UIImage(named: "contact-image")
        self.contactButton.addSubview(imageViewSix)
        self.contactButton.setBackgroundImage(UIImage(named: "menu-button-image"), forState: UIControlState.Normal)
        self.contactButton.setTitle("CONTACT", forState: UIControlState.Normal)
        self.contactButton.titleEdgeInsets = UIEdgeInsetsMake(140, 0, 0, 0)
        self.view.addSubview(self.contactButton)
    }
}
