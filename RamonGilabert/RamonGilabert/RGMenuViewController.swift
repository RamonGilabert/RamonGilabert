import UIKit

class RGMenuViewController: UIViewController {

    let viewModel = ViewModel()
    var crossButton = UIButton()
    var titleLabel = UILabel()
    var storyButton = UIButton()
    var projectsButton = UIButton()
    var skillsetButton = UIButton()
    var videoButton = UIButton()
    var gameButton = UIButton()
    var contactButton = UIButton()

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let blurrEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurrView = UIVisualEffectView(effect: blurrEffect)
        blurrView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight)
        self.view.addSubview(blurrView)

        instantiateAllButtons()

        self.crossButton.addTarget(self, action: "onCrossButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)

        self.titleLabel = self.viewModel.setTitleLabelInView(self.view)
    }

    // MARK: Button handlers

    func onCrossButtonPressed() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: Helper methods

    func instantiateAllButtons() {
        self.crossButton.frame = CGRectMake(Constant.Positioning.CrossXPosition, Constant.Positioning.CrossYPosition, Constant.Positioning.CrossSize, Constant.Positioning.CrossSize)
        self.crossButton.setBackgroundImage(UIImage(named: "cross-button-image"), forState: UIControlState.Normal)
        self.view.addSubview(self.crossButton)

        self.storyButton = self.viewModel.buttonInMenu(
            Constant.Positioning.XPositionLeftMenuButton,
            yPosition: Constant.Positioning.MenuButtonsSpacing + 15,
            image: "story-image",
            text: "STORY",
            view: self.view,
            tag: 0)

        self.projectsButton = self.viewModel.buttonInMenu(
            Constant.Positioning.XPositionRightMenuButton,
            yPosition: Constant.Positioning.MenuButtonsSpacing + 15,
            image: "work-image",
            text: "WORK",
            view: self.view,
            tag: 1)

        self.skillsetButton = self.viewModel.buttonInMenu(
            Constant.Positioning.XPositionLeftMenuButton,
            yPosition: (Constant.Positioning.MenuButtonsSpacing * 2) + Constant.Positioning.HeightMenuButton + 15,
            image: "skills-image",
            text: "SKILLS",
            view: self.view,
            tag: 2)

        self.videoButton = self.viewModel.buttonInMenu(
            Constant.Positioning.XPositionRightMenuButton,
            yPosition: (Constant.Positioning.MenuButtonsSpacing * 2) + Constant.Positioning.HeightMenuButton + 15,
            image: "video-image",
            text: "VIDEO",
            view: self.view,
            tag: 3)

        self.gameButton = self.viewModel.buttonInMenu(
            Constant.Positioning.XPositionLeftMenuButton,
            yPosition: (Constant.Positioning.MenuButtonsSpacing * 3) + (Constant.Positioning.HeightMenuButton * 2) + 15,
            image: "game-image",
            text: "GAME",
            view: self.view,
            tag: 4)

        self.contactButton = self.viewModel.buttonInMenu(
            Constant.Positioning.XPositionRightMenuButton,
            yPosition: (Constant.Positioning.MenuButtonsSpacing * 3) + (Constant.Positioning.HeightMenuButton * 2) + 15,
            image: "contact-image",
            text: "SOCIAL",
            view: self.view,
            tag: 5)
    }
}
