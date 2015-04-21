import UIKit

struct Constant {
    struct Setup {
        static let NumberOfPagesScrolling = 3 as Int
    }

    struct Size {
        static let DeviceWidth = UIScreen.mainScreen().bounds.width
        static let DeviceHeight = UIScreen.mainScreen().bounds.height
        static let RelationHeights = (Constant.Size.DeviceHeight - 75)/480
    }

    struct Positioning {
        static let WidthMenuButton = 75 * Constant.Size.RelationHeights as CGFloat
        static let HeightMenuButton = 94.6 * Constant.Size.RelationHeights as CGFloat
        static let XPositionLeftMenuButton = Constant.Size.DeviceWidth / 8
        static let XPositionRightMenuButton = Constant.Size.DeviceWidth - Constant.Positioning.XPositionLeftMenuButton - Constant.Positioning.WidthMenuButton
        static let MenuButtonsSpacing = (Constant.Size.DeviceHeight - ((Constant.Positioning.HeightMenuButton) * 3) - 33) / 4
        static let CrossSize = 26.5 as CGFloat
        static let CrossXPosition = 19 as CGFloat
        static let CrossYPosition = 25 as CGFloat
        static let HeightOfHeaderStory = 70 * Constant.Size.RelationHeights
    }

    struct TableViewConstants {
        static let Identifier = "CellID"
        static let MinimumPadding = 15 as CGFloat
        static let HeightOfImages = 400 * Constant.Size.RelationHeights/2 as CGFloat
        static let LineSpacingStory = 10 as CGFloat
    }

    struct TableViewSkillVariables {
        static let HeightHeaderView = Constant.Size.DeviceHeight * 0.45
        static let ProfileImageSize = 130 * Constant.Size.RelationHeights/1.15
    }
}

class ViewModel: NSObject {

    // MARK: Main layout

    func initMainScrollViewInView(view: UIView) -> UIScrollView {

        let scrollView = UIScrollView(frame: CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight))
        scrollView.contentSize = CGSizeMake(Constant.Size.DeviceWidth * CGFloat(Constant.Setup.NumberOfPagesScrolling), Constant.Size.DeviceHeight)
        scrollView.backgroundColor = UIColor.whiteColor()
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false

        view.addSubview(scrollView)

        return scrollView
    }

    func initChildScrollViewsInView(view: UIView) -> UIScrollView {

        let scrollView = UIScrollView(frame: CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight))
        scrollView.contentSize = CGSizeMake(Constant.Size.DeviceWidth, Constant.Size.DeviceHeight * 5)

        view.addSubview(scrollView)

        return scrollView
    }

    // MARK: Menu layout

    func buttonInMenu(xPosition: CGFloat, yPosition: CGFloat, image: String, text: String, viewController: UIViewController, tag: Int) -> UIButton {
        let button = UIButton(frame: CGRectMake(
            xPosition,
            yPosition,
            Constant.Positioning.WidthMenuButton,
            Constant.Positioning.HeightMenuButton))

        button.setBackgroundImage(UIImage(named: image), forState: UIControlState.Normal)
        button.setTitle(text, forState: UIControlState.Normal)
        button.titleLabel!.font = UIFont_WWDC.menuButtonFont()
        button.titleEdgeInsets = UIEdgeInsetsMake(125 * Constant.Size.RelationHeights, 0, 0, 0)
        button.setTitleColor(UIColor_WWDC.highlightedColorButtons(), forState: UIControlState.Highlighted)
        button.addTarget(viewController, action: "onMenuButtonTouched:", forControlEvents: UIControlEvents.TouchUpInside)
        button.tag = tag

        viewController.view.addSubview(button)

        return button
    }

    // MENU: Story layout

    func setTitleLabelInView(view: UIView) -> UILabel {
        let label = UILabel(frame: CGRectMake(0, 23, Constant.Size.DeviceWidth, 33))
        label.text = "MENU"
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        label.font = UIFont_WWDC.titleFont()

        view.addSubview(label)

        return label
    }

    func setCoverImageWithGradient() -> UIImageView {
        let colorTop = UIColor(hue: 0, saturation: 0, brightness: 1, alpha: 0).CGColor
        let colorMiddle = UIColor(hue: 0, saturation: 0, brightness: 0.06, alpha: 0.6).CGColor
        let colorBottom = UIColor.blackColor().CGColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorMiddle, colorBottom ]
        gradientLayer.locations = [ 0.0, 0.6, 1.0 ]
        gradientLayer.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight)

        let imageView = UIImageView(image: UIImage(named: "background-image-menu-simulator"))
        imageView.frame = CGRectMake(0, -Constant.Size.DeviceHeight, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight)
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true

        imageView.layer.addSublayer(gradientLayer)

        return imageView
    }

    func setFullScreenTableView(view: UIView, delegate: UITableViewDelegate, dataSource: UITableViewDataSource) -> UITableView {
        let tableView = UITableView(frame: CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight))
        tableView.registerClass(RGStoryCustomTableViewCell.classForCoder(), forCellReuseIdentifier: Constant.TableViewConstants.Identifier)
        tableView.contentInset = UIEdgeInsetsMake(Constant.Size.DeviceHeight, 0, 0, 0)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.allowsSelection = false
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        view.addSubview(tableView)

        return tableView
    }

    func setTitleBlogPost(view: UIView) -> UILabel {
        let label = UILabel(frame: CGRectMake(20, 0, Constant.Size.DeviceWidth - 40, 0))
        label.text = Text.Titles.StoryTitle
        label.font = UIFont_WWDC.titleStoryFont()
        label.numberOfLines = 2
        label.textColor = UIColor.whiteColor()
        label.sizeToFit()
        label.frame = CGRectMake(20, (Constant.Size.DeviceHeight - label.frame.height) / 2 - 35, label.frame.width, label.frame.height)
        view.addSubview(label)

        return label
    }

    func setSubtitleBlogPost(view: UIView) -> UILabel {
        let label = UILabel(frame: CGRectMake(20, 0, Constant.Size.DeviceWidth - 40, 18))
        label.text = Text.Titles.StorySubtitle
        label.font = UIFont_WWDC.subTitleStoryFont()
        label.textColor = UIColor.whiteColor()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0
        view.addSubview(label)

        return label
    }

    func setSecondaryBlogPostLabel() -> UILabel {
        let label = UILabel(frame: CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Positioning.HeightOfHeaderStory))
        label.text = Text.Titles.StorySecondaryTitle
        label.font = UIFont_WWDC.secondaryTitleFont()
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        label.transform = CGAffineTransformMakeTranslation(0, -100)

        return label
    }

    func setBlurView(view: UIView) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight)
        view.addSubview(blurView)

        return blurView
    }

    func textLabelInBlogPost(text: String) -> UILabel {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = Constant.TableViewConstants.LineSpacingStory

        let label = UILabel(frame: CGRectMake(Constant.TableViewConstants.MinimumPadding, Constant.TableViewConstants.MinimumPadding, Constant.Size.DeviceWidth - (Constant.TableViewConstants.MinimumPadding * 2), 0))
        label.font = UIFont_WWDC.mainTextBlogPost()
        label.numberOfLines = 0
        label.attributedText = NSAttributedString(string: text, attributes: [NSParagraphStyleAttributeName : paragraphStyle])
        label.sizeToFit()
        label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.width, label.frame.height)

        return label
    }

    // MARK: Skills layout

    func setSkillTableView(view: UIView, delegate: UITableViewDelegate, dataSource: UITableViewDataSource) -> UITableView {
        let tableView = UITableView(frame: CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight))
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: Constant.TableViewConstants.Identifier)
        tableView.contentInset = UIEdgeInsetsMake(Constant.TableViewSkillVariables.HeightHeaderView, 0, 0, 0)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.allowsSelection = false
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        view.addSubview(tableView)

        return tableView
    }

    func setHeaderViewSkills(view: UIView, image: String) -> UIImageView {
        let imageView = UIImageView(frame: CGRectMake(0, -Constant.TableViewSkillVariables.HeightHeaderView, Constant.Size.DeviceWidth, Constant.TableViewSkillVariables.HeightHeaderView))
        imageView.image = UIImage(named: image)
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)

        return imageView
    }

    func setProfileImageSkills(view: UIView) -> UIImageView {
        let imageView = UIImageView(frame: CGRectMake((Constant.Size.DeviceWidth - Constant.TableViewSkillVariables.ProfileImageSize)/2, -Constant.TableViewSkillVariables.HeightHeaderView + (Constant.TableViewSkillVariables.HeightHeaderView - Constant.TableViewSkillVariables.ProfileImageSize)/2, Constant.TableViewSkillVariables.ProfileImageSize, Constant.TableViewSkillVariables.ProfileImageSize))
        imageView.image = UIImage(named: "profile-image-skills")
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.layer.borderColor = UIColor(red:0.51, green:0.82, blue:0.2, alpha:1).CGColor
        imageView.layer.borderWidth = 4
        view.addSubview(imageView)

        return imageView
    }
}
