import UIKit

struct Constant {
    struct Setup {
        static let NumberOfPagesScrolling = 3 as Int
    }

    struct Size {
        static let DeviceWidth = UIScreen.mainScreen().bounds.width
        static let DeviceHeight = UIScreen.mainScreen().bounds.height
        static let RelationHeights = Constant.Size.DeviceHeight/480
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
    }
}

class ViewModel: NSObject {

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

    func buttonInMenu(xPosition: CGFloat, yPosition: CGFloat, image: String, text: String, view: UIView, tag: Int) -> UIButton {
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

        view.addSubview(button)

        return button
    }

    func setTitleLabelInView(view: UIView) -> UILabel {
        let label = UILabel(frame: CGRectMake(0, 23, Constant.Size.DeviceWidth, 33))
        label.text = "MENU"
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        label.font = UIFont_WWDC.titleFont()

        view.addSubview(label)

        return label
    }
}
