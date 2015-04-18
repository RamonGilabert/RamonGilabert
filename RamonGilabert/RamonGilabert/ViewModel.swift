import UIKit

class ViewModel: NSObject {

    let deviceWidth = UIScreen.mainScreen().bounds.width
    let deviceHeight = UIScreen.mainScreen().bounds.height

    func initMainScrollViewInView(view: UIView) -> UIScrollView {

        let scrollView = UIScrollView(frame: CGRectMake(0, 0, self.deviceWidth, self.deviceHeight))
        scrollView.contentSize = CGSizeMake(self.deviceWidth * CGFloat(Constant.Setup.NumberOfPagesScrolling), self.deviceHeight)
        scrollView.backgroundColor = UIColor.whiteColor()
        scrollView.pagingEnabled = true

        view.addSubview(scrollView)

        return scrollView
    }
}
