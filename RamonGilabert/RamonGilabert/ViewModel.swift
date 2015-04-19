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
        static let WidthMenuButton = 75 * 1.3 as CGFloat
        static let HeightMenuButton = 94.6 * 1.3 as CGFloat
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
}
