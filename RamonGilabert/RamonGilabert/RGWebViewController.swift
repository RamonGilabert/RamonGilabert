import UIKit

class RGWebViewController: UIViewController {

    let transitionManager = CustomVideoTransition()
    var webView = UIWebView()
    var loadURL = ContactWebs.Website!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.transitioningDelegate = self.transitionManager

        let headerView = UIView(frame: CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight/9))
        headerView.backgroundColor = UIColor_WWDC.almostBlackColor()

        let crossButton = UIButton(frame: CGRectMake(20, (headerView.frame.height - 30)/2, 24, 24))
        crossButton.setBackgroundImage(UIImage(named: "cross-button-image"), forState: UIControlState.Normal)
        headerView.addSubview(crossButton)

        let backButton = UIButton(frame: CGRectMake(20, (headerView.frame.height - 30)/2, 24, 24))
        crossButton.setBackgroundImage(UIImage(named: "back-button-image"), forState: UIControlState.Normal)
        headerView.addSubview(crossButton)

        let forwardButton = UIButton(frame: CGRectMake(20, (headerView.frame.height - 30)/2, 24, 24))
        crossButton.setBackgroundImage(UIImage(named: "forward-button-image"), forState: UIControlState.Normal)
        headerView.addSubview(crossButton)

        self.view.addSubview(headerView)

        self.webView = UIWebView(frame: CGRectMake(0, Constant.Size.DeviceHeight/10, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight - Constant.Size.DeviceHeight/10))
        self.view.addSubview(self.webView)

        let requestURL = NSURLRequest(URL: self.loadURL)
        self.webView.loadRequest(requestURL)
    }
}
