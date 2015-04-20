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
        static let NumberOfRows = 14
        static let MinimumPadding = 15 as CGFloat
        static let HeightOfImages = 400 * Constant.Size.RelationHeights/2 as CGFloat
        static let LineSpacingStory = 10 as CGFloat
    }
}

struct Text {
    struct Titles {
        static let StoryTitle = "Everyone has a story"
        static let StorySubtitle = "Here's mine, called dream..."
        static let StorySecondaryTitle = "A dream..."
    }
}

struct Story {
    static let One = "I believe everyone has a story to tell, something that would make someone smile, a story that would make other people feel…"

    static let Two = "image-passion-story"

    static let Three = "That's my passion, and those are my paths..."

    static let Four = "It all started..."

    static let Five = "My story in programming starts when I was a kid, I used to enter to my dad’s computer to look for some websites. I was amazed by the design on it, how you could see content from everywhere in the world, there I knew that at some point, I would do a website."

    static let Six = "The same happened when my father bought his first iPhone, the keyboard sensing his big fingers was something awesome, but not as stunning as the animation in the camera, I loved every aspect  of it, and I also knew, that one day I would know how to do an app."

    static let Seven = "image-chicago-story"

    static let Eight = "First time in the US, doing iOS, dream..."

    static let Nine = "Chicago"

    static let Ten = "After a summer working every day of the week to have some money in the bank, I bought my first MacBook Pro, I was 17 years old back then. Then it all started, I launched my most personal and big project, my portfolio, I was hungry to do more, I wanted to learn some languages, build some apps… I discovered Xcode, and  I spent lots of afternoons writing small apps, discovering new frameworks, until I was selected to go to an intense iOS academy in Chicago."

    static let Eleven = "web-image-story"

    static let Twelve = "My portfolio, my most personal project."

    static let Thirteen = "After two months and more than 40 small apps, I did my first big project using Multipeer and Geofencing and since then, I know this is my passion, this is what I want to be. Even though I’m in university most of the day, when I get home I try to build something new, combining it with some design and giving some pixels life…"

    static let Fourteen = "Buying a mac opened me the doors to what I wanted to become, to what I wanted to be, a designer and a coder, that was my dream and that’s my story. And I can't wait, for what's next..."

    static let Fiveteen = "wwdc-image-logo-by-apple"

    static let Sixteen = "I can't wait for what's next! (Image © Apple Inc.)"

    static let ArrayWithStory = [Story.One, Story.Two, Story.Three, Story.Four, Story.Five, Story.Six, Story.Seven, Story.Eight, Story.Nine, Story.Ten, Story.Eleven, Story.Twelve, Story.Thirteen, Story.Fourteen, Story.Fiveteen, Story.Sixteen]
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
}
