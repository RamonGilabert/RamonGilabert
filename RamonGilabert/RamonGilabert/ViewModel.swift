import UIKit

struct Constant {
    struct Setup {
        static let NumberOfPagesScrolling = 3 as Int
    }

    struct Size {
        static let DeviceWidth = UIScreen.mainScreen().bounds.width
        static let DeviceHeight = UIScreen.mainScreen().bounds.height
    }

    struct Positioning {
        static let WidthMenuButton = 75 * 1.2 as CGFloat
        static let HeightMenuButton = 94.6 * 1.2 as CGFloat
        static let XPositionLeftMenuButton = Constant.Size.DeviceWidth / 8
        static let XPositionRightMenuButton = Constant.Size.DeviceWidth - Constant.Positioning.XPositionLeftMenuButton - Constant.Positioning.WidthMenuButton
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

    func buttonInMenu(xPosition: CGFloat, yPosition: CGFloat, image: String, text: String, view: UIView) -> UIButton {
        let button = UIButton(frame: CGRectMake(
            xPosition,
            yPosition,
            Constant.Positioning.WidthMenuButton,
            Constant.Positioning.HeightMenuButton))

        let imageView = UIImageView(frame: CGRectMake((
            Constant.Positioning.WidthMenuButton - 39.5)/2,
            (Constant.Positioning.HeightMenuButton - 39.5)/2 - 9,
            39.5,
            39.5))

        imageView.image = UIImage(named: image)
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        button.addSubview(imageView)
        button.setBackgroundImage(UIImage(named: "menu-button-image"), forState: UIControlState.Normal)
        button.setTitle(text, forState: UIControlState.Normal)
        button.titleEdgeInsets = UIEdgeInsetsMake(140, 0, 0, 0)

        view.addSubview(button)

        return button
    }

    func setTitleLabelInView(view: UIView) {
        let label = UILabel(frame: CGRectMake(0, 23, Constant.Size.DeviceWidth, 33))
        label.text = "MENU"
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "AvenirNext-Regular", size: 24)

        view.addSubview(label)
    }
}
